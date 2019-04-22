// Donkey Kong Country 2 autosplitter, hosted at:
// https://github.com/UNHchabo/AutoSplitters
// 
// Basic format of the script is based on:
// https://github.com/Spiraster/ASLScripts/tree/master/LiveSplit.SMW
// 
// Most of the RAM values taken from:
// https://retroachievements.org/Game/466

state("higan"){}
state("snes9x"){}
state("snes9x-x64"){}
state("emuhawk"){}
state("retroarch"){}

startup
{
    settings.Add("kremcoins", true, "Kremcoins");
    settings.SetToolTip("kremcoins", "Split on acquiring a Kremcoin");
    settings.Add("dkCoins", false, "DK Coins");
    settings.SetToolTip("dkCoins", "Split on acquiring a DK Coin");

    vars.musicEnum = new Dictionary<string, int> {
        { "startup",    0x0 },
        { "overworld",  0x1 },
        { "rareLogo",   0x11 },
        { "menu",       0x18 }
    };

    vars.frameRate = 60.0;

    Action<string> DebugOutput = (text) => {
        print("[DKC2 Autosplitter] "+text);
    };
    vars.DebugOutput = DebugOutput;
}

init
{
    IntPtr memoryOffset = IntPtr.Zero;

    if (memory.ProcessName.ToLower().Contains("snes9x")) {
        // TODO: These should probably be module-relative offsets too. Then
        // some of this codepath can be unified with the RA stuff below.
        var versions = new Dictionary<int, long>{
            { 10330112, 0x789414 },   // snes9x 1.52-rr
            { 7729152, 0x890EE4 },    // snes9x 1.54-rr
            { 5914624, 0x6EFBA4 },    // snes9x 1.53
            { 6909952, 0x140405EC8 }, // snes9x 1.53 (x64)
            { 6447104, 0x7410D4 },    // snes9x 1.54/1.54.1
            { 7946240, 0x1404DAF18 }, // snes9x 1.54/1.54.1 (x64)
            { 6602752, 0x762874 },    // snes9x 1.55
            { 8355840, 0x1405BFDB8 }, // snes9x 1.55 (x64)
            { 6856704, 0x78528C },    // snes9x 1.56/1.56.2
            { 9003008, 0x1405D8C68 }, // snes9x 1.56 (x64)
            { 6848512, 0x7811B4 },    // snes9x 1.56.1
            { 8945664, 0x1405C80A8 }, // snes9x 1.56.1 (x64)
            { 9015296, 0x1405D9298 }, // snes9x 1.56.2 (x64)
            { 6991872, 0x7A6EE4 },    // snes9x 1.57
            { 9048064, 0x1405ACC58 }, // snes9x 1.57 (x64)
            { 7000064, 0x7A7EE4 },    // snes9x 1.58
            { 9060352, 0x1405AE848 }, // snes9x 1.58 (x64)
        };

        long pointerAddr;
        if (versions.TryGetValue(modules.First().ModuleMemorySize, out pointerAddr)) {
            memoryOffset = memory.ReadPointer((IntPtr)pointerAddr);
        }
    } else if (memory.ProcessName.ToLower().Contains("higan") || memory.ProcessName.ToLower().Contains("emuhawk")) {
        var versions = new Dictionary<int, long>{
            { 12509184, 0x915304 },      // higan v102
            { 13062144, 0x937324 },      // higan v103
            { 15859712, 0x952144 },      // higan v104
            { 16756736, 0x94F144 },      // higan v105tr1
            { 16019456, 0x94D144 },      // higan v106
            { 7061504,  0x36F11500240 }, // BizHawk 2.3
            { 7249920,  0x36F11500240 }, // BizHawk 2.3.1
        };

        long wramAddr;
        if (versions.TryGetValue(modules.First().ModuleMemorySize, out wramAddr)) {
            memoryOffset = (IntPtr)wramAddr;
        }
    } else if (memory.ProcessName.ToLower().Contains("retroarch")) {
        // RetroArch stores a pointer to the emulated WRAM inside itself (it
        // can get this pointer via the Core API). This happily lets this work
        // on any variant of Snes9x cores, depending only on the RA version.

        var retroarchVersions = new Dictionary<int, int>{
            { 18649088, 0x608EF0 }, // Retroarch 1.7.5 (x64)
        };
        IntPtr wramPointer = IntPtr.Zero;
        int ptrOffset;
        if (retroarchVersions.TryGetValue(modules.First().ModuleMemorySize, out ptrOffset)) {
            wramPointer = memory.ReadPointer(modules.First().BaseAddress + ptrOffset);
        }

        if (wramPointer != IntPtr.Zero) {
            memoryOffset = wramPointer;
        } else {
            // Unfortunately, Higan doesn't support that API. So if the address
            // is missing, try to grab the memory from the higan core directly.

            var higanModule = modules.FirstOrDefault(m => m.ModuleName.ToLower() == "higan_sfc_libretro.dll");
            if (higanModule != null) {
                var versions = new Dictionary<int, int>{
                    { 4980736, 0x1F3AC4 }, // higan 106 (x64)
                };
                int wramOffset;
                if (versions.TryGetValue(higanModule.ModuleMemorySize, out wramOffset)) {
                    memoryOffset = higanModule.BaseAddress + wramOffset;
                }
            }
        }
    }

    if (memoryOffset == IntPtr.Zero) {
        vars.DebugOutput("Unsupported emulator version");
        var interestingModules = modules.Where(m =>
            m.ModuleName.ToLower().EndsWith(".exe") ||
            m.ModuleName.ToLower().EndsWith("_libretro.dll"));
        foreach (var module in interestingModules) {
            vars.DebugOutput("Module '" + module.ModuleName + "' sized " + module.ModuleMemorySize.ToString());
        }
        vars.watchers = new MemoryWatcherList{};
        // Throwing prevents initialization from completing. LiveSplit will
        // retry it until it eventually works. (Which lets you load a core in
        // RA for example.)
        throw new InvalidOperationException("Unsupported emulator version");
    }

    vars.DebugOutput("Found WRAM address: 0x" + memoryOffset.ToString("X8"));
    vars.watchers = new MemoryWatcherList
    {
        new MemoryWatcher<byte>(memoryOffset + 0x001C) { Name = "musicTrack" },
        new MemoryWatcher<uint>(memoryOffset + 0x00D5) { Name = "gametime" },
        new MemoryWatcher<byte>(memoryOffset + 0x08CC) { Name = "kremcoinCount" },
        new MemoryWatcher<byte>(memoryOffset + 0x08CE) { Name = "dkCoinCount" },
    };
}

