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
	settings.Add("specificMissiles", false, "Specific Missile Packs", "ammoPickups");
	settings.SetToolTip("ammoPickups", "Split on specific Missile Pack locations");
	settings.Add("alphaMissiles", false, "Alpha Missile Pack", "specificMissiles");
	settings.SetToolTip("alphaMissiles", "Split on picking up the Alpha Missile Pack");
	settings.Add("chargeMissiles", false, "Charge Missile Pack", "specificMissiles");
	settings.SetToolTip("chargeMissiles", "Split on picking up the Charge Missile Pack");
	settings.Add("warehouseMissiles", false, "Warehouse Missile Pack", "specificMissiles");
	settings.SetToolTip("warehouseMissiles", "Split on picking up the Warehouse Missile Pack");
	settings.Add("hiJumpMissiles", false, "Hi-Jump Missile Pack", "specificMissiles");
	settings.SetToolTip("hiJumpMissiles", "Split on picking up the Hi-Jump Missile Pack");
	settings.Add("waveMissiles", false, "Wave Missile Pack", "specificMissiles");
	settings.SetToolTip("waveMissiles", "Split on picking up the Wave Missile Pack");
	settings.Add("wreckedShipMainShaftMissiles", false, "Wrecked Ship Main Shaft Missile Pack", "specificMissiles");
	settings.SetToolTip("wreckedShipMainShaftMissiles", "Split on picking up the Wrecked Ship Main Shaft Missile Pack");
	settings.Add("mainStreetMissiles", false, "Main Street Missile Pack", "specificMissiles");
	settings.SetToolTip("mainStreetMissiles", "Split on picking up the Main Street Missile Pack");
	settings.Add("firstSuper", false, "First Supers", "ammoPickups");
	settings.SetToolTip("firstSuper", "Split on the first Super Missile pickup");
	settings.Add("allSupers", false, "All Super Missiles", "ammoPickups");
	settings.SetToolTip("allSupers", "Split on each Super Missile upgrade");
	settings.Add("specificSupers", false, "Specific Super Missile Packs", "ammoPickups");
	settings.SetToolTip("ammoPickups", "Split on specific Super Missile Pack locations");
	settings.Add("earlySupers", false, "Early Supers Missile Pack", "specificSupers");
	settings.SetToolTip("earlySupers", "Split on picking up the Early Supers Missile Pack");
	settings.Add("sporeSpawnSupers", false, "Spore Spawn Super Missile Pack", "specificSupers");
	settings.SetToolTip("sporeSpawnSupers", "Split on picking up the Spore Spawn Super Missile Pack (NOTE: SSTRA splits when the dialogue box disappears, not on touch. Use Spore Spawn RTA Finish for SSTRA runs.)");
	settings.Add("wreckedShipLeftSupers", false, "Phantoon Super Missile Pack", "specificSupers");
	settings.SetToolTip("wreckedShipLeftSupers", "Split on picking up the Phantoon Super Missile Pack");
	settings.Add("crabSupers", false, "Crab Super Missile Pack", "specificSupers");
	settings.SetToolTip("crabSupers", "Split on picking up the Crab Super Missile Pack");
	settings.Add("aqueductSupers", false, "Aqueduct Super Missile Pack", "specificSupers");
	settings.SetToolTip("aqueductSupers", "Split on picking up the Aqueduct Super Missile Pack");
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
	settings.Add("specificETanks", false, "Specific Energy Tanks", "energyUpgrades");
	settings.SetToolTip("energyUpgrades", "Split on specific Energy Tank locations");
	settings.Add("gauntletETank", false, "Gauntlet Energy Tank", "specificETanks");
	settings.SetToolTip("gauntletETank", "Split on picking up the Gauntlet Energy Tank");
	settings.Add("terminatorETank", false, "Terminator Energy Tank", "specificETanks");
	settings.SetToolTip("terminatorETank", "Split on picking up the terminator Energy Tank");
	settings.Add("ceilingETank", false, "Brinstar Ceiling Energy Tank", "specificETanks");
	settings.SetToolTip("ceilingETank", "Split on picking up the Brinstar ceiling Energy Tank");
	settings.Add("etecoonsETank", false, "Etecoons Energy Tank", "specificETanks");
	settings.SetToolTip("etecoonsETank", "Split on picking up the troll etecoons Energy Tank");
	settings.Add("waterwayETank", false, "Waterway Energy Tank", "specificETanks");
	settings.SetToolTip("waterwayETank", "Split on picking up the waterway Energy Tank");
	settings.Add("waveGateETank", false, "Brinstar Gate Energy Tank", "specificETanks");
	settings.SetToolTip("waveGateETank", "Split on picking up the Brinstar wave gate Energy Tank");
	settings.Add("kraidETank", false, "Kraid Energy Tank", "specificETanks");
	settings.SetToolTip("kraidETank", "Split on picking up the Kraid Energy Tank");
	settings.Add("crocomireETank", false, "Crocomire Energy Tank", "specificETanks");
	settings.SetToolTip("crocomireETank", "Split on picking up the Crocomire Energy Tank");
	settings.Add("hiJumpETank", false, "Hi-Jump Boots Energy Tank", "specificETanks");
	settings.SetToolTip("hiJumpETank", "Split on picking up the Hi-Jump Energy Tank");
	settings.Add("ridleyETank", false, "Ridley Energy Tank", "specificETanks");
	settings.SetToolTip("ridleyETank", "Split on picking up the post-Ridley Energy Tank");
	settings.Add("firefleaETank", false, "Firefleas Energy Tank", "specificETanks");
	settings.SetToolTip("firefleaETank", "Split on picking up the fireflea Energy Tank");
	settings.Add("wreckedShipETank", false, "Wrecked Ship Energy Tank", "specificETanks");
	settings.SetToolTip("wreckedShipETank", "Split on picking up the Wrecked Ship Energy Tank");
	settings.Add("tatoriETank", false, "Mama Turtle Energy Tank", "specificETanks");
	settings.SetToolTip("tatoriETank", "Split on picking up the Mama Turtle Energy Tank");
	settings.Add("botwoonETank", false, "Botwoon Energy Tank", "specificETanks");
	settings.SetToolTip("botwoonETank", "Split on picking up the Botwoon Energy Tank");

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
	settings.Add("miniBossRooms", false, "Miniboss Rooms", "areaTransitions");
	settings.SetToolTip("miniBossRooms", "Split on entering miniboss rooms (except Bomb Torizo)");
	settings.Add("bossRooms", false, "Boss Rooms", "areaTransitions");
	settings.SetToolTip("bossRooms", "Split on entering major boss rooms");
	settings.Add("elevatorTransitions", false, "Elevator transitions", "areaTransitions");
	settings.SetToolTip("elevatorTransitions", "Split on elevator transitions between areas (except Statue Room to Tourian)");
	settings.Add("ceresEscape", false, "Ceres Escape", "areaTransitions");
	settings.SetToolTip("ceresEscape", "Split on leaving Ceres Station");
	settings.Add("wreckedShipEntrance", false, "Wrecked Ship Entrance", "areaTransitions");
	settings.SetToolTip("wreckedShipEntrance", "Split on entering the Wrecked Ship Entrance from the lower door of West Ocean");
	settings.Add("redTowerBottomEntrance", false, "Red Tower Bottom Entrance", "areaTransitions");
	settings.SetToolTip("redTowerBottomEntrance", "Split on entering Red Tower from Skree Boost room");
	settings.Add("kraidsLair", false, "Kraid's Lair", "areaTransitions");
	settings.SetToolTip("kraidsLair", "Split on entering Kraid's Lair");
	settings.Add("atticExit", false, "Attic Exit", "areaTransitions");
	settings.SetToolTip("atticExit", "Split on exiting Attic");
	settings.Add("tubeBroken", false, "Tube Broken", "areaTransitions");
	settings.SetToolTip("tubeBroken", "Split on blowing up the tube to enter Maridia");
	settings.Add("cacExit", false, "Cacatack Alley Exit", "areaTransitions");
	settings.SetToolTip("cacExit", "Split on exiting West Cacattack Alley");
	settings.Add("kronicBoost", false, "Kronic Boost Room", "areaTransitions");
	settings.SetToolTip("kronicBoost", "Split on entering Kronic Boost room");
	settings.Add("lowerNorfairEntrance", false, "Lower Norfair Entrance", "areaTransitions");
	settings.SetToolTip("lowerNorfairEntrance", "Split on the elevator down to Lower Norfair");
	settings.Add("writg", false, "Worst Room in the Game", "areaTransitions");
	settings.SetToolTip("writg", "Split on entering Worst Room in the Game");
	settings.Add("redKiShaft", false, "Red Kihunter Shaft", "areaTransitions");
	settings.SetToolTip("redKiShaft", "Split on entering Red Kihunter Shaft from either Amphitheatre or Wastelands (NOTE: will split twice)");
	settings.Add("metalPirates", false, "Metal Pirates Room", "areaTransitions");
	settings.SetToolTip("metalPirates", "Split on entering Metal Pirates Room from Wasteland");
	settings.Add("lowerNorfairSpringMaze", false, "Lower Norfair Springball Maze Room", "areaTransitions");
	settings.SetToolTip("lowerNorfairSpringMaze", "Split on entering Lower Norfair Springball Maze Room");
	settings.Add("lowerNorfairExit", false, "Lower Norfair Exit", "areaTransitions");
	settings.SetToolTip("lowerNorfairExit", "Split on moving from the Three Musketeers' Room to the Single Chamber");
	settings.Add("goldenFour", true, "Golden Four", "areaTransitions");
	settings.SetToolTip("goldenFour", "Split on entering the Statues Room with all four major bosses defeated");
	settings.Add("tourianEntrance", false, "Tourian Entrance", "areaTransitions");
	settings.SetToolTip("tourianEntrance", "Split on the elevator down to Tourian");
	settings.Add("metroids", false, "Tourian Metroid Rooms", "areaTransitions");
	settings.SetToolTip("metroids", "Split on exiting each of the Metroid rooms in Tourian");
	settings.Add("babyMetroidRoom", false, "Baby Metroid Room", "areaTransitions");
	settings.SetToolTip("babyMetroidRoom", "Split on moving from the Dust Torizo Room to the Big Boy Room");
	settings.Add("escapeClimb", false, "Tourian Exit", "areaTransitions");
	settings.SetToolTip("escapeClimb", "Split on moving from Tourian Escape Room 4 to The Climb");

	settings.Add("miniBosses", false, "Minibosses");
	settings.SetToolTip("miniBosses", "Split on defeating minibosses");
	settings.Add("ceresRidley", false, "Ceres Ridley", "miniBosses");
	settings.SetToolTip("ceresRidley", "Split on starting the Ceres Escape");
	settings.Add("bombTorizo", false, "Bomb Torizo", "miniBosses");
	settings.SetToolTip("bombTorizo", "Split on Bomb Torizo's drops appearing");
	settings.Add("sporeSpawn", false, "Spore Spawn", "miniBosses");
	settings.SetToolTip("sporeSpawn", "Split on the last hit to Spore Spawn");
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
	settings.Add("sporeSpawnRTAFinish", false, "Spore Spawn RTA Finish");
	settings.SetToolTip("sporeSpawnRTAFinish", "Split on the end of a Spore Spawn RTA run, when the text box clears after collecting the Super Missiles");
	settings.Add("hundredMissileRTAFinish", false, "100 Missile RTA Finish");
	settings.SetToolTip("hundredMissileRTAFinish", "Split on the end of a 100 Missile RTA run, when the text box clears after collecting the hundredth missile");

	// RoomIDs compiled here:
	// https://wiki.supermetroid.run/List_of_RoomIDs
	vars.roomIDEnum = new Dictionary<string, int> {
		{ "landingSite",			0x91F8 },
		{ "attic",					0xCA52 },
		{ "metroidOne",				0xDAE1 },
		{ "metroidTwo",				0xDB31 },
		{ "metroidThree",			0xDB7D },
		{ "metroidFour",			0xDBCD },
		{ "tourianHopper",			0xDC19 },
		{ "tourianEyeDoor",			0xDDC4 },
		{ "lowerNorfairSpringMaze",		0xB510 },
		{ "lowerNorfairFireflea",		0xB6EE },
		{ "redKiShaft",				0xB585 },
		{ "amphitheatre",			0xB4E5 },
		{ "wasteland",				0xB5D5 },
		{ "pillars",				0xB457 },
		{ "writg",					0xB4AD },
		{ "metalPirates",			0xB62B },
		{ "volcano",				0xAE32 },
		{ "kronicBoost",			0xAE74 },
		{ "magdolliteTunnel",			0xAEB4 },
		{ "spikyAcidSnakes",		0xAFFB },
		{ "westCactusAlley",			0xD9FE },
		{ "butterflyRoom",			0xD5EC },
		{ "warehouseEntrance",			0xA6A1 },
		{ "warehouseZeela",			0xA471 },
		{ "redTower",				0xA253 },
		{ "bat",				0xA3DD },
		{ "westOcean",				0x93FE },
		{ "elevatorToMaridia",		0x94CC },
		{ "elevatorToCaterpillar",	0x962A },
		{ "climb",					0x96BA },
		{ "elevatorToMorphBall",	0x97B5 },
		{ "bombTorizo",				0x9804 },
		{ "elevatorToGreenBrinstar",0x9938 },
		{ "greenBrinstarMainShaft",	0x9AD9 },
		{ "sporeSpawnSuper",		0x9B5B },
		{ "sporeSpawnKeyhunter",	0x9D9C },
		{ "sporeSpawn",			0x9DC7 },
		{ "morphBall",			0x9E9F },
		{ "caterpillar",		0xA322 },
		{ "kraidEyeDoor",		0xA56B },
		{ "kraid",			0xA59F },
		{ "statuesHallway",		0xA5ED },
		{ "statues",			0xA66A },
		{ "tourianElevator",			0xDAAE },
		{ "businessCenter",			0xA7DE },
		{ "crocomireSpeedway",		0xA923 },
		{ "crocomire",				0xA98D },
		{ "singleChamber", 			0xAD5E }, // Exit room from Lower Norfair, also on the path to Wave
		{ "lowerNorfairElevator", 	0xAF3F },
		{ "acidStatue",				0xB1E5 },
		{ "mainHall", 				0xB236 }, // First room in Lower Norfair
		{ "goldenTorizo",			0xB283 },
		{ "ridley",					0xB32E },
		{ "lowerNorfairFarming",	0xB37A },
		{ "threeMusketeers", 		0xB656 },
		{ "screwAttack",			0xB6C1 },
		{ "wreckedShipEntrance",	0xCA08 },
		{ "basement",				0xCC6F }, // Basement of Wrecked Ship
		{ "phantoon",				0xCD13 },
		{ "glassTunnel",			0xCEFB },
		{ "maridiaElevator",		0xD30B },
		{ "botwoonHallway",			0xD617 },
		{ "precious",				0xD78F },
		{ "botwoon",				0xD95E },
		{ "draygon",				0xDA60 },
		{ "dustTorizo",				0xDC65 },
		{ "bigBoy",					0xDCB1 },
		{ "motherBrain",			0xDD58 },
		{ "rinkaShaft",				0xDDF3 },
		{ "tourianEscape4",			0xDEDE },
		{ "ceresElevator",			0xDF45 },
		{ "flatRoom",				0xE06B }, // Placeholder name for the flat room in Ceres Station
		{ "ceresRidley",			0xE0B5 }
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
		{ "doorTransition",		0xB },
		{ "startOfCeresCutscene",	0x20 },
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

	vars.missileWatchKeys = new Dictionary<string, string> {
		{ "chargeMissiles", "brinstarItems2" },
		{ "alphaMissiles", "brinstarItems4" },
		{ "warehouseMissiles", "brinstarItems5" },
		{ "hiJumpMissiles", "norfairItems1" },
		{ "waveMissiles", "norfairItems3" },
		{ "wreckedShipMainShaftMissiles", "wreckedShipItems" },
		{ "mainStreetMissiles", "maridiaItems1" },
	};

	vars.missileMasks = new Dictionary<string, int> {
		{ "chargeMissiles", 0x40 },
		{ "alphaMissiles", 0x04 },
		{ "warehouseMissiles", 0x10 },
		{ "hiJumpMissiles", 0x80 },
		{ "waveMissiles", 0x08 },
		{ "wreckedShipMainShaftMissiles", 0x01 },
		{ "mainStreetMissiles", 0x01 },
	};

	vars.superWatchKeys = new Dictionary<string, string> {
		{ "sporeSpawnSupers", "brinteriaItems" },
		{ "earlySupers", "brinstarItems2" },
		{ "wreckedShipLeftSupers", "wreckedShipItems" },
		{ "crabSupers", "maridiaItems1" },
		{ "aqueductSupers", "maridiaItems2" },
	};

	vars.superMasks = new Dictionary<string, int> {
		{ "sporeSpawnSupers", 0x40 },
		{ "earlySupers", 0x01 },
		{ "wreckedShipLeftSupers", 0x20 },
		{ "crabSupers", 0x02 },
		{ "aqueductSupers", 0x20 },
	};	

	vars.etankWatchKeys = new Dictionary<string, string> {
	    { "gauntletETank", "crateriaItems" },
	    { "terminatorETank", "brinteriaItems" },
	    { "ceilingETank", "brinstarItems3" },
	    { "etecoonsETank", "brinstarItems3" },
	    { "waterwayETank", "brinstarItems4" },
	    { "waveGateETank", "brinstarItems4" },
	    { "kraidETank", "brinstarItems5" },
	    { "crocomireETank", "norfairItems1" },
	    { "hiJumpETank", "norfairItems2" },
	    { "ridleyETank", "norfairItems4" },
	    { "firefleaETank", "norfairItems5" },
	    { "wreckedShipETank", "wreckedShipItems" },
	    { "tatoriETank", "maridiaItems1" },
	    { "botwoonETank", "maridiaItems3" },
	};

	vars.etankMasks = new Dictionary<string, int> {
	    { "gauntletETank", 0x20 },
	    { "terminatorETank", 0x01 },
	    { "ceilingETank", 0x20 },
	    { "etecoonsETank", 0x40 },
	    { "waterwayETank", 0x02 },
	    { "waveGateETank", 0x08 },
	    { "kraidETank", 0x08 },
	    { "crocomireETank", 0x10 },
	    { "hiJumpETank", 0x01 },
	    { "ridleyETank", 0x40 },
	    { "firefleaETank", 0x01 },
	    { "wreckedShipETank", 0x10 },
	    { "tatoriETank", 0x04 },
	    { "botwoonETank", 0x01 },
	};

	vars.motherBrainMaxHPEnum = new Dictionary<string, int>{
		{ "phase1", 0xBB8 },	// 3000
		{ "phase2", 0x4650 },	// 18000
		{ "phase3", 0x8CA0 }	// 36000
	};

	vars.eventFlagEnum = new Dictionary<string, int>{
		{ "zebesAblaze", 0x40 },
		{ "tubeBroken", 0x8 }
	};

	vars.bossFlagEnum = new Dictionary<string, int>{
		// Crateria
		{ "bombTorizo",		0x4 },
		// Brinstar
		{ "sporeSpawn",		0x2 },
		{ "kraid",		0x1 },
		// Norfair
		{ "ridley",		0x1 },
		{ "crocomire",		0x2 },
		{ "goldenTorizo",	0x4 },
		// Wrecked Ship
		{ "phantoon",		0x1 },
		// Maridia
		{ "draygon",		0x1 },
		{ "botwoon",		0x2 },
		// Tourian
		{ "motherBrain",	0x2 },
		// Ceres
		{ "ceresRidley",	0x1 }
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
		};

		long pointerAddr;
		if (versions.TryGetValue(modules.First().ModuleMemorySize, out pointerAddr)) {
			memoryOffset = memory.ReadPointer((IntPtr)pointerAddr);
		}
	} else if (memory.ProcessName.ToLower().Contains("higan") || memory.ProcessName.ToLower().Contains("emuhawk")) {
		var versions = new Dictionary<int, long>{
			{ 12509184, 0x915304 },	     // higan v102
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
		new MemoryWatcher<byte>(memoryOffset + 0x0A1C) { Name = "samusPose" },
		new MemoryWatcher<byte>(memoryOffset + 0x0A1E) { Name = "poseDirection" },
		new MemoryWatcher<byte>(memoryOffset + 0x0A28) { Name = "playerState" },
		new MemoryWatcher<ushort>(memoryOffset + 0x0F8C) { Name = "enemyHP" },
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
	var firstMissile = settings["firstMissile"] && vars.watchers["maxMissiles"].Old == 0 && vars.watchers["maxMissiles"].Current == 5;
	var allMissiles = settings["allMissiles"] && (vars.watchers["maxMissiles"].Old + 5) == (vars.watchers["maxMissiles"].Current);
	var specificMissile = false;
	foreach (string missile in vars.missileMasks.Keys) {
			specificMissile |= settings[missile]
					&& ((vars.watchers[vars.missileWatchKeys[missile]].Current & vars.missileMasks[missile]) != 0)
					&& ((vars.watchers[vars.missileWatchKeys[missile]].Old & vars.missileMasks[missile]) == 0);
	}
	var firstSuper = settings["firstSuper"] && vars.watchers["maxSupers"].Old == 0 && vars.watchers["maxSupers"].Current == 5;
	var allSupers = settings["allSupers"] && (vars.watchers["maxSupers"].Old + 5) == (vars.watchers["maxSupers"].Current);
	var specificSuper = false;
	foreach (string super in vars.superMasks.Keys) {
			specificSuper |= settings[super]
					&& ((vars.watchers[vars.superWatchKeys[super]].Current & vars.superMasks[super]) != 0)
					&& ((vars.watchers[vars.superWatchKeys[super]].Old & vars.superMasks[super]) == 0);
	}
	var firstPowerBomb = settings["firstPowerBomb"] && vars.watchers["maxPowerBombs"].Old == 0 && vars.watchers["maxPowerBombs"].Current == 5;
	var allPowerBombs = settings["allPowerBombs"] && (vars.watchers["maxPowerBombs"].Old + 5) == (vars.watchers["maxPowerBombs"].Current);
	var pickup = firstMissile || allMissiles || specificMissile || firstSuper || allSupers || specificSuper || firstPowerBomb || allPowerBombs;

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
	var specificTank = false;
	foreach (string etank in vars.etankMasks.Keys) {
			specificTank |= settings[etank]
					&& ((vars.watchers[vars.etankWatchKeys[etank]].Current & vars.etankMasks[etank]) != 0)
					&& ((vars.watchers[vars.etankWatchKeys[etank]].Old & vars.etankMasks[etank]) == 0);
	}
	var energyUpgrade = firstETank || allETanks || reserveTanks || specificTank;
	
	// Miniboss room transitions
	var miniBossRooms = false;
	if(settings["miniBossRooms"]){
		var ceresRidleyRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["flatRoom"] && vars.watchers["roomID"].Current == vars.roomIDEnum["ceresRidley"];
		var sporeSpawnRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["sporeSpawnKeyhunter"] && vars.watchers["roomID"].Current == vars.roomIDEnum["sporeSpawn"];
		var crocomireRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["crocomireSpeedway"] && vars.watchers["roomID"].Current == vars.roomIDEnum["crocomire"];
		var botwoonRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["botwoonHallway"] && vars.watchers["roomID"].Current == vars.roomIDEnum["botwoon"];
		// Allow either vanilla or GGG entry
		var goldenTorizoRoom = (vars.watchers["roomID"].Old == vars.roomIDEnum["acidStatue"] || vars.watchers["roomID"].Old == vars.roomIDEnum["screwAttack"]) && vars.watchers["roomID"].Current == vars.roomIDEnum["goldenTorizo"];
		miniBossRooms = ceresRidleyRoom || sporeSpawnRoom || crocomireRoom || botwoonRoom || goldenTorizoRoom;
	}

	// Boss room transitions
	var bossRooms = false;
	if(settings["bossRooms"]){
		var kraidRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["kraidEyeDoor"] && vars.watchers["roomID"].Current == vars.roomIDEnum["kraid"];
		var phantoonRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["basement"] && vars.watchers["roomID"].Current == vars.roomIDEnum["phantoon"];
		var draygonRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["precious"] && vars.watchers["roomID"].Current == vars.roomIDEnum["draygon"];
		var ridleyRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["lowerNorfairFarming"] && vars.watchers["roomID"].Current == vars.roomIDEnum["ridley"];
		var motherBrainRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["rinkaShaft"] && vars.watchers["roomID"].Current == vars.roomIDEnum["motherBrain"];
		bossRooms = kraidRoom || phantoonRoom || draygonRoom || ridleyRoom || motherBrainRoom;
	}

	// Elevator transitions between areas
	var elevatorTransitions = false;
	if(settings["elevatorTransitions"]){
		var blueBrinstar = (vars.watchers["roomID"].Old == vars.roomIDEnum["elevatorToMorphBall"] && vars.watchers["roomID"].Current == vars.roomIDEnum["morphBall"]) || (vars.watchers["roomID"].Old == vars.roomIDEnum["morphBall"] && vars.watchers["roomID"].Current == vars.roomIDEnum["elevatorToMorphBall"]);
		var greenBrinstar = (vars.watchers["roomID"].Old == vars.roomIDEnum["elevatorToGreenBrinstar"] && vars.watchers["roomID"].Current == vars.roomIDEnum["greenBrinstarMainShaft"]) || (vars.watchers["roomID"].Old == vars.roomIDEnum["greenBrinstarMainShaft"] && vars.watchers["roomID"].Current == vars.roomIDEnum["elevatorToGreenBrinstar"]);
		var businessCenter = (vars.watchers["roomID"].Old == vars.roomIDEnum["warehouseEntrance"] && vars.watchers["roomID"].Current == vars.roomIDEnum["businessCenter"]) || (vars.watchers["roomID"].Old == vars.roomIDEnum["businessCenter"] && vars.watchers["roomID"].Current == vars.roomIDEnum["warehouseEntrance"]);
		var caterpillar = (vars.watchers["roomID"].Old == vars.roomIDEnum["elevatorToCaterpillar"] && vars.watchers["roomID"].Current == vars.roomIDEnum["caterpillar"]) || (vars.watchers["roomID"].Old == vars.roomIDEnum["caterpillar"] && vars.watchers["roomID"].Current == vars.roomIDEnum["elevatorToCaterpillar"]);
		var maridiaElevator = (vars.watchers["roomID"].Old == vars.roomIDEnum["elevatorToMaridia"] && vars.watchers["roomID"].Current == vars.roomIDEnum["maridiaElevator"]) || (vars.watchers["roomID"].Old == vars.roomIDEnum["maridiaElevator"] && vars.watchers["roomID"].Current == vars.roomIDEnum["elevatorToMaridia"]);
		elevatorTransitions = blueBrinstar || greenBrinstar || businessCenter || caterpillar || maridiaElevator;
	}

	// Room transitions
	var ceresEscape = settings["ceresEscape"] && vars.watchers["roomID"].Current == vars.roomIDEnum["ceresElevator"] && vars.watchers["gameState"].Old == vars.gameStateEnum["normalGameplay"] && vars.watchers["gameState"].Current == vars.gameStateEnum["startOfCeresCutscene"];
	var wreckedShipEntrance = settings["wreckedShipEntrance"] && vars.watchers["roomID"].Old == vars.roomIDEnum["westOcean"] && vars.watchers["roomID"].Current == vars.roomIDEnum["wreckedShipEntrance"];
	var redTowerBottomEntrance = settings["redTowerBottomEntrance"] && vars.watchers["roomID"].Old == vars.roomIDEnum["bat"] && vars.watchers["roomID"].Current == vars.roomIDEnum["redTower"];
	var kraidsLair = settings["kraidsLair"] && vars.watchers["roomID"].Old == vars.roomIDEnum["warehouseEntrance"] && vars.watchers["roomID"].Current == vars.roomIDEnum["warehouseZeela"];
	var atticExit = settings["atticExit"] && vars.watchers["roomID"].Old == vars.roomIDEnum["attic"] && vars.watchers["roomID"].Current == vars.roomIDEnum["westOcean"];
	var tubeBroken = settings["tubeBroken"] && vars.watchers["roomID"].Current == vars.roomIDEnum["glassTunnel"] && (vars.watchers["eventFlags"].Old & vars.eventFlagEnum["tubeBroken"]) == 0 && (vars.watchers["eventFlags"].Current & vars.eventFlagEnum["tubeBroken"]) > 0;
	var cacExit = settings["cacExit"] && vars.watchers["roomID"].Old == vars.roomIDEnum["westCactusAlley"] && vars.watchers["roomID"].Current == vars.roomIDEnum["butterflyRoom"];
	var kronicBoost = settings["kronicBoost"] && (vars.watchers["roomID"].Old == vars.roomIDEnum["magdolliteTunnel"] && vars.watchers["roomID"].Current == vars.roomIDEnum["kronicBoost"] || vars.watchers["roomID"].Old == vars.roomIDEnum["spikyAcidSnakes"] && vars.watchers["roomID"].Current == vars.roomIDEnum["kronicBoost"] || vars.watchers["roomID"].Old == vars.roomIDEnum["volcano"] && vars.watchers["roomID"].Current == vars.roomIDEnum["kronicBoost"]);
	var lowerNorfairEntrance = settings["lowerNorfairEntrance"] && vars.watchers["roomID"].Old == vars.roomIDEnum["lowerNorfairElevator"] && vars.watchers["roomID"].Current == vars.roomIDEnum["mainHall"];
	var writg = settings["writg"] && vars.watchers["roomID"].Old == vars.roomIDEnum["pillars"] && vars.watchers["roomID"].Current == vars.roomIDEnum["writg"];
	var redKiShaft = settings["redKiShaft"] && (vars.watchers["roomID"].Old == vars.roomIDEnum["amphitheatre"] && vars.watchers["roomID"].Current == vars.roomIDEnum["redKiShaft"] || vars.watchers["roomID"].Old == vars.roomIDEnum["wasteland"] && vars.watchers["roomID"].Current == vars.roomIDEnum["redKiShaft"]);
	var metalPirates = settings["metalPirates"] && vars.watchers["roomID"].Old == vars.roomIDEnum["wasteland"] && vars.watchers["roomID"].Current == vars.roomIDEnum["metalPirates"];
	var lowerNorfairSpringMaze = settings["lowerNorfairSpringMaze"] && vars.watchers["roomID"].Old == vars.roomIDEnum["lowerNorfairFireflea"] && vars.watchers["roomID"].Current == vars.roomIDEnum["lowerNorfairSpringMaze"];
	var lowerNorfairExit = settings["lowerNorfairExit"] && vars.watchers["roomID"].Old == vars.roomIDEnum["threeMusketeers"] && vars.watchers["roomID"].Current == vars.roomIDEnum["singleChamber"];
	var allBossesFinished = (vars.watchers["brinstarBosses"].Current & vars.bossFlagEnum["kraid"]) > 0 && (vars.watchers["wreckedShipBosses"].Current & vars.bossFlagEnum["phantoon"]) > 0 && (vars.watchers["maridiaBosses"].Current & vars.bossFlagEnum["draygon"]) > 0 && (vars.watchers["norfairBosses"].Current & vars.bossFlagEnum["ridley"]) > 0;
	var goldenFour = settings["goldenFour"] && vars.watchers["roomID"].Old == vars.roomIDEnum["statuesHallway"] && vars.watchers["roomID"].Current == vars.roomIDEnum["statues"] && allBossesFinished;
	var tourianEntrance = settings["tourianEntrance"] && vars.watchers["roomID"].Old == vars.roomIDEnum["statues"] && vars.watchers["roomID"].Current == vars.roomIDEnum["tourianElevator"];
	var metroids = settings["metroids"] && (vars.watchers["roomID"].Old == vars.roomIDEnum["metroidOne"] && vars.watchers["roomID"].Current == vars.roomIDEnum["metroidTwo"] || vars.watchers["roomID"].Old == vars.roomIDEnum["metroidTwo"] && vars.watchers["roomID"].Current == vars.roomIDEnum["metroidThree"] || vars.watchers["roomID"].Old == vars.roomIDEnum["metroidThree"] && vars.watchers["roomID"].Current == vars.roomIDEnum["metroidFour"] || vars.watchers["roomID"].Old == vars.roomIDEnum["metroidFour"] && vars.watchers["roomID"].Current == vars.roomIDEnum["tourianHopper"]);
	var babyMetroidRoom = settings["babyMetroidRoom"] && vars.watchers["roomID"].Old == vars.roomIDEnum["dustTorizo"] && vars.watchers["roomID"].Current == vars.roomIDEnum["bigBoy"];
	var escapeClimb = settings["escapeClimb"] && vars.watchers["roomID"].Old == vars.roomIDEnum["tourianEscape4"] && vars.watchers["roomID"].Current == vars.roomIDEnum["climb"];
	var roomTransitions = miniBossRooms || bossRooms || elevatorTransitions || ceresEscape || wreckedShipEntrance|| redTowerBottomEntrance || kraidsLair || atticExit || tubeBroken || cacExit || kronicBoost || lowerNorfairEntrance || writg || redKiShaft || metalPirates || lowerNorfairSpringMaze || lowerNorfairExit || tourianEntrance || goldenFour || metroids || babyMetroidRoom || escapeClimb;

	// Minibosses
	var ceresRidley = settings["ceresRidley"] && (vars.watchers["ceresBosses"].Old & vars.bossFlagEnum["ceresRidley"]) == 0 && (vars.watchers["ceresBosses"].Current & vars.bossFlagEnum["ceresRidley"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["ceresRidley"];
	var bombTorizo = settings["bombTorizo"] && (vars.watchers["crateriaBosses"].Old & vars.bossFlagEnum["bombTorizo"]) == 0 && (vars.watchers["crateriaBosses"].Current & vars.bossFlagEnum["bombTorizo"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["bombTorizo"];
	var sporeSpawn = settings["sporeSpawn"] && (vars.watchers["brinstarBosses"].Old & vars.bossFlagEnum["sporeSpawn"]) == 0 && (vars.watchers["brinstarBosses"].Current & vars.bossFlagEnum["sporeSpawn"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["sporeSpawn"];
	var crocomire = settings["crocomire"] && (vars.watchers["norfairBosses"].Old & vars.bossFlagEnum["crocomire"]) == 0 && (vars.watchers["norfairBosses"].Current & vars.bossFlagEnum["crocomire"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["crocomire"];
	var botwoon = settings["botwoon"] && (vars.watchers["maridiaBosses"].Old & vars.bossFlagEnum["botwoon"]) == 0 && (vars.watchers["maridiaBosses"].Current & vars.bossFlagEnum["botwoon"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["botwoon"];
	var goldenTorizo = settings["goldenTorizo"] && (vars.watchers["norfairBosses"].Old & vars.bossFlagEnum["goldenTorizo"]) == 0 && (vars.watchers["norfairBosses"].Current & vars.bossFlagEnum["goldenTorizo"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["goldenTorizo"];
	var minibossDefeat = ceresRidley || bombTorizo || sporeSpawn || crocomire || botwoon || goldenTorizo;

	// Bosses
	var kraid = settings["kraid"] && (vars.watchers["brinstarBosses"].Old & vars.bossFlagEnum["kraid"]) == 0 && (vars.watchers["brinstarBosses"].Current & vars.bossFlagEnum["kraid"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["kraid"];
	if(kraid){
		vars.DebugOutput("Split due to kraid defeat");
	}
	var phantoon = settings["phantoon"] && (vars.watchers["wreckedShipBosses"].Old & vars.bossFlagEnum["phantoon"]) == 0 && (vars.watchers["wreckedShipBosses"].Current & vars.bossFlagEnum["phantoon"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["phantoon"];
	if(phantoon){
		vars.DebugOutput("Split due to phantoon defeat");
	}
	var draygon = settings["draygon"] && (vars.watchers["maridiaBosses"].Old & vars.bossFlagEnum["draygon"]) == 0 && (vars.watchers["maridiaBosses"].Current & vars.bossFlagEnum["draygon"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["draygon"];
	if(draygon){
		vars.DebugOutput("Split due to draygon defeat");
	}
	var ridley = settings["ridley"] && (vars.watchers["norfairBosses"].Old & vars.bossFlagEnum["ridley"]) == 0 && (vars.watchers["norfairBosses"].Current & vars.bossFlagEnum["ridley"]) > 0;
	if(ridley){
		vars.DebugOutput("Split due to ridley defeat");
	}
	// Mother Brain phases
	var inMotherBrainRoom = vars.watchers["roomID"].Current == vars.roomIDEnum["motherBrain"];
	var mb1 = settings["mb1"] && inMotherBrainRoom && vars.watchers["gameState"].Current == vars.gameStateEnum["normalGameplay"] && vars.watchers["motherBrainHP"].Old == 0 && vars.watchers["motherBrainHP"].Current == (vars.motherBrainMaxHPEnum["phase2"]);
	if(mb1){
		vars.DebugOutput("Split due to mb1 defeat");
	}
	var mb2 = settings["mb2"] && inMotherBrainRoom && vars.watchers["gameState"].Current == vars.gameStateEnum["normalGameplay"] && vars.watchers["motherBrainHP"].Old == 0 && vars.watchers["motherBrainHP"].Current == (vars.motherBrainMaxHPEnum["phase3"]);
	if(mb2){
		vars.DebugOutput("Split due to mb2 defeat");
	}
	var mb3 = settings["mb3"] && inMotherBrainRoom && (vars.watchers["tourianBosses"].Old & vars.bossFlagEnum["motherBrain"]) == 0 && (vars.watchers["tourianBosses"].Current & vars.bossFlagEnum["motherBrain"]) > 0;
	if(mb3){
		vars.DebugOutput("Split due to mb3 defeat");
	}
	var bossDefeat = kraid || phantoon || draygon || ridley || mb1 || mb2 || mb3;

	// Run-ending splits
	var escape = settings["rtaFinish"] && (vars.watchers["eventFlags"].Current & vars.eventFlagEnum["zebesAblaze"]) > 0 && vars.watchers["samusPose"].Old != 0x9B && vars.watchers["samusPose"].Current == 0x9B && vars.watchers["poseDirection"].Old != 0 && vars.watchers["poseDirection"].Current == 0;

	var takeoff = settings["igtFinish"] && vars.watchers["roomID"].Current == vars.roomIDEnum["landingSite"] && vars.watchers["gameState"].Old == vars.gameStateEnum["preEndCutscene"] && vars.watchers["gameState"].Current == vars.gameStateEnum["endCutscene"];

	var sporeSpawnRTAFinish = false;
	if(settings["sporeSpawnRTAFinish"]){
		if(vars.pickedUpSporeSpawnSuper){
			if(vars.watchers["igtFrames"].Old != vars.watchers["igtFrames"].Current){
				sporeSpawnRTAFinish = true;
				vars.pickedUpSporeSpawnSuper = false;
			}
		}
		else {
			vars.pickedUpSporeSpawnSuper = vars.watchers["roomID"].Current == vars.roomIDEnum["sporeSpawnSuper"] && (vars.watchers["maxSupers"].Old + 5) == (vars.watchers["maxSupers"].Current) && (vars.watchers["brinstarBosses"].Current & vars.bossFlagEnum["sporeSpawn"]) > 0;
		}
	}

	var hundredMissileRTAFinish = false;
	if(settings["hundredMissileRTAFinish"]){
		if(vars.pickedUpHundredthMissile){
			if(vars.watchers["igtFrames"].Old != vars.watchers["igtFrames"].Current){
				hundredMissileRTAFinish = true;
				vars.pickedUpHundredthMissile = false;
			}
		}
		else{
			vars.pickedUpHundredthMissile = vars.watchers["maxMissiles"].Old == 95 && vars.watchers["maxMissiles"].Current == 100;
		}
	}

	var nonStandardCategoryFinish = sporeSpawnRTAFinish || hundredMissileRTAFinish;

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
	if(nonStandardCategoryFinish){
		vars.DebugOutput("Split due to non standard category finish");
	}

	return pickup || unlock || beam || energyUpgrade || roomTransitions || minibossDefeat || bossDefeat || escape || takeoff || nonStandardCategoryFinish;
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