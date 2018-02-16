# SKAdmin
A FiveM script which implements an admin trainer, with admin options and basic trainer options.

## Installing
1. Create a new folder in /resources and name it *SkAdmin*.
2. Copy the files to that folder.
3. Add the line ```start SkAdmin``` to your *server.cfg*.
4. Create a directory named "skadmin_saves" or with the name you use in Config.settings.saves_directory. This directory has to be create as a subdirectory of server-data.
4. Restart or start your server.

## Config
The following features are all configurable in sv_config.lua file.

### Directory Nam
To change the name of the save directory change the value of Config.settings.saves_directory

### Admin List File
To change the name of this file change the value of Config.settings.banlist_file

### Event Chat Messages & Event Console Messages
You can turn on and off this in Config.settings.event_messages and Config.settings.event_messages_console, respectively.
To turn of use the nil value. To turn on use the value 1.

## Notes
1. Is extremely important to create skadmin_saves directory. You can change then name of the folder and files in Config.settings.saves_directory
2. When using resource management, like start, stop and restart, you can't use this operations in this resource. If you do that it will crash your server.

## Features
- [X] Admin Ranks
- [ ] Admin Tag Over Head
- [ ] Admin, Moderator and Owner Skin
- [X] Admin Menu
- [X] Server Management Menu
- [X] Teleport Menu
- [X] Player Menu
- [ ] Weapon Menu
- [ ] Vehicle Menu
- [ ] Skin Menu
- [ ] Online Menu
- [ ] Animation Menu
- [X] Event Chat Messages & Event Console Messages
- [ ] Warnings
- [ ] Admins Online
- [ ] Add Admins

## TODO List
- [X] DATA:removeLine
- [X] Finish Unban Player
- [X] Event Messages
- [ ] Implementation with MySQL
- [X] Lower ranks cant spectate, kick, ban, etc higher raks
- [ ] Instructions text in noclip
- [ ] Higher ranks don't appear in admin options list (??)
- [ ] Resource's list
- [ ] Stop Engine
- [ ] Bodyguards
- [ ] Night and Thermal Vision
- [ ] Owner Skin
- [ ] Change admin skins option
- [ ] Change explosion type menu

## Menus
| Menu              | Features                                                                                                                   |
|-------------------|----------------------------------------------------------------------------------------------------------------------------|
| Admin Menu        | Kick Player, Ban Player, Unban Player, Spectate Player                                                                     |
| Server Management | Restart Resource, Start Resource, Stop Resource, Set Game Type, Set Map Name                                               |
| Teleport Menu     | Teleport to Player, Teleport to Waypoint                                                                                   |
| Player Menu       | NoClip, God Mode, Infinite Stamina, Invisibility, Polic Ignore, Never Wanted, Fast Swim, Fast Run, Super Jump, No Rag Doll |
| Weapon Menu       | Give All Weapons, Remove All Weapons,  Delete Gun, Teleport Gun, Vehicle Gun, Whale Gun, Fire Ammo, One Shot Kill, Explosive Ammo, Infinite Ammo                                                                                                                    |

## Ranks
| Rank          | Id | Permissions                                                                                |
|---------------|----|--------------------------------------------------------------------------------------------|
| Moderador     | 1  | Kick, Teleport to Player, Teleport to Waypoint, Godmode, Infinite Stamina, Max Health, Max Armor, Never Wanted, Increase Wanted Level, Clear Wanted Level, Fast Swim, Fast Sprint, Super Jump, No Rag Doll, Give and Remove all Weapons                                                             |
| Administrator | 2  | Ban, Unban, Noclip, Invisibility and all above                                             |
| Owner         | 3  | Restart Resource, Start Resource, Stop Resource, Set Game Type, Set Map Name and all above |

## Controls
| Key        | Action                                      |
|------------|---------------------------------------------|
| M          | Open Menu                                   |
| Arrow Keys | Move up, down, right and left, respectively |
| Enter      | Select option                               |
| Backspace  | Go back                                     |

## NoClip Controls
| Key   | Action              |
|-------|---------------------|
| Shift | Change noclip speed |
| Q     | Move Upwards        |
| E     | Move Downwards      |
| W     | Move Forwards       |
| S     | Move Backwards      |
| A     | Rotate Left         |
| D     | Rotate Right        |

## Credits
[Warmenu by Warxander](https://github.com/adikanchukov/warmenu) which i used to make the menus.  
[Mellotrainer by TheStonedTurtle](https://github.com/TheStonedTurtle/mellotrainer) for the noclip.  
