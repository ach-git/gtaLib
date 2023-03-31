---@author ach <ach#9690>
---@version 0.1
--[[
  
  	This file is part of GTA Lib Project.
  
	Copyright (c) 2023 ach

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
  
--]]

function GtaLib:loadFonts()
    GtaLib.sw, GtaLib.sh = ScrW(), ScrH()

    surface.CreateFont("GTA_BANNER", {
        font = "Copyright House Industries",
        extented = false,
        antialias = true,
        size = ScreenScale(23),
        weight = 100,
    })
    surface.CreateFont("GTA_MAIN", {
        font = "Tahoma",
        extented = false,
        antialias = true,
        size = ScreenScale(8.75),
        weight = 500,
    })
    surface.CreateFont("GTA_MAIN2", {
        font = "Tahoma",
        extented = false,
        antialias = true,
        size = ScreenScale(5),
        weight = 560,
    })
    surface.CreateFont("GTA_CHECK", {
        font = "Tahoma",
        extented = false,
        antialias = true,
        size = ScreenScale(8),
        weight = 500,
    })
    surface.CreateFont("GTA_CHECK2", {
        font = "Tahoma",
        extented = false,
        antialias = true,
        size = ScreenScale(22),
        weight = 500,
    })
    surface.CreateFont("GTA_NOTIFY", {
        font = "Tahoma",
        size = ScreenScale(20),
        weight = 500
    })
end

GtaLib:loadFonts()
hook.Add("OnScreenSizeChanged", "VRHookSetResolution_WeaponSelector", function()
    GtaLib:loadFonts()
end)
