-- "addons\\_dlib\\lua\\dlib\\libs\\markup.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local function MarkupToTable(mu)
    local tbl = {}

    local KeyStack = util.Stack()
    for key in string.gmatch(mu, "<(.-)/>") do
        KeyStack:Push(key)
    end

    PrintTable(KeyStack)
end

return {
    MarkupToTable = MarkupToTable,
}