update
{
    vars.watchers.UpdateAll(game);
}

start
{
    var startGame = vars.watchers["musicTrack"].Old == vars.musicEnum["menu"] && vars.watchers["musicTrack"].Current == vars.musicEnum["overworld"];
    if (startGame) {
        vars.DebugOutput("Timer started");
    }
    return startGame;
}

reset
{
    return vars.watchers["musicTrack"].Old == vars.musicEnum["startup"] && vars.watchers["musicTrack"].Current == vars.musicEnum["rareLogo"];
}

split
{

    var kremcoinPickup = settings["kremcoins"] && ((vars.watchers["kremcoinCount"].Old + 1) == vars.watchers["kremcoinCount"].Current);
    var dkCoinPickup = settings["dkCoins"] && ((vars.watchers["dkCoinCount"].Old + 1) == vars.watchers["dkCoinCount"].Current);

    if(kremcoinPickup){
        vars.DebugOutput("Split due to Kremcoin pickup");
    }
    if(dkCoinPickup){
        vars.DebugOutput("Split due to DK Coin pickup");
    }

    return kremcoinPickup || dkCoinPickup;
}

gameTime
{
    var frames  = vars.watchers["gametime"].Current;

    current.totalTime = (frames / vars.frameRate);
    return TimeSpan.FromSeconds(current.totalTime);
}

isLoading
{
    // From the AutoSplit documentation:
    // "If you want the Game Time to not run in between the synchronization interval and only ever return
    // the actual Game Time of the game, make sure to implement isLoading with a constant
    // return value of true."
    return true;
}
