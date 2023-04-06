# LiveSplit.SuperMetroid

This script can be used with [LiveSplit](http://livesplit.github.io) for speedrunning Super Metroid ROM Hacks. This is mostly similar to the normal [Super Metroid autosplitter](https://github.com/UNHchabo/AutoSplitters/tree/master/SuperMetroid), but with some important differences.

## Supported emulators:
- higan v102 through v110
- bsnes v107 through v112, and v115 (not Nightly)
- Snes9x 1.53 through 1.60 (win32 or win32-x64)
- RetroArch 1.7.5 (x86-64) (with Snes9x or higan cores)
- BizHawk 2.3 through 2.3.2 (with bsnes core)

## Setup
After you select your splits, add a start time from the list below, because the autostart event happens as the screen is finished fading to black, rather than the typical RTA start point when the screen starts fading.

- Standard NTSC: 0.29 seconds
- Standard PAL: 0.35 seconds
- Zebes start NTSC: 0.70 seconds
- Zebes start PAL: 0.84 seconds

Due to the way that the autosplitters work in LiveSplit, any setting that's chosen in the Settings menu must also have its parent selected. So to split on Morphing Ball, you must also have Misc Upgrades selected.

If you're playing a category that might reset to a save, you'll likely want to disable the "reset" option.

I recommend binding easily-accessible keys to the "Undo Split" and "Skip Split" functions, in case you skip an item or grab an extra item, or encounter a bug.

## Split events
This script supports splitting on a wide range of events. By default the following events will cause a split:
- First Power Bomb pickup
- Varia Suit
- Gravity Suit
- Wave Beam
- Defeating Ridley
- Entering the Statues Room, aka "Golden Four"
- Defeating Mother Brain
- Entering the ship during the Zebes Escape sequence

However, in the settings you can also select the script to split on many other things:
- Every Missile, Super Missile, or Power Bomb pickup
- All Energy Tanks
- All equippable upgrades
- All minibosses
- All bosses
- The end of In-Game Time, when used in conjunction with the [Alternate Timing Method](https://github.com/Dalet/LiveSplit.AlternateTimingMethod/releases) component

Due to the wide range of room layouts among various hacks, no door transition splits are supported at this time.

## Contact
For bugs or feature requests, GitHub has a [built-in tracker for that](https://github.com/UNHchabo/AutoSplitters/issues).
