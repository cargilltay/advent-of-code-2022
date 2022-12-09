local inspect = require('inspect')


local function checkNorth(matrix, x, y)
    local treeHeight = matrix[y][x]
    local score = 0

    y = y - 1

    while(y > 0) do
        score = score + 1
        if(matrix[y][x] >= treeHeight) then
            isVisible = false
            break
        end
        y = y - 1
    end
    
    return score
end


local function checkEast(matrix, x, y)    
    local treeHeight = matrix[y][x]
    local score = 0

    x = x + 1

    while(x < #matrix[y] + 1) do
        score = score + 1
        if(matrix[y][x] >= treeHeight) then
            isVisible = false
            break
        end
        x = x + 1
    end
    
    return score
end

local function checkSouth(matrix, x, y)    
    local treeHeight = matrix[y][x]
    local score = 0

    y = y + 1

    while(y < #matrix + 1) do
        score = score + 1
        if(matrix[y][x] >= treeHeight) then
            isVisible = false
            break
        end
        y = y + 1
    end
    
    return score
end

local function checkWest(matrix, x, y)    
    local treeHeight = matrix[y][x]
    local score = 0

    x = x - 1

    while(x > 0) do
        score = score + 1
        if(matrix[y][x] >= treeHeight) then
            isVisible = false
            break
        end
        x = x - 1
    end
    
    return score
end

local function isEdge(matrix, x, y)
    if(x == 1 or y == 1) then
        return true
    elseif(x == #matrix[y] or y == #matrix) then
        return true
    end

    return false
end

local function toNonZero(num) 
    if(num == 0)then
        return 1
    end

    return num
end


local function calculateScenicScore(matrix, x, y)
    local score = 0

    local northScore = checkNorth(matrix, x, y)
    local eastScore =  checkEast(matrix, x, y)
    local southScore =  checkSouth(matrix, x, y)
    local westScore = checkWest(matrix, x, y)

    return northScore * eastScore * southScore * westScore
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

    local bestScore = 0

    for i = 1, #trees do
        for j = 1, #trees[i] do
            local curScore = calculateScenicScore(trees, j, i)

            if(curScore > bestScore) then
                bestScore = curScore
            end
        end
    end

    return bestScore
end

local res = solve()

print(res)
