local inspect = require('inspect')


local function checkNorth(matrix, x, y)    
    local treeHeight = matrix[y][x]
    local isVisible = true

    y = y - 1

    while(y > 0) do
        if(matrix[y][x] >= treeHeight) then
            isVisible = false
            break
        end
        y = y - 1
    end
    
    return isVisible
end


local function checkEast(matrix, x, y)    
    local treeHeight = matrix[y][x]
    local isVisible = true

    x = x + 1

    while(x < #matrix[y] + 1) do
        if(matrix[y][x] >= treeHeight) then
            isVisible = false
            break
        end
        x = x + 1
    end
    
    return isVisible
end

local function checkSouth(matrix, x, y)    
    local treeHeight = matrix[y][x]
    local isVisible = true

    y = y + 1

    while(y < #matrix + 1) do
        if(matrix[y][x] >= treeHeight) then
            isVisible = false
            break
        end
        y = y + 1
    end
    
    return isVisible
end

local function checkWest(matrix, x, y)    
    local treeHeight = matrix[y][x]
    local isVisible = true

    x = x - 1

    while(x > 0) do
        if(matrix[y][x] >= treeHeight) then
            isVisible = false
            break
        end
        x = x - 1
    end
    
    return isVisible
end

local function isEdge(matrix, x, y)
    if(x == 1 or y == 1) then
        return true
    elseif(x == #matrix[y] or y == #matrix) then
        return true
    end

    return false
end


local function isVisible(matrix, x, y)
    if(isEdge(matrix, x, y)) then
        return true
    elseif(checkNorth(matrix, x, y)) then
        return true
    elseif(checkEast(matrix, x, y)) then
        return true
    elseif(checkSouth(matrix, x, y)) then
        return true
    elseif(checkWest(matrix, x, y)) then
        return true
    end

    return false
end

local function solve() 
    local fileContent = io.lines("input.txt");
    local trees = {}
    local lineNumber = 1

    -- build 2d array
    for line in fileContent do
        
        for i = 1, #line do
            local c = tonumber(line:sub(i,i))

            if(trees[lineNumber] == nil) then
                trees[lineNumber] = {}
            end

            trees[lineNumber][i] = c 
        end
        lineNumber = lineNumber + 1
    end

    local totalVisible = 0

    for i = 1, #trees do
        for j = 1, #trees[i] do
            if(isVisible(trees, j, i)) then
                totalVisible = totalVisible + 1
            end
        end
    end

    return totalVisible
end

local res = solve()

print(res)
