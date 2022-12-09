local inspect = require('inspect')
local json = require('json')

local function split (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

local function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

-- hack but tbh idc
local total = 0
local directory = {}
local path = ""

local function solve() 
    local fileContent = io.lines("input.txt");

    for line in fileContent do
        local splitVals = split(line)
        
        if(splitVals[1] == '$')then
            inLs = false
            if(splitVals[2] == "cd") then
                if(splitVals[3] == '..') then
                    path = path
                end
            elseif(splitVals[2] == "ls") then
                inLs = true
            end
        elseif(inLs == true and splitVals[1]~= 'dir')then
            if(directory[path] == nil) then
                directory[path] = 0
            end

            --print( tonumber(splitVals[1]))

            directory[path] = directory[path] + tonumber(splitVals[1])
            print(directory[path])
        end

    end
    print(inspect(directory))
end

solve()


