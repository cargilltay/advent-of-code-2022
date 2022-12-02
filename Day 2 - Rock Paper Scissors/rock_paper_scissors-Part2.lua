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

local defs = 
{
    r = 1,
    p = 2, 
    s = 3,
}

local function rps(i, originalI)
    local cheatSheet = {X = 0, Y = 3, Z = 6}

    total = cheatSheet[originalI] + defs[i]
    
    return total
end

local function convert(you, i)
    local convertToLoss = {A = 'Z', B = 'X', C = 'Y'}
    local convertToWin = {A = 'Y', B = 'Z', C = 'X'}
    if i == 'X' then
        return convertToLoss[you]
    elseif i == 'Y' then
        return you
    elseif i == 'Z' then
        return convertToWin[you]
    end
end

local function solve() 
    local fileContent = io.lines("input.txt");
    
    local total = 0
    local rpsValues = {A = 'r', B = 'p', C = 's', X = 'r', Y = 'p', Z = 's'}

    for line in fileContent do
        local split = split(line, nil)

        local you = split[1]
        local i = split[2]

        local cheatingI = convert(you, i)
        local convertedI = rpsValues[cheatingI]

        total = total + rps(convertedI, i)
    end

    return total
end

local res = solve()

print(res)

