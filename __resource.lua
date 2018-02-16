resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
  'client/warmenu.lua',
  'client/cl_general.lua',
  'client/cl_gui.lua',
  'client/cl_admin.lua',
  'client/cl_noclip.lua',
  'client/cl_player.lua',
  'client/cl_weapons.lua',
}

server_script 'server/sv_main.lua'
server_script 'server/sv_config.lua'
server_script 'server/sv_admin.lua'
server_script 'server/sv_file_manipulation.lua'
server_script 'server/sv_player.lua'
server_script 'server/sv_weapons.lua'

files {
  's_m_y_dockwork_01.meta',
  's_m_y_construct_02.meta',
}

data_file 'PED_METADATA_FILE' 's_m_y_dockwork_01.meta'
data_file 'PED_METADATA_FILE' 's_m_y_construct_02.meta'
