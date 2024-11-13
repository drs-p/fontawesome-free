local fontawesome_free = {
    solid   = "Font Awesome 6 Free-Solid-900.otf",
    regular = "Font Awesome 6 Free-Regular-400.otf",
    brands  = "Font Awesome 6 Brands-Regular-400.otf",
}

for fontname, fontfile in pairs(fontawesome_free) do
    tex.sprint(string.format("\\font\\%s = {kpse:%s}", fontname, fontfile))
end


local fa = {}
local is_initialized = false

local function initialize()
    for fontname, _ in pairs(fontawesome_free) do
        fa[fontname] = font.getfont(font.id(fontname)).resources.unicodes
    end

    is_initialized = true
end


function print_icon(name)
    if not is_initialized then initialize() end

    local b = fa.brands[name]
    local s = fa.solid[name]
    local r, is_regular = string.gsub(name, "-o$", "", 1)
    if is_regular > 0 then
        r = fa.regular[r]
    else
        r = nil
    end

    local result
    if b then
        result = string.format("{\\brands\\char%d}", b)
    elseif r then
        result = string.format("{\\regular\\char%d}", r)
    elseif s then
        result = string.format("{\\solid\\char%d}", s)
    else
        tex.error(string.format("[fontawesome-lua.sty] ERROR: no icon named '%s'!", name))
    end

    return tex.sprint(result)
end


--  Font Awesome contains a number of characters that aren't really "icons";
--  we exclude those from our lists of "all" icons.
local t = {
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e",
    "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
    "u", "v", "w", "x", "y", "z", "asterisk", "at", "divide", "equals",
    "exclamation", "greater-than", "greater-than-equal", "hashtag", "hyphen",
    "less-than", "less-than-equal", "minus", "notdef", ".notdef", "null",
    "percent", "plus", "plus-minus", "question", "space", "trademark",
    "zero-width-space"
}

local ignore = {}
for _, name in pairs(t) do
    ignore[name] = true
end

function print_all_icons(...)
    if not is_initialized then initialize() end

    local names, icons = {}, {}
    for _, t in ipairs{...} do
        for name, unicode in pairs(fa[t]) do
            if not (ignore[name] or string.match(name, "-sign$")) then
                if t == "regular" then name = name .. "-o" end
                table.insert(names, name)
                icons[name] = string.format("\\%s\\char%d", t, unicode)
            end
        end
    end

    table.sort(names)
    tex.sprint("\\begin{longtable}{cl}")
    for _, name in ipairs(names) do
        tex.sprint(string.format("%s&\\textit{%s}\\\\", icons[name], name))
    end
    tex.sprint("\\end{longtable}")
end


return { print_icon = print_icon, print_all_icons = print_all_icons }
