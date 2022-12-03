local function sum(x)
    local s = 0
    for i,v in ipairs(x) do
       s = s + v
    end
    return s
 end

local function toSpecialCharCode(c)
    local charCode = string.byte(c) - 96

    if (charCode < 0) then -- byte for 'A'
        local offset = 58
        charCode = charCode + offset
    end
    
    return charCode
end

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function intersect(m,n)
    local r={}
    for i = 1, #m do
        for j = 1, #n do
            if m[i] == n[j] then
                table.insert(r, m[i])
                break
            end
        end
    end
    return r
end

local function toSpecialCharCodeTable(str)
    local r={}
    for i = 1, #str do
        local c = str:sub(i,i)
        local charCode = toSpecialCharCode(c)
        local hasValue = has_value(r, charCode)
        if (hasValue == false) then
            table.insert(r, charCode)
        end
    end
    return r
end

local function intersectSum(one, two, three) 
    local commonTable = intersect(one, two)
    local commonTable2 = intersect(commonTable, three)

    return sum(commonTable2)
end

local function solve() 
    local fileContent = io.lines("input.txt");
    local fileLinesAsArray = {}
    
    local total = 0

    -- convert file contents to array
    for line in fileContent do
        table.insert(fileLinesAsArray, line)
    end

    local tableLength = table.getn(fileLinesAsArray)

    -- convert groups of 3 to charcode hash tables
    for i = 1, tableLength, 3  do
        local str1 = toSpecialCharCodeTable(fileLinesAsArray[i])
        local str2 = toSpecialCharCodeTable(fileLinesAsArray[i+1])
        local str3 = toSpecialCharCodeTable(fileLinesAsArray[i+2])

        -- intersect all 3 hash tables
        total = total + intersectSum(str1, str2, str3)
    end

    return total
end

local res = solve()

print(res)
