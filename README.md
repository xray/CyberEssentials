# CyberEssentials

## Requirements
- [Cyberpunk 2077](https://www.gog.com/game/cyberpunk_2077) by CD Projekt Red
- [Cyber Engine Tweaks](https://github.com/yamashi/CyberEngineTweaks) by [yamashi](https://github.com/yamashi)

## To Install
1. Navigate to your Cyberpunk install
1. Go to the directory `bin/x64/plugins/cyber_engine_tweaks/mods` 
1. copy the `cyberessentials` folder into the `mods` folder

## To Activate
> **Note**: You'll need to activate CyberEssentials every time you relaunch the game.  
1. Open Cyberpunk 2077
1. Once in game, open the Cyber Engine Tweaks Console
1. Run the command `dofile("bin/x64/scripts/cyberessentials.lua")`
1. You'll know it worked if you see "CyberEssentials activated..." appear in the console  

## Commands

### MoveForward(`distance`)
**Description:** This command will move you in the direction you're looking by the specified distance.  
**Usage:** `MoveForward(10)`

### GoUp(`distance`)
**Description:** This command will move you up by the specified distance.  
**Usage:** `GoUp(10)`

### GoDown(`distance`)
**Description:** This command will move you down by the specified distance.  
**Usage:** `GoDown(10)`

### Back()
**Description:** This command will move you to the players last location before using any of the movement commands.  
**Usage:** `Back()`

### WhereAmI()
**Description:** This command is a shorter and more succinct way to get your current in game coordinates.  
**Usage:** `WhereAmI()`

