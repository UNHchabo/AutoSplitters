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
	settings.SetToolTip("mb1", "Split on Mother Brain's head hitting the ground at the end of the first phase");
	settings.Add("mb2", true, "Mother Brain 2", "bosses");
	settings.SetToolTip("mb2", "Split on the Baby Metroid detaching from Mother Brain's head");
	settings.Add("mb3", false, "Mother Brain 3", "bosses");
	settings.SetToolTip("mb3", "Split on the start of the Zebes Escape");

	settings.Add("rtaFinish", true, "RTA Finish");
	settings.SetToolTip("rtaFinish", "Split on facing forward at the end of Zebes Escape");
	settings.Add("igtFinish", false, "IGT Finish");
	settings.SetToolTip("igtFinish", "Split on In-Game Time finalizing, when the end cutscene starts");


	vars.roomIDEnum = new Dictionary<string, int> {
		{ "landingSite",		0x91F8 },
		{ "singleChamber", 		0xAD5E }, // Exit room from Lower Norfair, also on the path to Wave
		{ "lowerNorfairElevator", 	0xAF3F },
		{ "mainHall", 			0xB236 }, // First room in Lower Norfair
		{ "threeMusketeers", 		0xB656 },
		{ "motherBrain",		0xDD58 }
	};

	vars.mapInUseEnum = new Dictionary<string, int>{
		{ "crateria",	0x0 },
		{ "brinstar",	0x1 },
		{ "norfair",	0x2 },
		{ "wreckedShip",0x3 },
		{ "maridia",	0x4 },
		{ "tourian",	0x5 },
		{ "ceres",	0x6 }
	};

	vars.gameStateEnum = new Dictionary<string, int> {
		{ "normalGameplay",		0x8 },
		{ "preEndCutscene",		0x26 }, // briefly at this value during the black screen transition after the ship fades out
		{ "endCutscene",		0x27 }
	};

	vars.unlockFlagEnum = new Dictionary<string, int>{
		// First item byte
		{ "variaSuit",		0x1 },
		{ "springBall",		0x2 },
		{ "morphBall",		0x4 },
		{ "screwAttack",	0x8 },
		{ "gravSuit",		0x20},
		// Second item byte
		{ "hiJump",		0x1 },
		{ "spaceJump",		0x2 },
		{ "bomb",		0x10},
		{ "speedBooster",	0x20},
		{ "grapple",		0x40},
		{ "xray",		0x80},
		// Beams
		{ "wave",		0x1 },
		{ "ice",		0x2 },
		{ "spazer",		0x4 },
		{ "plasma",		0x8 },
		// Charge
		{ "chargeBeam",		0x10}
	};

	vars.motherBrainMaxHPEnum = new Dictionary<string, int>{
		{ "phase1", 0xBB8 },
		{ "phase2", 0x4650 },
		{ "phase3", 0x8CA0 }
	};

	vars.bossFlagEnum = new Dictionary<string, int>{
		{ "motherBrain", 0x2 }
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
		new MemoryWatcher<ushort>((IntPtr)memoryOffset + 0x079B) { Name = "roomID" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x079F) { Name = "mapInUse" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x0998) { Name = "gameState" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09A4) { Name = "unlockedEquips2" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09A5) { Name = "unlockedEquips" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09A8) { Name = "unlockedBeams" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09A9) { Name = "unlockedCharge" },
		new MemoryWatcher<ushort>((IntPtr)memoryOffset + 0x09C4) { Name = "maxEnergy" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09C8) { Name = "maxMissiles" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09CC) { Name = "maxSupers" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09D0) { Name = "maxPowerBombs" },
		new MemoryWatcher<ushort>((IntPtr)memoryOffset + 0x09D4) { Name = "maxReserve" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09DA) { Name = "igtFrames" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09DC) { Name = "igtSeconds" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09DE) { Name = "igtMinutes" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x09E0) { Name = "igtHours" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x0A1C) { Name = "samusPose" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x0A1E) { Name = "poseDirection" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x0A28) { Name = "playerState" },
		new MemoryWatcher<ushort>((IntPtr)memoryOffset + 0x0A76) { Name = "hyperBeam" },
		new MemoryWatcher<byte>((IntPtr)memoryOffset + 0x0E17) { Name = "elevatorTransition" },
		new MemoryWatcher<ushort>((IntPtr)memoryOffset + 0x0F8C) { Name = "enemyHP" },
		new MemoryWatcher<ushort>((IntPtr)memoryOffset + 0x0FCC) { Name = "motherBrainHP" },
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
	var normalStart   = vars.watchers["gameState"].Old == 2    && vars.watchers["gameState"].Current == 0x1F;
	// Allow for a cutscene start, even though it's not normally used for speedrunning
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
	// Ammo pickup section
	var firstMissile = settings["firstMissile"] && vars.watchers["maxMissiles"].Old == 0 && vars.watchers["maxMissiles"].Current == 5;
	var allMissiles = settings["allMissiles"] && (vars.watchers["maxMissiles"].Old + 5) == (vars.watchers["maxMissiles"].Current);
	var firstSuper = settings["firstSuper"] && vars.watchers["maxSupers"].Old == 0 && vars.watchers["maxSupers"].Current == 5;
	var allSupers = settings["allSupers"] && (vars.watchers["maxSupers"].Old + 5) == (vars.watchers["maxSupers"].Current);
	var firstPowerBomb = settings["firstPowerBomb"] && vars.watchers["maxPowerBombs"].Old == 0 && vars.watchers["maxPowerBombs"].Current == 5;
	var allPowerBombs = settings["allPowerBombs"] && (vars.watchers["maxPowerBombs"].Old + 5) == (vars.watchers["maxPowerBombs"].Current);
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
	var beam = wave || ice || spazer || plasma;
	
	// Mother Brain phases
	var inMotherBrainRoom = vars.watchers["roomID"].Current == vars.roomIDEnum["motherBrain"];
	var mb1 = settings["mb1"] && inMotherBrainRoom && vars.watchers["motherBrainHP"].Old == 0 && vars.watchers["motherBrainHP"].Current == (vars.motherBrainMaxHPEnum["phase2"]);
	var mb2 = settings["mb2"] && inMotherBrainRoom && vars.watchers["motherBrainHP"].Old == 0 && vars.watchers["motherBrainHP"].Current == (vars.motherBrainMaxHPEnum["phase3"]);
	var mb3 = settings["mb3"] && (vars.watchers["tourianBosses"].Old & vars.bossFlagEnum["motherBrain"]) == 0 && (vars.watchers["tourianBosses"].Current & vars.bossFlagEnum["motherBrain"]) > 0;

	var bossDefeat = mb1 || mb2 || mb3;

	var escape = settings["rtaFinish"] && vars.watchers["tourianBosses"].Current == 2 && vars.watchers["samusPose"].Old != 0x9B && vars.watchers["samusPose"].Current == 0x9B && vars.watchers["poseDirection"].Old != 0 && vars.watchers["poseDirection"].Current == 0;

	var takeoff = settings["igtFinish"] && vars.watchers["roomID"].Current == vars.roomIDEnum["landingSite"] && vars.watchers["gameState"].Old == vars.gameStateEnum["preEndCutscene"] && vars.watchers["gameState"].Current == vars.gameStateEnum["endCutscene"];

	return pickup || unlock || beam || bossDefeat || escape || takeoff;
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
