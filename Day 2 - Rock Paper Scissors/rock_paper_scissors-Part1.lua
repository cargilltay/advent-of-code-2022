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

local function rps (you, i)
    local total = 0

    if you == i then
        total = 3
    elseif (you == 's' and i == 'r') or (you == 'r' and i == 'p') or (you == 'p' and i == 's') then 
        total = 6
    else
        total = 0
    end

    total = total + defs[i]
    
    return total
end

local function solve() 
    local fileContent = io.lines("input.txt");
    
    local total = 0
    local rpsValues = {A = 'r', B = 'p', C = 's', X = 'r', Y = 'p', Z = 's'}

    for line in fileContent do
        local split = split(line, nil)
        local you = rpsValues[split[1]]
        local i = rpsValues[split[2]]

        total = total + rps(you, i)
    end

    return total
end

local res = solve()

print(res)

