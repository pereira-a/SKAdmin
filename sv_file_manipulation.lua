DATA = {}

DATA.dir = "saves/"

function DATA:init()
  if()
end

function DATA:pathExists(path)
  if type(path) ~= "string" then return false end

  if os.rename(path, path) == nil return false else return true end
end

function DATA:fileExists(name)
  local path = self.dir .. name
  local file = io.open(path, "r")
  if file then io.close(file) return true else return false end
end

function DATA:createFile(name)
  local path = self.dir .. name
  local file, err = io.open(path, "w")

  if not file then self:print(err) end

  io.close(file)
end

Citizen.CreateThread(function()
  Citizen.Wait(1000)
end)
