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

function GtaLib:loadMenu(menu)
    -- Banner
    surface.SetDrawColor(GtaLib.Colors["white"])
    surface.SetMaterial(menu.background)
    surface.DrawTexturedRect(GtaLib.sw*menu.x, GtaLib.sh*menu.y, GtaLib.sw*0.23, GtaLib.sh*0.10)
    draw.SimpleText(menu.title, "GTA_BANNER", GtaLib.sw*(menu.x+0.23/2), GtaLib.sh*(menu.y+0.10/2), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    menu.y = menu.y + 0.10

    -- SubTitle
    if menu.subTitle then
        draw.RoundedBox(0, GtaLib.sw*menu.x, GtaLib.sh*menu.y, GtaLib.sw*0.23, GtaLib.sh*0.035, GtaLib.Colors["black250"])
        draw.SimpleText(menu.subTitle, "GTA_MAIN", GtaLib.sw*(menu.x+0.005), GtaLib.sh*(menu.y+0.035/2), color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        local index = menu.index
        if menu.maxIndex == 0 then
            index = 0
        end
        local separatorNumber = 0
        for k, v in pairs(menu.separator or {}) do
            if menu.index > k then
	           index = index - 1
            end
            separatorNumber = separatorNumber + 1
        end
        draw.SimpleText(index.."/"..(menu.maxIndex-separatorNumber), "GTA_MAIN", GtaLib.sw*(menu.x+0.225), GtaLib.sh*(menu.y+0.035/2), color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
        menu.y = menu.y + 0.0345
    end
end

local descA = ""
function GtaLib:footer(menu)
    if menu.maxIndex >= 12 then
        draw.RoundedBox(0, GtaLib.sw*menu.x, GtaLib.sh*menu.y, GtaLib.sw*0.23, GtaLib.sh*0.0275, GtaLib.Colors["black250"])
        draw.SimpleText("∧", "GTA_MAIN2", GtaLib.sw*(menu.x+0.23/2), GtaLib.sh*(menu.y+0.025/2.8), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("∨", "GTA_MAIN2", GtaLib.sw*(menu.x+0.23/2), GtaLib.sh*(menu.y+0.025/1.3), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        menu.y = menu.y + 0.0275
    end

    menu.y = menu.y + 0.020

    if descA ~= menu.desc then
        menu.descPanel:SetText("")
        descA = menu.desc
        if descA ~= "" then
            menu.descPanel:AppendText(descA)
        end
    end

    menu.descPanel:SetPos(GtaLib.sw*(menu.x+0.0025), GtaLib.sh*menu.y)
    menu.descPanel:SetSize(GtaLib.sw*0.225, GtaLib.sh-(GtaLib.sh*(menu.y/2)))
    if descA ~= "" then
        draw.RoundedBox(0, GtaLib.sw*menu.x, GtaLib.sh*menu.y, GtaLib.sw*0.23, (GtaLib.sh*0.005)+(GtaLib.sh*0.025)*menu.descPanel:GetNumLines(), GtaLib.Colors["black225"])
    end
end