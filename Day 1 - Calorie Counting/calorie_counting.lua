function sum(x)
    local s = 0
    for i,v in ipairs(x) do
       s = s + v
    end
    return s
 end

local function solve() 
    local fileContent = io.lines("input.txt");

    local biggestElfCalories = 0
    local currentElfCalories = {}

    for line in fileContent do
        if line ~= '' and line ~= nil then 
            table.insert(currentElfCalories, tonumber(line))
        else  
            local totalCalories = sum(currentElfCalories)
            currentElfCalories = {}

            if (biggestElfCalories < totalCalories) then
                biggestElfCalories = totalCalories
            end
        end
    end

    return biggestElfCalories
end

local res = solve()

print(res)