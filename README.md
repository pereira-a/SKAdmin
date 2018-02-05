# SKAdmin
A FiveM script which implements an admin trainer, with admin options and basic trainer options.
The menus of this script are made with [warmenu by Warxander](https://github.com/adikanchukov/warmenu)

# Installing
1. Create a new folder in /resources and name it *SkAdmin*.
2. Copy the files to that folder.
3. Add the line ```start SkAdmin``` to your *server.cfg*.
4. Create a directory named "skadmin_saves" or with the name you use in Config.settings.saves_directory. This directory has to be create as a subdirectory of server-data.
4. Restart or start your server.

# Config
The following featured are all configured in sv_config.lua file.

## Directory Name
To change the name of the save directory change the value of Config.settings.saves_directory

## Admin List File
To change the name of this file change the value of Config.settings.banlist_file

## Event Chat Messages & Event Console Messages
You can turn on and off this in Config.settings.event_messages and Config.settings.event_messages_console, respectively.
To turn of use the nil value. To turn on use the value 1

# Notes
1. Is extremely important to create skadmin_saves directory. You can change then name of the folder and files in Config.settings.saves_directory

# Features
- [X] Kick Player
- [X] Ban Player
- [X] Unban Player
- [X] Event Chat Messages & Event Console Messages
- [ ] Admin Ranks
- [ ] Warnings

# TODO List
- [X] DATA:removeLine
- [X] Finish Unban Player
- [X] Event Messages
- [ ] Implementation with MySQL

# Credits
