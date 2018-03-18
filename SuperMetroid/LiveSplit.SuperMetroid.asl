// Super Metroid autosplitter, hosted at:
// https://github.com/UNHchabo/AutoSplitters
// 
// Basic format of the script is based on:
// https://github.com/Spiraster/ASLScripts/tree/master/LiveSplit.SMW
// 
// Most of the RAM values taken from:
// https://jathys.zophar.net/supermetroid/kejardon/RAMMap.txt

state("higan"){}
state("snes9x"){}
state("snes9x-x64"){}

startup
{
	settings.Add("ammoPickups", false, "Ammo Pickups");
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

	settings.Add("beamUpgrades", false, "Beam Upgrades");
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

	settings.Add("areaTransitions", false, "Area Transitions");
	settings.SetToolTip("areaTransitions", "Split on transitions between areas");
	settings.Add("ceresEscape", false, "Ceres Escape", "areaTransitions");
	settings.SetToolTip("ceresEscape", "Split on leaving Ceres Station");
	settings.Add("elevatorTransitions", false, "Elevator transitions", "areaTransitions");
	settings.SetToolTip("elevatorTransitions", "Split on elevator transitions between areas");
	settings.Add("lowerNorfairEntrance", false, "Lower Norfair Entrance", "areaTransitions");
	settings.SetToolTip("lowerNorfairEntrance", "Split on the elevator down to Lower Norfair");
	settings.Add("lowerNorfairExit", false, "Lower Norfair Exit", "areaTransitions");
	settings.SetToolTip("lowerNorfairExit", "Split on moving from the Three Musketeers' Room to the Single Chamber");

	settings.Add("miniBosses", false, "Minibosses");
	settings.SetToolTip("miniBosses", "Split on defeating minibosses");
	settings.Add("ceresRidley", false, "Ceres Ridley", "miniBosses");
	settings.SetToolTip("ceresRidley", "Split on finishing the Ceres Ridley fight");
	settings.Add("bombTorizo", false, "Bomb Torizo", "miniBosses");
	settings.SetToolTip("bombTorizo", "Split on defeating Bomb Torizo");
	settings.Add("sporeSpawn", false, "Spore Spawn", "miniBosses");
	settings.SetToolTip("sporeSpawn", "Split on defeating Spore Spawn");
	settings.Add("crocomire", false, "Crocomire", "miniBosses");
	settings.SetToolTip("crocomire", "Split on defeating Crocomire");
	settings.Add("botwoon", false, "Botwoon", "miniBosses");
	settings.SetToolTip("botwoon", "Split on defeating Botwoon");
	settings.Add("goldenTorizo", false, "Golden Torizo", "miniBosses");
	settings.SetToolTip("goldenTorizo", "Split on defeating Golden Torizo");

	settings.Add("bosses", false, "Bosses");
	settings.SetToolTip("bosses", "Split on defeating major bosses");
	settings.Add("kraid", false, "Kraid", "bosses");
	settings.SetToolTip("kraid", "Split on defeating Kraid");
	settings.Add("phantoon", false, "Phantoon", "bosses");
	settings.SetToolTip("phantoon", "Split on defeating Phantoon");
	settings.Add("draygon", false, "Draygon", "bosses");
	settings.SetToolTip("draygon", "Split on defeating Draygon");
	settings.Add("ridley", true, "Ridley", "bosses");
	settings.SetToolTip("ridley", "Split on defeating Ridley");
	settings.Add("mb1", false, "Mother Brain 1", "bosses");
	settings.SetToolTip("mb1", "Split on finishing Mother Brain's first phase");
	settings.Add("mb2", false, "Mother Brain 2", "bosses");
	settings.SetToolTip("mb2", "Split on finishing Mother Brain's second phase");
	settings.Add("mb3", false, "Mother Brain 3", "bosses");
	settings.SetToolTip("mb3", "Split on finishing Mother Brain's third phase");

	settings.Add("rtaFinish", true, "RTA Finish");
	settings.SetToolTip("rtaFinish", "Split on facing forward at the end of Zebes Escape");
	settings.Add("igtFinish", false, "IGT Finish");
	settings.SetToolTip("igtFinish", "Split on In-Game Time finalizing, when the end cutscene starts");



	vars.roomIDs = new Dictionary<string, int> {
		{ "singleChamber", 0xAD5E }, // Exit room from Lower Norfair, also on the path to Wave
		{ "lowerNorfairElevator", 0xAF3F },
		{ "mainHall", 0xB236 }, // First room in Lower Norfair
		{ "threeMusketeers", 0xB656 },
		{ "motherBrain", 0xDD58}
	};


	Action<string> DebugOutput = (text) => {
		print("[Super Metroid Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;
}

init
{
	int memoryOffset = 0;
	while (memoryOffset == 0)
	{
		switch (modules.First().ModuleMemorySize)
		{
			case 5914624: //snes9x (1.53)
				memoryOffset = memory.ReadValue<int>((IntPtr)0x6EFBA4);
				break;
			case 6909952: //snes9x (1.53-x64)
				memoryOffset = memory.ReadValue<int>((IntPtr)0x140405EC8);
				break;
			case 6447104: //snes9x (1.54.1)
				memoryOffset = memory.ReadValue<int>((IntPtr)0x7410D4);
				break;
			case 7946240: //snes9x (1.54.1-x64)
				memoryOffset = memory.ReadValue<int>((IntPtr)0x1404DAF18);
				break;
			case 6602752: //snes9x (1.55)
				memoryOffset = memory.ReadValue<int>((IntPtr)0x762874);
				break;
			case 8355840: //snes9x (1.55-x64)
				memoryOffset = memory.ReadValue<int>((IntPtr)0x1405BFDB8);
				break;
			case 12509184: //higan (v102)
				memoryOffset = 0x915304;
				break;
			case 13062144: //higan (v103)
				memoryOffset = 0x937324;
				break;
			case 15859712: //higan (v104)
				memoryOffset = 0x952144;
				break;
			case 16756736: //higan (v105tr1)
				memoryOffset = 0x94F144;
				break;
			case 16019456: //higan (v106)
				memoryOffset = 0x94D144;
				break;
			default:
				memoryOffset = 1;
				break;
		}
	}

	vars.watchers = new MemoryWatcherList
	{
		new MemoryWatcher<short>((IntPtr)memoryOffset + 0x079B) { Name = "roomID" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x079F) { Name = "mapInUse" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x0998) { Name = "gameState" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09A4) { Name = "unlockedEquips2" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09A5) { Name = "unlockedEquips" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09A8) { Name = "unlockedBeams" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09A9) { Name = "unlockedCharge" },
		new MemoryWatcher<short>((IntPtr)memoryOffset + 0x09C4) { Name = "maxEnergy" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09C8) { Name = "maxMissiles" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09CC) { Name = "maxSupers" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09D0) { Name = "maxPowerBombs" },
		new MemoryWatcher<short>((IntPtr)memoryOffset + 0x09D4) { Name = "maxReserve" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09DA) { Name = "igtFrames" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09DC) { Name = "igtSeconds" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09DE) { Name = "igtMinutes" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09E0) { Name = "igtHours" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x0A1C) { Name = "samusPose" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x0A1E) { Name = "poseDirection" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x0A28) { Name = "playerState" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x0E17) { Name = "elevatorTransition" },
		new MemoryWatcher<short>((IntPtr)memoryOffset + 0x0F8C) { Name = "enemyHP" },
		new MemoryWatcher<short>((IntPtr)memoryOffset + 0x0FCC) { Name = "motherBrainHP" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0xD828) { Name = "crateriaBosses" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0xD829) { Name = "brinstarBosses" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0xD82A) { Name = "norfairBosses" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0xD82B) { Name = "wreckedShipBosses" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0xD82C) { Name = "maridiaBosses" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0xD82D) { Name = "tourianBosses" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0xD82E) { Name = "ceresBosses" },
	};
}

update
{
	vars.watchers.UpdateAll(game);
}

start
{
	// Allow for a cutscene start, even though it's not normally used for speedrunning
	var normalStart   = vars.watchers["gameState"].Old == 2    && vars.watchers["gameState"].Current == 0x1F;
	var cutsceneEnded = vars.watchers["gameState"].Old == 0x1E && vars.watchers["gameState"].Current == 0x1F;
	// Some categories start from Zebes, such as Spore Spawn RTA
	var zebesStart    = vars.watchers["gameState"].Old == 5    && vars.watchers["gameState"].Current == 6;
	return normalStart || cutsceneEnded || zebesStart;
}

reset
{
	return vars.watchers["roomID"].Old != 0 && vars.watchers["roomID"].Current == 0;
}

split
{
	var inMotherBrainRoom = vars.watchers["roomID"].Current == vars.roomIDs["motherBrain"];

	var escape = settings["rtaFinish"] && vars.watchers["tourianBosses"].Current == 2 && vars.watchers["samusPose"].Old != 0x9B && vars.watchers["samusPose"].Current == 0x9B && vars.watchers["poseDirection"].Old != 0 && vars.watchers["poseDirection"].Current == 0;

	return escape;
}

gameTime
{
	var frames  = vars.watchers["igtFrames"].Current;
	var seconds = vars.watchers["igtSeconds"].Current;
	var minutes = vars.watchers["igtMinutes"].Current;
	var hours   = vars.watchers["igtHours"].Current;
	current.totalTime = (frames / 60.0) + seconds + (60 * minutes) + (60 * 60 * hours);
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
