DATA = {}

function DATA:fileExists(path)
  local file = io.open(path, "r")
  if file then io.close(file) return true else return false end
end

-- Overwrites the existing file or creates a new file
function DATA:createFile(path)
  local file, err = io.open(path, "w")
  if not file then self:print(err) end
  io.close(file)
end

-- Returns a line iterator.
-- Returns nil if !~ fileExists
function DATA:getLineIterator(path)
  if self:fileExists(path) then
    return io.lines(path)
  else
    return nil
  end
end

function DATA:appendToFile(path, string)
  if self:fileExists(path) then
    local file = io.open(path, "a")
    file:write(string)
    io.close(file)
    return true
  end
  return false
end

-- Removes all lines with the substring sub
-- sub is a string
-- return 1 in succes and nil if fails
function DATA:removeLine(path, sub)
  if self:fileExists(path) then
    local tfile = {}
    local lineIterator = DATA:getLineIterator(path)
    local l = 1

    -- Register all the lines except the ones we wanr to remove
    for str in lineIterator do
      if string.find(str, sub) == nil then
        table.insert(tfile, str)
      end
    end

    -- Delete and create again
    DATA:createFile(path)

    -- Write the lines
    for i, str in ipairs(tfile) do DATA:appendToFile(path, str .. "\r\n") end

    return 1
  else
    return nil
  end
end

function DATA:print(text)
  print("SKADMIN DATA: " .. text .. "\n")
end
