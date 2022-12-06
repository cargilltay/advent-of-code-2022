function readAll(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end

function allUnique(tabl)
    local valuesSoFar = {}
    
    for i = 1, #tabl do
        local val = tabl[i]
        if(valuesSoFar[val] == nil) then
            valuesSoFar[val] = true
        else 
            return false
        end
    end
    print(table.concat(tabl,", "))

    return true
end

local function solve() 
    local fileContent = readAll("input.txt");

    local charWindow = {}
    local windowSize = 4
    local dataSize = 1

    for i = 1, #fileContent do
        local c = fileContent:sub(i,i)
 
        table.insert(charWindow, c)

        if(windowSize == #charWindow) then
            if(allUnique(charWindow) == true) then
                break
            end
            table.remove(charWindow, 1)
        end
        dataSize = dataSize + 1

    end
    return dataSize
end

local res = solve()

print(res)
