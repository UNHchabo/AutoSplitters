// Super Metroid autosplitter, hosted at:
// https://github.com/UNHchabo/AutoSplitters
// 
// Basic format of the script is based on:
// https://github.com/Spiraster/ASLScripts/tree/master/LiveSplit.SMW
// 
// Most of the RAM values taken from:
// https://jathys.zophar.net/supermetroid/kejardon/RAMMap.txt

state("higan"){}
state("bsnes"){}
state("snes9x"){}
state("snes9x-x64"){}
state("emuhawk"){}
state("retroarch"){}

startup
{
    settings.Add("ammoPickups", true, "Ammo Pickups");
    settings.SetToolTip("ammoPickups", "Split on Missiles, Super Missiles, and Power Bombs");
    settings.Add("firstMissile", false, "First Missiles", "ammoPickups");
    settings.SetToolTip("firstMissile", "Split on the first Missile pickup");
    settings.Add("allMissiles", false, "All Missiles", "ammoPickups");
    settings.SetToolTip("allMissiles", "Split on each Missile upgrade");
    settings.Add("firstSuper", false, "First Supers", "ammoPickups");
    settings.SetToolTip("firstSuper", "Split on the first Super Missile pickup");
    settings.Add("allSupers", false, "All Super Missiles", "ammoPickups");
    settings.SetToolTip("allSupers", "Split on each Super Missile upgrade");
    settings.Add("firstPowerBomb", true, "First Power Bomb", "ammoPickups");
    settings.SetToolTip("firstPowerBomb", "Split on the first Power Bomb pickup");
    settings.Add("allPowerBombs", false, "All Power Bombs", "ammoPickups");
    settings.SetToolTip("allPowerBombs", "Split on each Power Bomb upgrade");

    settings.Add("suitUpgrades", true, "Suit Pickups");
    settings.SetToolTip("suitUpgrades", "Split on Varia and Gravity pickups");
    settings.Add("variaSuit", true, "Varia Suit", "suitUpgrades");
    settings.SetToolTip("variaSuit", "Split on picking up the Varia Suit");
    settings.Add("gravSuit", true, "Gravity Suit", "suitUpgrades");
    settings.SetToolTip("gravSuit", "Split on picking up the Gravity Suit");

    settings.Add("beamUpgrades", true, "Beam Upgrades");
    settings.SetToolTip("beamUpgrades", "Split on beam upgrades");
    settings.Add("chargeBeam", false, "Charge Beam", "beamUpgrades");
    settings.SetToolTip("chargeBeam", "Split on picking up the Charge Beam");
    settings.Add("spazer", false, "Spazer", "beamUpgrades");
    settings.SetToolTip("spazer", "Split on picking up the Spazer");
    settings.Add("wave", true, "Wave Beam", "beamUpgrades");
    settings.SetToolTip("wave", "Split on picking up the Wave Beam");
    settings.Add("ice", false, "Ice Beam", "beamUpgrades");
    settings.SetToolTip("ice", "Split on picking up the Ice Beam");
    settings.Add("plasma", false, "Plasma Beam", "beamUpgrades");
    settings.SetToolTip("plasma", "Split on picking up the Plasma Beam");

    settings.Add("bootUpgrades", false, "Boot Upgrades");
    settings.SetToolTip("bootUpgrades", "Split on boot upgrades");
    settings.Add("hiJump", false, "Hi-Jump Boots", "bootUpgrades");
    settings.SetToolTip("hiJump", "Split on picking up the Hi-Jump Boots");
    settings.Add("spaceJump", false, "Space Jump", "bootUpgrades");
    settings.SetToolTip("spaceJump", "Split on picking up Space Jump");
    settings.Add("speedBooster", false, "Speed Booster", "bootUpgrades");
    settings.SetToolTip("speedBooster", "Split on picking up the Speed Booster");

    settings.Add("energyUpgrades", false, "Energy Upgrades");
    settings.SetToolTip("energyUpgrades", "Split on Energy Tanks and Reserve Tanks");
    settings.Add("firstETank", false, "First Energy Tank", "energyUpgrades");
    settings.SetToolTip("firstETank", "Split on picking up the first Energy Tank");
    settings.Add("allETanks", false, "All Energy Tanks", "energyUpgrades");
    settings.SetToolTip("allETanks", "Split on picking up each Energy Tank");
    settings.Add("reserveTanks", false, "All Reserve Tanks", "energyUpgrades");
    settings.SetToolTip("reserveTanks", "Split on picking up each Reserve Tank");

    settings.Add("miscUpgrades", false, "Misc Upgrades");
    settings.SetToolTip("miscUpgrades", "Split on the miscellaneous upgrades");
    settings.Add("morphBall", false, "Morphing Ball", "miscUpgrades");
    settings.SetToolTip("morphBall", "Split on picking up the Morphing Ball");
    settings.Add("bomb", false, "Bomb",  "miscUpgrades");
    settings.SetToolTip("bomb", "Split on picking up the Bomb");
    settings.Add("springBall", false, "Spring Ball", "miscUpgrades");
    settings.SetToolTip("springBall", "Split on picking up the Spring Ball");
    settings.Add("screwAttack", false, "Screw Attack", "miscUpgrades");
    settings.SetToolTip("screwAttack", "Split on picking up the Screw Attack");
    settings.Add("grapple", false, "Grapple Beam", "miscUpgrades");
    settings.SetToolTip("grapple", "Split on picking up the Grapple Beam");
    settings.Add("xray", false, "X-Ray Scope", "miscUpgrades");
    settings.SetToolTip("xray", "Split on picking up the X-Ray Scope");

    settings.Add("areaTransitions", true, "Area Transitions");
    settings.SetToolTip("areaTransitions", "Split on transitions between areas");
    settings.Add("mapTransitions", true, "Map Transitions", "areaTransitions");
    settings.SetToolTip("mapTransitions", "Split on changing the map area (note: in vanilla layouts this will split when going through the Maridia Tube");
    settings.Add("ceresEscape", false, "Ceres Escape", "areaTransitions");
    settings.SetToolTip("ceresEscape", "Split on leaving Ceres Station");
    settings.Add("tubeBroken", false, "Tube Broken", "areaTransitions");
    settings.SetToolTip("tubeBroken", "Split on blowing up the tube to enter Maridia");

    settings.Add("miniBosses", false, "Minibosses");
    settings.SetToolTip("miniBosses", "Split on defeating minibosses");
    settings.Add("ceresRidley", false, "Ceres Ridley", "miniBosses");
    settings.SetToolTip("ceresRidley", "Split on starting the Ceres Escape");
    settings.Add("bombTorizo", false, "Bomb Torizo", "miniBosses");
    settings.SetToolTip("bombTorizo", "Split on Bomb Torizo's drops appearing");
    settings.Add("brinstarMiniboss", false, "Brinstar Miniboss", "miniBosses");
    settings.SetToolTip("brinstarMiniboss", "Split on beating the Brinstar Miniboss (Spore Spawn in vanilla)");
    settings.Add("crocomire", false, "Crocomire", "miniBosses");
    settings.SetToolTip("crocomire", "Split on Crocomire's drops appearing");
    settings.Add("botwoon", false, "Botwoon", "miniBosses");
    settings.SetToolTip("botwoon", "Split on Botwoon's vertical column being fully destroyed");
    settings.Add("goldenTorizo", false, "Golden Torizo", "miniBosses");
    settings.SetToolTip("goldenTorizo", "Split on Golden Torizo's drops appearing");

    settings.Add("bosses", true, "Bosses");
    settings.SetToolTip("bosses", "Split on defeating major bosses");
    settings.Add("kraid", false, "Kraid", "bosses");
    settings.SetToolTip("kraid", "Split shortly after Kraid's drops appear");
    settings.Add("phantoon", false, "Phantoon", "bosses");
    settings.SetToolTip("phantoon", "Split on Phantoon's drops appearing");
    settings.Add("draygon", false, "Draygon", "bosses");
    settings.SetToolTip("draygon", "Split on Draygon's drops appearing");
    settings.Add("ridley", true, "Ridley", "bosses");
    settings.SetToolTip("ridley", "Split on Ridley's drops appearing");
    settings.Add("mb3", false, "Mother Brain 3", "bosses");
    settings.SetToolTip("mb3", "Split on the start of the Zebes Escape");

    settings.Add("rtaFinish", true, "RTA Finish");
    settings.SetToolTip("rtaFinish", "Split on facing forward at the end of Zebes Escape");
    settings.Add("igtFinish", false, "IGT Finish");
    settings.SetToolTip("igtFinish", "Split on In-Game Time finalizing, when the end cutscene starts");

    // RoomIDs compiled here:
    // https://wiki.supermetroid.run/List_of_rooms_by_SMILE_ID
    vars.roomIDEnum = new Dictionary<string, int> {
        { "landingSite",                    0x91F8 },
        { "crateriaPowerBombRoom",          0x93AA },
        { "westOcean",                      0x93FE },
        { "elevatorToMaridia",              0x94CC },
        { "crateriaMoat",                   0x95FF },
        { "elevatorToCaterpillar",          0x962A },
        { "gauntletETankRoom",              0x965B },
        { "climb",                          0x96BA },
        { "pitRoom",                        0x975C },
        { "elevatorToMorphBall",            0x97B5 },
        { "bombTorizo",                     0x9804 },
        { "terminator",                     0x990D },
        { "elevatorToGreenBrinstar",        0x9938 },
        { "greenPirateShaft",               0x99BD },
        { "crateriaSupersRoom",             0x99F9 },
        { "theFinalMissile",                0x9A90 },
        { "greenBrinstarMainShaft",         0x9AD9 },
        { "sporeSpawnSuper",                0x9B5B },
        { "earlySupers",                    0x9BC8 },
        { "brinstarReserveRoom",            0x9C07 },
        { "bigPink",                        0x9D19 },
        { "sporeSpawnKeyhunter",            0x9D9C },
        { "sporeSpawn",                     0x9DC7 },
        { "pinkBrinstarPowerBombRoom",      0x9E11 },
        { "greenHills",                     0x9E52 },
        { "morphBall",                      0x9E9F },
        { "blueBrinstarETankRoom",          0x9F64 },
        { "etacoonETankRoom",               0xA011 },
        { "etacoonSuperRoom",               0xA051 },
        { "waterway",                       0xA0D2 },
        { "alphaMissileRoom",               0xA107 },
        { "hopperETankRoom",                0xA15B },
        { "billyMays",                      0xA1D8 },
        { "redTower",                       0xA253 },
        { "xRay",                           0xA2CE },
        { "caterpillar",                    0xA322 },
        { "betaPowerBombRoom",              0xA37C },
        { "alphaPowerBombsRoom",            0xA3AE },
        { "bat",                            0xA3DD },
        { "spazer",                         0xA447 },
        { "warehouseETankRoom",             0xA4B1 },
        { "warehouseZeela",                 0xA471 },
        { "warehouseKiHunters",             0xA4DA },
        { "kraidEyeDoor",                   0xA56B },
        { "kraid",                          0xA59F },
        { "statuesHallway",                 0xA5ED },
        { "statues",                        0xA66A },
        { "warehouseEntrance",              0xA6A1 },
        { "varia",                          0xA6E2 },
        { "cathedral",                      0xA788 },
        { "businessCenter",                 0xA7DE },
        { "iceBeam",                        0xA890 },
        { "crumbleShaft",                   0xA8F8 },
        { "crocomireSpeedway",              0xA923 },
        { "crocomire",                      0xA98D },
        { "hiJump",                         0xA9E5 },
        { "crocomireEscape",                0xAA0E },
        { "hiJumpShaft",                    0xAA41 },
        { "postCrocomirePowerBombRoom",     0xAADE },
        { "cosineRoom",                     0xAB3B },
        { "preGrapple",                     0xAB8F },
        { "grapple",                        0xAC2B },
        { "norfairReserveRoom",             0xAC5A },
        { "greenBubblesRoom",               0xAC83 },
        { "bubbleMountain",                 0xACB3 },
        { "speedBoostHall",                 0xACF0 },
        { "speedBooster",                   0xAD1B },
        { "singleChamber",                  0xAD5E }, // Exit room from Lower Norfair, also on the path to Wave
        { "doubleChamber",                  0xADAD },
        { "waveBeam",                       0xADDE },
        { "volcano",                        0xAE32 },
        { "kronicBoost",                    0xAE74 },
        { "magdolliteTunnel",               0xAEB4 },
        { "lowerNorfairElevator",           0xAF3F },
        { "risingTide",                     0xAFA3 },
        { "spikyAcidSnakes",                0xAFFB },
        { "acidStatue",                     0xB1E5 },
        { "mainHall",                       0xB236 }, // First room in Lower Norfair
        { "goldenTorizo",                   0xB283 },
        { "ridley",                         0xB32E },
        { "lowerNorfairFarming",            0xB37A },
        { "mickeyMouse",                    0xB40A },
        { "pillars",                        0xB457 },
        { "writg",                          0xB4AD },
        { "amphitheatre",                   0xB4E5 },
        { "lowerNorfairSpringMaze",         0xB510 },
        { "lowerNorfairEscapePowerBombRoom",0xB55A },
        { "redKiShaft",                     0xB585 },
        { "wasteland",                      0xB5D5 },
        { "metalPirates",                   0xB62B },
        { "threeMusketeers",                0xB656 },
        { "ridleyETankRoom",                0xB698 },
        { "screwAttack",                    0xB6C1 },
        { "lowerNorfairFireflea",           0xB6EE },
        { "bowling",                        0xC98E },
        { "wreckedShipEntrance",            0xCA08 },
        { "attic",                          0xCA52 },
        { "atticWorkerRobotRoom",           0xCAAE },
        { "wreckedShipMainShaft",           0xCAF6 },
        { "wreckedShipETankRoom",           0xCC27 },
        { "basement",                       0xCC6F }, // Basement of Wrecked Ship
        { "phantoon",                       0xCD13 },
        { "wreckedShipLeftSuperRoom",       0xCDA8 },
        { "wreckedShipRightSuperRoom",      0xCDF1 },
        { "gravity",                        0xCE40 },
        { "glassTunnel",                    0xCEFB },
        { "mainStreet",                     0xCFC9 },
        { "mamaTurtle",                     0xD055 },
        { "wateringHole",                   0xD13B },
        { "beach",                          0xD1DD },
        { "plasmaBeam",                     0xD2AA },
        { "maridiaElevator",                0xD30B },
        { "plasmaSpark",                    0xD340 },
        { "toiletBowl",                     0xD408 },
        { "oasis",                          0xD48E },
        { "leftSandPit",                    0xD4EF },
        { "rightSandPit",                   0xD51E },
        { "aqueduct",                       0xD5A7 },
        { "butterflyRoom",                  0xD5EC },
        { "botwoonHallway",                 0xD617 },
        { "springBall",                     0xD6D0 },
        { "precious",                       0xD78F },
        { "botwoonETankRoom",               0xD7E4 },
        { "botwoon",                        0xD95E },
        { "spaceJump",                      0xD9AA },
        { "westCactusAlley",                0xD9FE },
        { "draygon",                        0xDA60 },
        { "tourianElevator",                0xDAAE },
        { "metroidOne",                     0xDAE1 },
        { "metroidTwo",                     0xDB31 },
        { "metroidThree",                   0xDB7D },
        { "metroidFour",                    0xDBCD },
        { "dustTorizo",                     0xDC65 },
        { "tourianHopper",                  0xDC19 },
        { "tourianEyeDoor",                 0xDDC4 },
        { "bigBoy",                         0xDCB1 },
        { "motherBrain",                    0xDD58 },
        { "rinkaShaft",                     0xDDF3 },
        { "tourianEscape4",                 0xDEDE },
        { "ceresElevator",                  0xDF45 },
        { "flatRoom",                       0xE06B }, // Placeholder name for the flat room in Ceres Station
        { "ceresRidley",                    0xE0B5 }
    };

    vars.mapInUseEnum = new Dictionary<string, int>{
        { "crateria",   0x0 },
        { "brinstar",   0x1 },
        { "norfair",    0x2 },
        { "wreckedShip",0x3 },
        { "maridia",    0x4 },
        { "tourian",    0x5 },
        { "ceres",      0x6 }
    };

    vars.gameStateEnum = new Dictionary<string, int> {
        { "normalGameplay",         0x8 },
        { "doorTransition",         0xB },
        { "startOfCeresCutscene",   0x20 },
        { "preEndCutscene",         0x26 }, // briefly at this value during the black screen transition after the ship fades out
        { "endCutscene",            0x27 }
    };

    vars.unlockFlagEnum = new Dictionary<string, int>{
        // First item byte
        { "variaSuit",      0x1 },
        { "springBall",     0x2 },
        { "morphBall",      0x4 },
        { "screwAttack",    0x8 },
        { "gravSuit",       0x20},
        // Second item byte
        { "hiJump",         0x1 },
        { "spaceJump",      0x2 },
        { "bomb",           0x10},
        { "speedBooster",   0x20},
        { "grapple",        0x40},
        { "xray",           0x80},
        // Beams
        { "wave",           0x1 },
        { "ice",            0x2 },
        { "spazer",         0x4 },
        { "plasma",         0x8 },
        // Charge
        { "chargeBeam",     0x10}
    };

    vars.motherBrainMaxHPEnum = new Dictionary<string, int>{
        { "phase1", 0xBB8 },    // 3000
        { "phase2", 0x4650 },   // 18000
        { "phase3", 0x8CA0 }    // 36000
    };

    vars.eventFlagEnum = new Dictionary<string, int>{
        { "zebesAblaze",    0x40 },
        { "tubeBroken",     0x8 }
    };

    vars.bossFlagEnum = new Dictionary<string, int>{
        { "torizo",         0x4 },
        { "miniboss",       0x2 },
        { "boss",           0x1 },
    };

    vars.pickedUpSporeSpawnSuper = false;
    vars.pickedUpHundredthMissile = false;
    vars.frameRate = 60.0;

    Action<string> DebugOutput = (text) => {
        print("[Super Metroid Autosplitter] "+text);
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
            { 8953856, 0x975A54 },    // snes9x 1.59.2
            { 12537856, 0x1408D86F8 },// snes9x 1.59.2 (x64)
            { 9646080, 0x97EE04 },    // Snes9x-rr 1.60
            { 13565952, 0x140925118 },// Snes9x-rr 1.60 (x64)
            { 9027584, 0x94DB54 },    // snes9x 1.60
            { 12836864, 0x1408D8BE8 } // snes9x 1.60 (x64)
        };

        long pointerAddr;
        if (versions.TryGetValue(modules.First().ModuleMemorySize, out pointerAddr)) {
            memoryOffset = memory.ReadPointer((IntPtr)pointerAddr);
        }
    } else if (memory.ProcessName.ToLower().Contains("higan") || memory.ProcessName.ToLower().Contains("bsnes") || memory.ProcessName.ToLower().Contains("emuhawk")) {
        var versions = new Dictionary<int, long>{
            { 12509184, 0x915304 },      // higan v102
            { 13062144, 0x937324 },      // higan v103
            { 15859712, 0x952144 },      // higan v104
            { 16756736, 0x94F144 },      // higan v105tr1
            { 16019456, 0x94D144 },      // higan v106
            { 15360000, 0x8AB144 },      // higan v106.112
            { 22388736, 0xB0ECC8 },      // higan v107
            { 23142400, 0xBC7CC8 },      // higan v108
            { 23166976, 0xBCECC8 },      // higan v109
            { 23224320, 0xBDBCC8 },      // higan v110
            { 10096640, 0x72BECC },      // bsnes v107
            { 10338304, 0x762F2C },      // bsnes v107.1
            { 47230976, 0x765F2C },      // bsnes v107.2/107.3
            { 142282752, 0xA65464 },     // bsnes v108
            { 131354624, 0xA6ED5C },     // bsnes v109
            { 131543040, 0xA9BD5C },     // bsnes v110
            { 51924992, 0xA9DD5C },      // bsnes v111
            { 52056064, 0xAAED7C },      // bsnes v112
            // Unfortunately v113/114 cannot be supported with this style
            // of check because their size matches v115, with a different offset
            //{ 52477952, 0xB15D7C },      // bsnes v113/114
            { 52477952, 0xB16D7C },      // bsnes v115
            { 7061504,  0x36F11500240 }, // BizHawk 2.3
            { 7249920,  0x36F11500240 }, // BizHawk 2.3.1
            { 6938624,  0x36F11500240 }, // BizHawk 2.3.2
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
        new MemoryWatcher<ushort>(memoryOffset + 0x079B) { Name = "roomID" },
        new MemoryWatcher<byte>(memoryOffset + 0x079F) { Name = "mapInUse" },
        new MemoryWatcher<byte>(memoryOffset + 0x0998) { Name = "gameState" },
        new MemoryWatcher<byte>(memoryOffset + 0x09A4) { Name = "unlockedEquips2" },
        new MemoryWatcher<byte>(memoryOffset + 0x09A5) { Name = "unlockedEquips" },
        new MemoryWatcher<byte>(memoryOffset + 0x09A8) { Name = "unlockedBeams" },
        new MemoryWatcher<byte>(memoryOffset + 0x09A9) { Name = "unlockedCharge" },
        new MemoryWatcher<ushort>(memoryOffset + 0x09C4) { Name = "maxEnergy" },
        new MemoryWatcher<byte>(memoryOffset + 0x09C8) { Name = "maxMissiles" },
        new MemoryWatcher<byte>(memoryOffset + 0x09CC) { Name = "maxSupers" },
        new MemoryWatcher<byte>(memoryOffset + 0x09D0) { Name = "maxPowerBombs" },
        new MemoryWatcher<ushort>(memoryOffset + 0x09D4) { Name = "maxReserve" },
        new MemoryWatcher<byte>(memoryOffset + 0x09DA) { Name = "igtFrames" },
        new MemoryWatcher<byte>(memoryOffset + 0x09DC) { Name = "igtSeconds" },
        new MemoryWatcher<byte>(memoryOffset + 0x09DE) { Name = "igtMinutes" },
        new MemoryWatcher<byte>(memoryOffset + 0x09E0) { Name = "igtHours" },
        new MemoryWatcher<byte>(memoryOffset + 0x0A28) { Name = "playerState" },
        new MemoryWatcher<ushort>(memoryOffset + 0x0F8C) { Name = "enemyHP" },
        new MemoryWatcher<ushort>(memoryOffset + 0x0FB2) { Name = "shipAI" },
        new MemoryWatcher<ushort>(memoryOffset + 0x0FCC) { Name = "motherBrainHP" },
        new MemoryWatcher<byte>(memoryOffset + 0xD821) { Name = "eventFlags" },
        new MemoryWatcher<byte>(memoryOffset + 0xD828) { Name = "crateriaBosses" },
        new MemoryWatcher<byte>(memoryOffset + 0xD829) { Name = "brinstarBosses" },
        new MemoryWatcher<byte>(memoryOffset + 0xD82A) { Name = "norfairBosses" },
        new MemoryWatcher<byte>(memoryOffset + 0xD82B) { Name = "wreckedShipBosses" },
        new MemoryWatcher<byte>(memoryOffset + 0xD82C) { Name = "maridiaBosses" },
        new MemoryWatcher<byte>(memoryOffset + 0xD82D) { Name = "tourianBosses" },
        new MemoryWatcher<byte>(memoryOffset + 0xD82E) { Name = "ceresBosses" },
        new MemoryWatcher<byte>(memoryOffset + 0xD870) { Name = "crateriaItems" },
        new MemoryWatcher<byte>(memoryOffset + 0xD871) { Name = "brinteriaItems" },
        new MemoryWatcher<byte>(memoryOffset + 0xD872) { Name = "brinstarItems2" },
        new MemoryWatcher<byte>(memoryOffset + 0xD873) { Name = "brinstarItems3" },
        new MemoryWatcher<byte>(memoryOffset + 0xD874) { Name = "brinstarItems4" },
        new MemoryWatcher<byte>(memoryOffset + 0xD875) { Name = "brinstarItems5" },
        new MemoryWatcher<byte>(memoryOffset + 0xD876) { Name = "norfairItems1" },
        new MemoryWatcher<byte>(memoryOffset + 0xD877) { Name = "norfairItems2" },
        new MemoryWatcher<byte>(memoryOffset + 0xD878) { Name = "norfairItems3" },
        new MemoryWatcher<byte>(memoryOffset + 0xD879) { Name = "norfairItems4" },
        new MemoryWatcher<byte>(memoryOffset + 0xD87A) { Name = "norfairItems5" },
        new MemoryWatcher<byte>(memoryOffset + 0xD880) { Name = "wreckedShipItems" },
        new MemoryWatcher<byte>(memoryOffset + 0xD881) { Name = "maridiaItems1" },
        new MemoryWatcher<byte>(memoryOffset + 0xD882) { Name = "maridiaItems2" },
        new MemoryWatcher<byte>(memoryOffset + 0xD883) { Name = "maridiaItems3" },
    };
}

