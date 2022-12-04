function split (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

local function fullContains(first, second)
    local firstOne = tonumber(first[1])
    local firstTwo = tonumber(first[2])
    local secondOne = tonumber(second[1])
    local secondTwo = tonumber(second[2])
    
    if(firstOne <= secondOne and firstTwo >= secondTwo) then
        return 1
    elseif (secondOne <= firstOne and secondTwo >=firstTwo) then
        return 1
    else
        return 0
    end
end

local function solve() 
    local fileContent = io.lines("input.txt");
    local fileLinesAsArray = {}
    
    local total = 0

    for line in fileContent do
        local splitVals = split(line, ',')
        local first = splitVals[1]
        local second = splitVals[2]

        local firstPair = split(first, '-')
        local secondPair = split(second, '-')

        total = total + fullContains(firstPair, secondPair)
    end

    return total
end

local res = solve()

print(res)
