-- print array (table)
myText = {"hello", "world", "there"}
print(table.concat(myText,", "))

-- read entire file
function readAll(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end