function sum(x)
    local s = 0
    for i,v in ipairs(x) do
       s = s + v
    end
    return s
 end

local function solve() 
    local fileContent = io.lines("input.txt");

    local currentElfCalories = {}
    local elfTotals = {}

    for line in fileContent do
        if line ~= '' and line ~= nil then 
            table.insert(currentElfCalories, tonumber(line))
        else  
            local totalCalories = sum(currentElfCalories)
            currentElfCalories = {}

            table.insert(elfTotals, totalCalories)
        end
    end
    
    table.sort(elfTotals)

    return elfTotals[#elfTotals] + elfTotals[#elfTotals - 1] + elfTotals[#elfTotals - 2]
end

local res = solve()

print(res)