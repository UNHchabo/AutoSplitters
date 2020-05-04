# LiveSplit.DKC2

This script can be used with [LiveSplit](http://livesplit.github.io) for speedrunning Donkey Kong Country 2.

## Supported emulators:
- higan v102 through v110
- bsnes v107 through v112, and v115
- Snes9x 1.53 through 1.60 (win32 or win32-x64)
- RetroArch 1.7.5 (x86-64) (with Snes9x or higan cores)
- BizHawk 2.3 through 2.3.2 (with bsnes core)

## Setup
After you select your splits, add a start time of 1.42 seconds, because the autostart event happens as the screen is finished fading to black, rather than the typical RTA start point when the screen starts fading.

I recommend binding easily-accessible keys to the "Undo Split" and "Skip Split" functions, in case you need to deviate from your normal route, or encounter a bug.

## Split events
As of today, the autosplitter supports splitting on the collection of Kremcoins, DK Coins, and on the end of each non-boss stage.

## Contact
For bugs or feature requests, GitHub has a [built-in tracker for that](https://github.com/UNHchabo/AutoSplitters/issues).
