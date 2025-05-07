local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local date = function() return os.date("%Y-%m-%d") end

return {
    s("weeklyreview", {
        t({"## "}), f(date, {}), t({"", "", "### What went well?", "", ""}),
        i(1, "- "),
        t({"", "", "### What could be adjusted?", "", ""}),
        i(2, "- "),
        t({"", "", "### What should I stop doing?", "", ""}),
        i(3, "- "),
        t({"", "", "### What should I start doing?", "", ""}),
        i(4, "- "),
    })
}
