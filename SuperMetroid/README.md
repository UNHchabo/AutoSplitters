# LiveSplit.SuperMetroid

This script can be used with [LiveSplit](http://livesplit.github.io) for speedrunning Super Metroid.

## Supported emulators:
- higan v102+
- Snes9x 1.53+

## Setup
After you select your splits, add a start time of 0.26 seconds, because the autostart event happens as the screen fades to black, rather than the typical RTA start point of the cursor disappearing.

## Split events
This script supports splitting on a wide range of events, so it basically splits as often as you'd like. By default the following events will cause a split:
- First Power Bomb pickup
- Varia Suit
- Gravity Suit
- Wave Beam
- Defeating Ridley
- Entering the Statues Room, aka "Golden Four"
- Finishing Mother Brain's second phase
- Entering the ship during the Zebes Escape sequence

However, in the settings you can also select the script to split on many other things:
- Every Missile, Super Missile, or Power Bomb pickup
- All Energy Tanks
- All equippable upgrades
- All minibosses
- All bosses
- Entering miniboss or boss rooms
- Elevator transitions
- Major door transitions
- The end of In-Game Time, when used in conjunction with the [Alternate Timing Method](https://github.com/Dalet/LiveSplit.AlternateTimingMethod/releases) component
- The end of a Spore Spawn RTA run

If all of these options are selected, then a typical KPDR Any% route would have more than 50 splits!

If you're playing a category that might reset to a save, you'll likely want to disable the "reset" option.

## Contact
For bugs or feature requests, GitHub has a [built-in tracker for that](https://github.com/UNHchabo/AutoSplitters/issues).
