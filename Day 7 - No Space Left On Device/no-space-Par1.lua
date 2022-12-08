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

local function Tree(key, parent)
	return {
		key = key,
        parent = parent,
		children = {},
        size = 0
	}
end

local function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

local function TraverseInOrder(node) 
    if(node == nil) then
        return
    end
    local childrenLength = tablelength(node.children)

    if(childrenLength == 0) then
        -- pass size all the way up to root
        local par = node.parent

        while(par ~= nil) do
            par.size = par.size + node.size
            par = par.parent;
        end
    else 
        for k, v in pairs(node.children) do
            TraverseInOrder(v)
        end
    end
end

-- hack but tbh idc
local total = 0

local function Traverse(node) 
    if(node == nil) then
        return
    end

    if(node.size <= 100000)then
        total = total + node.size
    end

    for k, v in pairs(node.children) do
        Traverse(v)
    end
end

local function solve() 
    local fileContent = io.lines("input.txt");

    local nodeSizeMap = {}

    local root = nil
    local currentDir = nil


    -- build tree
    for line in fileContent do
        local firstChar = string.sub(line, 1, 1)

        -- command
        if(firstChar == '$') then
            local thirdChar = string.sub(line, 3, 3)
           -- cd
            if(thirdChar == 'c') then
                local sixthChar = string.sub(line, 6, 6)
                local newDirName = string.sub(line, 6, #line)

                -- prevDir = currentDir

                -- root dir
                if(sixthChar == '/') then
                    if(root == nil)then
                        root = Tree(sixthChar, nil, nil)
                    end
                    currentDir = root

                -- upwards cd
                elseif(sixthChar == '.') then
                    currentDir = currentDir.parent

                -- downwards cd
                else
                    local child = currentDir.children[newDirName]

                    if(child == nil) then
                        currentDir.children[newDirName] = Tree(newDirName, currentDir)
                        child = currentDir.children[newDirName]
                    end

                    if(currentDir.parent == nil and currentDir.key ~= '/') then
                        currentDir.parent = currentDir
                    end

                    currentDir = child
                end
            end
        
        -- file 
        elseif (tonumber(firstChar) ~= nil) then
            local fileSize = tonumber(split(line, ' ')[1])
            currentDir.size = currentDir.size + fileSize
        end

    end

    -- correct parent/child sizes
    TraverseInOrder(root)

    -- hack to print sum of < 100000
    Traverse(root)
end

solve()


