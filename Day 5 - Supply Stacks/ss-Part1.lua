
function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

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

buckets = {}

local function loadBuckets(line)
    local bucketNumber = 1
    for i = 2, #line, 4 do
        local c = line:sub(i,i)
        if(c ~= ' ' and c ~= nil) then
            if(buckets[bucketNumber] == nil)then
                buckets[bucketNumber] = {}
            end
            table.insert(buckets[bucketNumber], c)
        end

        bucketNumber = bucketNumber + 1
    end
end

local function move(line) 
    local splitVals = split(line, ' ')
    local move =  tonumber(splitVals[2])
    local from = tonumber(splitVals[4])
    local to  =  tonumber(splitVals[6])

    for i = 1, move do
        local moved = table.remove(buckets[from], 1)
        if(buckets[to] == nil)then
            buckets[to] = {}
        end
        table.insert(buckets[to], 1, moved)
    end
end



local function solve() 
    local fileContent = io.lines("input.txt");

    for line in fileContent do
        local isMove =  string.sub(line, 1, 1) == 'm'
        local isNumbers = string.sub(line, 2, 2) == '1'
        if(line ~= '' and line ~= nil and isNumbers == false and isMove == false) then
            loadBuckets(line)
    
        elseif (isMove == true) then
            move(line)
        end

    end
end

solve()

--print(res)
