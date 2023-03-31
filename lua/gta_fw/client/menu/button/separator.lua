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

function GtaLib:separator(menu, name, style)
    menu.maxIndex = menu.maxIndex + 1

    menu.separator[menu.maxIndex] = true

    if menu.index > 11 then
        if menu.maxIndex > menu.index or menu.maxIndex < menu.index-10 then
            return
        end
    else
        if menu.maxIndex > 11 then
            return
        end
    end

    draw.RoundedBox(0, GtaLib.sw*menu.x, GtaLib.sh*menu.y, GtaLib.sw*0.23, GtaLib.sh*0.031, GtaLib.Colors["black225"])
    draw.SimpleText(name, "GTA_MAIN", GtaLib.sw*(menu.x+0.115), GtaLib.sh*menu.y, (style and style.textColor) or color_white, TEXT_ALIGN_CENTER) 

    menu.y = menu.y + 0.0305
end

function GtaLib:lineSeparator(menu, style)
    menu.maxIndex = menu.maxIndex + 1

    menu.separator[menu.maxIndex] = true

    if menu.index > 11 then
        if menu.maxIndex > menu.index or menu.maxIndex < menu.index-10 then
            return
        end
    else
        if menu.maxIndex > 11 then
            return
        end
    end

    draw.RoundedBox(0, GtaLib.sw*menu.x, GtaLib.sh*menu.y, GtaLib.sw*0.23, GtaLib.sh*0.031, GtaLib.Colors["black225"])
    draw.RoundedBox(32, GtaLib.sw*(menu.x+0.03), GtaLib.sh*(menu.y+0.014), GtaLib.sw*0.17, GtaLib.sh*0.003, (style and style.color) or color_white)

    menu.y = menu.y + 0.0305
end