update
{
    vars.watchers.UpdateAll(game);
}

start
{
    var normalStart   = vars.watchers["gameState"].Old == 2    && vars.watchers["gameState"].Current == 0x1F;
    // Allow for a cutscene start, even though it's not normally used for speedrunning
    var cutsceneEnded = vars.watchers["gameState"].Old == 0x1E && vars.watchers["gameState"].Current == 0x1F;
    // Some categories start from Zebes, such as Spore Spawn RTA
    var zebesStart    = vars.watchers["gameState"].Old == 5    && vars.watchers["gameState"].Current == 6;
    if (normalStart || cutsceneEnded || zebesStart) {
        vars.DebugOutput("Timer started");
    }
    return normalStart || cutsceneEnded || zebesStart;
}

reset
{
    return vars.watchers["roomID"].Old != 0 && vars.watchers["roomID"].Current == 0;
}

split
{
    // Ammo pickup section
    var firstMissile = settings["firstMissile"] && (vars.watchers["gameState"].Current == vars.gameStateEnum["normalGameplay"]) && vars.watchers["maxMissiles"].Old == 0 && vars.watchers["maxMissiles"].Current > 0;
    var allMissiles = settings["allMissiles"] && (vars.watchers["gameState"].Current == vars.gameStateEnum["normalGameplay"]) && (vars.watchers["maxMissiles"].Old < vars.watchers["maxMissiles"].Current);
    var firstSuper = settings["firstSuper"] && (vars.watchers["gameState"].Current == vars.gameStateEnum["normalGameplay"]) && vars.watchers["maxSupers"].Old == 0 && vars.watchers["maxSupers"].Current > 0;
    var allSupers = settings["allSupers"] && (vars.watchers["gameState"].Current == vars.gameStateEnum["normalGameplay"]) && (vars.watchers["maxSupers"].Old < vars.watchers["maxSupers"].Current);
    var firstPowerBomb = settings["firstPowerBomb"] && (vars.watchers["gameState"].Current == vars.gameStateEnum["normalGameplay"]) && vars.watchers["maxPowerBombs"].Old == 0 && vars.watchers["maxPowerBombs"].Current > 0;
    var allPowerBombs = settings["allPowerBombs"] && (vars.watchers["gameState"].Current == vars.gameStateEnum["normalGameplay"]) && (vars.watchers["maxPowerBombs"].Old < vars.watchers["maxPowerBombs"].Current);
    var pickup = firstMissile || allMissiles || firstSuper || allSupers || firstPowerBomb || allPowerBombs;

    // Item unlock section
    var varia = settings["variaSuit"] && (vars.watchers["unlockedEquips2"].Old & vars.unlockFlagEnum["variaSuit"]) == 0 && (vars.watchers["unlockedEquips2"].Current & vars.unlockFlagEnum["variaSuit"]) > 0;
    var springBall = settings["springBall"] && (vars.watchers["unlockedEquips2"].Old & vars.unlockFlagEnum["springBall"]) == 0 && (vars.watchers["unlockedEquips2"].Current & vars.unlockFlagEnum["springBall"]) > 0;
    var morphBall = settings["morphBall"] && (vars.watchers["unlockedEquips2"].Old & vars.unlockFlagEnum["morphBall"]) == 0 && (vars.watchers["unlockedEquips2"].Current & vars.unlockFlagEnum["morphBall"]) > 0;
    var screwAttack = settings["screwAttack"] && (vars.watchers["unlockedEquips2"].Old & vars.unlockFlagEnum["screwAttack"]) == 0 && (vars.watchers["unlockedEquips2"].Current & vars.unlockFlagEnum["screwAttack"]) > 0;
    var gravSuit = settings["gravSuit"] && (vars.watchers["unlockedEquips2"].Old & vars.unlockFlagEnum["gravSuit"]) == 0 && (vars.watchers["unlockedEquips2"].Current & vars.unlockFlagEnum["gravSuit"]) > 0;
    var hiJump = settings["hiJump"] && (vars.watchers["unlockedEquips"].Old & vars.unlockFlagEnum["hiJump"]) == 0 && (vars.watchers["unlockedEquips"].Current & vars.unlockFlagEnum["hiJump"]) > 0;
    var spaceJump = settings["spaceJump"] && (vars.watchers["unlockedEquips"].Old & vars.unlockFlagEnum["spaceJump"]) == 0 && (vars.watchers["unlockedEquips"].Current & vars.unlockFlagEnum["spaceJump"]) > 0;
    var bomb = settings["bomb"] && (vars.watchers["unlockedEquips"].Old & vars.unlockFlagEnum["bomb"]) == 0 && (vars.watchers["unlockedEquips"].Current & vars.unlockFlagEnum["bomb"]) > 0;
    var speedBooster = settings["speedBooster"] && (vars.watchers["unlockedEquips"].Old & vars.unlockFlagEnum["speedBooster"]) == 0 && (vars.watchers["unlockedEquips"].Current & vars.unlockFlagEnum["speedBooster"]) > 0;
    var grapple = settings["grapple"] && (vars.watchers["unlockedEquips"].Old & vars.unlockFlagEnum["grapple"]) == 0 && (vars.watchers["unlockedEquips"].Current & vars.unlockFlagEnum["grapple"]) > 0;
    var xray = settings["xray"] && (vars.watchers["unlockedEquips"].Old & vars.unlockFlagEnum["xray"]) == 0 && (vars.watchers["unlockedEquips"].Current & vars.unlockFlagEnum["xray"]) > 0;
    var unlock = varia || springBall || morphBall || screwAttack || gravSuit || hiJump || spaceJump || bomb || speedBooster || grapple || xray;

    // Beam unlock section
    var wave = settings["wave"] && (vars.watchers["unlockedBeams"].Old & vars.unlockFlagEnum["wave"]) == 0 && (vars.watchers["unlockedBeams"].Current & vars.unlockFlagEnum["wave"]) > 0;
    var ice = settings["ice"] && (vars.watchers["unlockedBeams"].Old & vars.unlockFlagEnum["ice"]) == 0 && (vars.watchers["unlockedBeams"].Current & vars.unlockFlagEnum["ice"]) > 0;
    var spazer = settings["spazer"] && (vars.watchers["unlockedBeams"].Old & vars.unlockFlagEnum["spazer"]) == 0 && (vars.watchers["unlockedBeams"].Current & vars.unlockFlagEnum["spazer"]) > 0;
    var plasma = settings["plasma"] && (vars.watchers["unlockedBeams"].Old & vars.unlockFlagEnum["plasma"]) == 0 && (vars.watchers["unlockedBeams"].Current & vars.unlockFlagEnum["plasma"]) > 0;
    var chargeBeam = settings["chargeBeam"] && (vars.watchers["unlockedCharge"].Old & vars.unlockFlagEnum["chargeBeam"]) == 0 && (vars.watchers["unlockedCharge"].Current & vars.unlockFlagEnum["chargeBeam"]) > 0;
    var beam = wave || ice || spazer || plasma || chargeBeam;

    // E-tanks and reserve tanks
    var firstETank = settings["firstETank"] && vars.watchers["maxEnergy"].Old == 99 && vars.watchers["maxEnergy"].Current == 199;
    var allETanks = settings["allETanks"] && (vars.watchers["maxEnergy"].Old + 100) == (vars.watchers["maxEnergy"].Current);
    var reserveTanks = settings["reserveTanks"] && (vars.watchers["maxReserve"].Old + 100) == (vars.watchers["maxReserve"].Current);
    var energyUpgrade = firstETank || allETanks || reserveTanks;

    // Room transitions
    var mapTransitions = settings["mapTransitions"] && vars.watchers["gameState"].Current == vars.gameStateEnum["doorTransition"] && vars.watchers["mapInUse"].Old != vars.watchers["mapInUse"].Current;
    var ceresEscape = settings["ceresEscape"] && vars.watchers["roomID"].Current == vars.roomIDEnum["ceresElevator"] && vars.watchers["gameState"].Old == vars.gameStateEnum["normalGameplay"] && vars.watchers["gameState"].Current == vars.gameStateEnum["startOfCeresCutscene"];
    var tubeBroken = settings["tubeBroken"] && vars.watchers["roomID"].Current == vars.roomIDEnum["glassTunnel"] && (vars.watchers["eventFlags"].Old & vars.eventFlagEnum["tubeBroken"]) == 0 && (vars.watchers["eventFlags"].Current & vars.eventFlagEnum["tubeBroken"]) > 0;
    var roomTransitions = mapTransitions || ceresEscape || tubeBroken;
    if(roomTransitions){
        if(mapTransitions){
            vars.DebugOutput("Map transition");
        }
        if(ceresEscape){
            vars.DebugOutput("Ceres Escape");
        }
        if(tubeBroken){
            vars.DebugOutput("Tube Broken");
        }
    }

    // Torizos
    var crateriaTorizo = settings["crateriaTorizo"] && (vars.watchers["crateriaBosses"].Old & vars.bossFlagEnum["torizo"]) == 0 && (vars.watchers["crateriaBosses"].Current & vars.bossFlagEnum["torizo"]) > 0;
    var brinstarTorizo = settings["brinstarTorizo"] && (vars.watchers["brinstarBosses"].Old & vars.bossFlagEnum["torizo"]) == 0 && (vars.watchers["brinstarBosses"].Current & vars.bossFlagEnum["torizo"]) > 0;
    var maridiaTorizo = settings["maridiaTorizo"] && (vars.watchers["maridiaBosses"].Old & vars.bossFlagEnum["torizo"]) == 0 && (vars.watchers["brinstarBosses"].Current & vars.bossFlagEnum["torizo"]) > 0;
    var norfairTorizo = settings["norfairTorizo"] && (vars.watchers["norfairBosses"].Old & vars.bossFlagEnum["torizo"]) == 0 && (vars.watchers["norfairBosses"].Current & vars.bossFlagEnum["torizo"]) > 0;

    // Minibosses
    var ceresRidley = settings["ceresRidley"] && (vars.watchers["ceresBosses"].Old & vars.bossFlagEnum["miniboss"]) == 0 && (vars.watchers["ceresBosses"].Current & vars.bossFlagEnum["miniboss"]) > 0;
    var brinstarMiniboss = settings["brinstarMiniboss"] && (vars.watchers["brinstarBosses"].Old & vars.bossFlagEnum["miniboss"]) == 0 && (vars.watchers["brinstarBosses"].Current & vars.bossFlagEnum["miniboss"]) > 0;
    var norfairMiniboss = settings["norfairMiniboss"] && (vars.watchers["norfairBosses"].Old & vars.bossFlagEnum["miniboss"]) == 0 && (vars.watchers["norfairBosses"].Current & vars.bossFlagEnum["miniboss"]) > 0;
    var maridiaMiniboss = settings["maridiaMiniboss"] && (vars.watchers["maridiaBosses"].Old & vars.bossFlagEnum["miniboss"]) == 0 && (vars.watchers["maridiaBosses"].Current & vars.bossFlagEnum["miniboss"]) > 0;
    var minibossDefeat = ceresRidley || bombTorizo || sporeSpawn || crocomire || botwoon || goldenTorizo;

    // Bosses
    var kraid = settings["kraid"] && (vars.watchers["brinstarBosses"].Old & vars.bossFlagEnum["kraid"]) == 0 && (vars.watchers["brinstarBosses"].Current & vars.bossFlagEnum["kraid"]) > 0;
    if(kraid){
        vars.DebugOutput("Split due to kraid defeat");
    }
    var phantoon = settings["phantoon"] && (vars.watchers["wreckedShipBosses"].Old & vars.bossFlagEnum["phantoon"]) == 0 && (vars.watchers["wreckedShipBosses"].Current & vars.bossFlagEnum["phantoon"]) > 0;
    if(phantoon){
        vars.DebugOutput("Split due to phantoon defeat");
    }
    var draygon = settings["draygon"] && (vars.watchers["maridiaBosses"].Old & vars.bossFlagEnum["draygon"]) == 0 && (vars.watchers["maridiaBosses"].Current & vars.bossFlagEnum["draygon"]) > 0;
    if(draygon){
        vars.DebugOutput("Split due to draygon defeat");
    }
    var ridley = settings["ridley"] && (vars.watchers["norfairBosses"].Old & vars.bossFlagEnum["ridley"]) == 0 && (vars.watchers["norfairBosses"].Current & vars.bossFlagEnum["ridley"]) > 0;
    if(ridley){
        vars.DebugOutput("Split due to ridley defeat");
    }
    var mb3 = settings["mb3"] && (vars.watchers["tourianBosses"].Old & vars.bossFlagEnum["motherBrain"]) == 0 && (vars.watchers["tourianBosses"].Current & vars.bossFlagEnum["motherBrain"]) > 0;
    if(mb3){
        vars.DebugOutput("Split due to mb3 defeat");
    }
    if(vars.watchers["tourianBosses"].Old != vars.watchers["tourianBosses"].Current){
        vars.DebugOutput("Tourian Boss flags were: " + vars.watchers["tourianBosses"].Old + " Now they are " + vars.watchers["tourianBosses"].Current);
    }
    var bossDefeat = kraid || phantoon || draygon || ridley || mb1 || mb2 || mb3;

    // Run-ending splits
    var escape = settings["rtaFinish"] && (vars.watchers["eventFlags"].Current & vars.eventFlagEnum["zebesAblaze"]) > 0 && vars.watchers["shipAI"].Old != 0xaa4f && vars.watchers["shipAI"].Current == 0xaa4f;

    var takeoff = settings["igtFinish"] && vars.watchers["gameState"].Old == vars.gameStateEnum["preEndCutscene"] && vars.watchers["gameState"].Current == vars.gameStateEnum["endCutscene"];

    if(pickup){
        vars.DebugOutput("Split due to pickup");
    }
    if(unlock){
        vars.DebugOutput("Split due to unlock");
    }
    if(beam){
        vars.DebugOutput("Split due to beam upgrade");
    }
    if(energyUpgrade){
        vars.DebugOutput("Split due to energy upgrade");
    }
    if(roomTransitions){
        vars.DebugOutput("Split due to room transition");
    }
    if(minibossDefeat){
        vars.DebugOutput("Split due to miniboss defeat");
    }
    // individual boss defeat conditions already covered above
    if(escape){
        vars.DebugOutput("Split due to escape");
    }
    if(takeoff){
        vars.DebugOutput("Split due to takeoff");
    }

    return pickup || unlock || beam || energyUpgrade || roomTransitions || minibossDefeat || bossDefeat || escape || takeoff;
}

gameTime
{
    var frames  = vars.watchers["igtFrames"].Current;
    var seconds = vars.watchers["igtSeconds"].Current;
    var minutes = vars.watchers["igtMinutes"].Current;
    var hours   = vars.watchers["igtHours"].Current;

    if(frames == 0 && vars.watchers["igtFrames"].Old == 49){
        vars.frameRate = 50.0;
    }

    current.totalTime = (frames / vars.frameRate) + seconds + (60 * minutes) + (60 * 60 * hours);
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
