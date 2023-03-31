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

GtaLib.MenuOpen = false
GtaLib.canEnter = 0
GtaLib.canMove = 0
GtaLib.canGoBack = 0
GtaLib.canGoLeft = 0
GtaLib.canGoRight = 0

function GtaLib:createMenu(title, subtitle, background)
    local Menu = {}

    Menu.title = title or "GTA Framework"
    Menu.subTitle = subtitle or false
    Menu.background = background and Material("gta_lib/"..background, "smooth") or GtaLib.Materials["bannerBasic"]
    Menu.baseX = 0.02
    Menu.baseY = 0.02
    Menu.closable = true
    Menu.action = function() return end
    Menu.onClose = function() return end
    Menu.closeMenu = function() return end

    menu.desc = ""
    menu.separator = {}
    Menu.index = 1
    Menu.maxIndex = 0

    return setmetatable(Menu, GtaLib.Menus)
end

function GtaLib:createSubMenu(parent, title, subtitle, funcDraw, background)
    local Menu = {}

    Menu.title = title or "GTA Framework"
    Menu.subTitle = subtitle or false
    Menu.background = background and Material("gta_lib/"..background, "smooth") or GtaLib.Materials["bannerBasic"]
    Menu.baseX = 0.02
    Menu.baseY = 0.02
    Menu.closable = true
    Menu.action = function() return end
    Menu.onClose = function() return end
    Menu.closeMenu = function() return end
    Menu.funcDraw = funcDraw

    Menu.parent = parent
    Menu.parentFunc = function() return end

    menu.desc = ""
    menu.separator = {}
    Menu.index = 1
    Menu.maxIndex = 0

    return setmetatable(Menu, GtaLib.Menus)
end

function GtaLib:drawMenu(menu, addonsFunc)
    if menu ~= nil then
        if GtaLib.MenuOpen then
            print("Try to open 2 menu")
            return
        end
        GtaLib.MenuOpen = true
        GtaLib.canGoBack = CurTime() + 0.25
        GtaLib.canMove = CurTime() + 0.25
        GtaLib.canEnter = CurTime() + 0.25
        local Panel = vgui.Create("DFrame")
        Panel:SetSize(GtaLib.sw,GtaLib.sh)
        Panel:SetPos(GtaLib.sw, GtaLib.sh)
        Panel:Center()
        Panel:SetTitle("")
        Panel:SetSizable(false)
        Panel:SetDraggable(false)
        Panel:ShowCloseButton(false)
        Panel.Paint = function(self, w, h)
            menu.closeMenu = function()
                self:Remove()
                GtaLib.MenuOpen = false
                menu.onClose()
            end
            menu.goBackMenu = function()
                if menu.parent then
                    GtaLib.MenuOpen = false
                    self:Remove()
                    GtaLib:drawMenu(menu.parent, menu.parentFunc)
                else
                    print("Can't go back")
                end
            end
            if input.IsKeyDown( KEY_LEFT ) and menu.moveList then
                if CurTime() >= GtaLib.canGoLeft then
                    GtaLib.canGoLeft = CurTime() + 0.20
                    menu.moveList(false)
                end
            elseif input.IsKeyDown( KEY_RIGHT ) and menu.moveList then
                if CurTime() >= GtaLib.canGoRight then
                    GtaLib.canGoRight = CurTime() + 0.20
                    menu.moveList(true)
                end
            elseif input.IsKeyDown(KEY_UP) then
                if CurTime() >= GtaLib.canMove then
                    GtaLib.canMove = CurTime() + 0.15
                    :: move_up ::
                    if menu.index == 1 then
                        menu.index = menu.maxIndex
                    else
                        menu.index = menu.index - 1
                    end
                    if menu.separator[menu.index] then
                        goto move_up
                    end
                end
            elseif input.IsKeyDown(KEY_DOWN) then
                if CurTime() >= GtaLib.canMove then
                    GtaLib.canMove = CurTime() + 0.15
                    :: move_down ::
                    if menu.index == menu.maxIndex then
                        menu.index = 1
                    else
                        menu.index = menu.index + 1
                    end
                    if menu.separator[menu.index] then
                        goto move_down
                    end
                end
            elseif input.IsKeyDown(KEY_ENTER) then
                if CurTime() >= GtaLib.canEnter then
                    GtaLib.canEnter = CurTime() + 0.20
                    menu.action()
                    if menu.submenu then
                        GtaLib.MenuOpen = false
                        self:Remove()
                        menu.submenu.parentFunc = addonsFunc
                        GtaLib:drawMenu(menu.submenu, menu.submenu.funcDraw)
                    end
                end
            elseif input.IsKeyDown(KEY_BACKSPACE) or input.IsKeyDown(KEY_ESCAPE) then
                if CurTime() >= GtaLib.canGoBack then
                    GtaLib.canGoBack = CurTime() + 0.20
                    if menu.parent then
                        GtaLib.MenuOpen = false
                        self:Remove()
                        GtaLib:drawMenu(menu.parent, menu.parentFunc)
                    else
                        if menu.closable then
                            GtaLib.MenuOpen = false
                            self:Remove()
                            menu.onClose()
                        end
                    end
                end
            end
            menu.submenu = false
            menu.moveList = false
            menu.x = menu.baseX
            menu.y = menu.baseY
            GtaLib:loadMenu(menu)
            menu.separator = {}
            menu.maxIndex = 0
            if addonsFunc then
                addonsFunc(menu)
            end
            GtaLib:footer(menu)
        end

        menu.descPanel = vgui.Create( "RichText", Panel )
        menu.descPanel:SetVerticalScrollbarEnabled(false)
        menu.descPanel:SetText(menu.desc or "")
        function menu.descPanel:PerformLayout()
            self:SetFontInternal("GTA_MAIN")
            self:SetFGColor(color_white)
        end
    end
end