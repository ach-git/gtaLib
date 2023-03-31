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

function GtaLib:checkBox(menu, name, desc, func, style, checked)
    menu.maxIndex = menu.maxIndex + 1
    if menu.index > 11 then
        if menu.maxIndex > menu.index or menu.maxIndex < menu.index-10 then
            return
        end
    else
        if menu.maxIndex > 11 then
            return
        end
    end
    if menu.maxIndex == menu.index then
        draw.RoundedBox(0, GtaLib.sw*menu.x, GtaLib.sh*menu.y, GtaLib.sw*0.23, GtaLib.sh*0.030, GtaLib.Colors["white225"])
        draw.SimpleText(name, "GTA_MAIN", GtaLib.sw*(menu.x+0.005), GtaLib.sh*menu.y, (style and style.textColor) or color_black)
        draw.SimpleText("□", "GTA_CHECK2", GtaLib.sw*(menu.x+0.2285), GtaLib.sh*(menu.y+0.005), color_black, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
        if checked then
            draw.SimpleText("✓", "GTA_CHECK", GtaLib.sw*(menu.x+0.226), GtaLib.sh*(menu.y+0.0125), color_black, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
        end

        menu.desc = desc or ""

        if func and func.onHovered then
            func.onHovered()
        end

        menu.action = function()
            if func then
                if not checked then
                    if func.onChecked then
                        func.onChecked()
                    end
                else
                    if func.onUnchecked then
                        func.onUnchecked()
                    end
                end
            end
        end
    else
        draw.RoundedBox(0, GtaLib.sw*menu.x, GtaLib.sh*menu.y, GtaLib.sw*0.23, GtaLib.sh*0.031, GtaLib.Colors["black225"])
        draw.SimpleText(name, "GTA_MAIN", GtaLib.sw*(menu.x+0.005), GtaLib.sh*menu.y, (style and style.textColor) or color_white)

        draw.SimpleText("□", "GTA_CHECK2", GtaLib.sw*(menu.x+0.2285), GtaLib.sh*(menu.y+0.005), color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
        if checked then
            draw.SimpleText("✓", "GTA_CHECK", GtaLib.sw*(menu.x+0.226), GtaLib.sh*(menu.y+0.0125), color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
        end
    end
    menu.y = menu.y + 0.0305
end