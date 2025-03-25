local fontawesome_free = {
    solid   = "Font Awesome 6 Free-Solid-900.otf",
    regular = "Font Awesome 6 Free-Regular-400.otf",
    brands  = "Font Awesome 6 Brands-Regular-400.otf",
}

for fontname, fontfile in pairs(fontawesome_free) do
    fontfile = kpse.find_file(fontfile, "opentype fonts")
    if fontfile then
        tex.sprint(string.format("\\font\\%s = \"[%s]\"", fontname, fontfile))
        fontawesome_free[fontname] = fontfile
    else
        fontawesome_free[fontname] = nil
    end
end

local fonts_version
_, _, fonts_version = string.find(
    fontloader.info(fontawesome_free.solid).version,
    "%(Font Awesome version: ([%d.]+)%)"
)
fonts_version = fonts_version or "[\\emph{unknown}]"

-- We cannot initialize the fa table at this point,
-- because TeX hasn't loaded the fonts yet;
-- hence we delay the initialization.

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
    "less-than", "less-than-equal", "minus", "notdef", ".notdef", "not-equal",
    "null", "percent", "plus", "plus-minus", "question", "space", "trademark",
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
    for _, name in ipairs(names) do
        tex.sprint(
            string.format(
                "\\noindent\\makebox[1.25em][c]{%s}\\hspace{1.25em}%s\\par",
                icons[name],
                name))
    end
end


return {
    print_icon = print_icon,
    -- The next items are not part of the supported API and may change without warning!
    _print_all_icons = print_all_icons,
    _fonts_version = fonts_version,
}
