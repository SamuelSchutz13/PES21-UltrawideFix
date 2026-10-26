-- Set UltraWide
-- address search by elijio876
-- module by Mohamed2746
-- Based on GFX LOD by digitalfoxx(PESWEB), nesa24 & Zyraxz

local m = { version = "1.0" }

function m.init(ctx)
    local UltraWide_addr = memory.search_process("\x80\x7b\x7c\x00\x0f\x28")
    if UltraWide_addr then
        log(string.format("found UltraWide_addr min address at: %s", memory.hex(UltraWide_addr)))
        memory.write(UltraWide_addr, "\x80\x7b\x7c\x01\x0f\x28")
        log("Set UltraWide")
    else
        error("unable to find UltraWide_addr")
    end
end

return m
