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
1. Press F3 to open the UI Menu
1. You'll know it worked if you see "[CyberEssentials] Mod Activated..." appear in the console  

## Commands

### SetWarp("`name`", `optional_XCoord`, `optional_YCoord`, `optional_ZCoord`)
> **Note**: To use this command, you must put quotes around the name of the warp you want to create.  

**Description:** This command allows you to create a new warp based on your current position or a set of coordinates that you can teleport to using the `Warp()` command.  
**Usages:**  
- `SetWarp("My new warp")`
- `SetWarp("The Peralezes' Apartment", -75.815399, -113.607819, 111.161728)`

### Warp("`name`")
> **Note**: To use this command, you must put quotes around the name of the warp you want to teleport to.  

**Description:** This command allows you to teleport to any previously created  warp locations.  
**Usage:** `Warp("V's Apartment")`

### RemoveWarp("`name`")
> **Note**: To use this command, you must put quotes around the name of the warp you want to remove.  

**Description:** This command allows you to remove a previoulsy created warp.  
**Usage:** `RemoveWarp("V's Apartment")`

### ListWarps()
**Description:** This command allows you to view a list of the warps that have been created.  
**Usage:** `ListWarps()`

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

### Help()
**Description:** This command will list all CyberEssential commands.
**Usage:** `Help()`

### HelpAdd()
**Description:** This command lists the command, description, and usage for SetWarp().
**Usage:** `HelpAdd()`

### HelpRemove()
**Description:** This command lists the command, description, and usage for RemoveWarp().
**Usage:** `HelpRemove()`
