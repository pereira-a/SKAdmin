DATA = {}

function DATA:fileExists(path)
  local file = io.open(path, "r")
  if file then io.close(file) return true else return false end
end

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

-- Removes a line from a txt file.
-- line is an int
function DATA:removeLine(path, line)
  -- TODO:
end

function DATA:print(text)
  print("SKADMIN DATA: " .. text .. "\n")
end
