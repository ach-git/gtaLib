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

-- Test Variables
local redColor = Color(255, 0, 0, 255)
local blueColor = Color(0, 0, 255, 255)
local checkBox = false
local listIndex = 1
local list = {
    "List Item #1",
    "List Item #2",
    "List Item #3",
    "List Item #4",
    "List Item #5"
}
---

local testMenu = GtaLib:createMenu("AJ Menu", "Test subtitle" --[[, "banner247" ]]) -- Create a menu, set Title and Subtitle (and also banner style)
testMenu:setTitle("AJ Menu Edited") -- Edit Title
testMenu:setSubtitle("Test subtitle Edited") -- Edit Subtitle
testMenu:isClosable(true) -- Menu can closed with key (default true)
-- testMenu:close() --  Close the menu
testMenu.onClose = function() -- When menu closed
    print("onClose")
end

local testSubmenu = GtaLib:createSubMenu(testMenu, "AJ SubMenu", "Submenu subtitle", function(menu) -- Create a subMenu same createMenu but with parent and draw function
    GtaLib:button(menu, "Button in subtitle")
end)

local testListSubmenu = GtaLib:createSubMenu(testMenu, "AJ SubMenu", "Submenu subtitle list", function(menu) -- Create a subMenu same createMenu but with parent and draw function
    GtaLib:button(menu, "Exucuted with "..list[listIndex])
end)

concommand.Add("test", function(ply, cmd, args) -- Create a test command
    GtaLib:drawMenu(testMenu, function(menu) -- Draw menu
        -- Button --
        -- GtaLib:button(parent, name, action, style, submenu)
        GtaLib:button(menu, "Button", "Test description")

        GtaLib:separator(menu, "Separator")

        GtaLib:button(menu, "Button", "Test description\nTest Line\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", { -- Create a button
            onActive = function() -- Executed on player active the button
                print("onActive")
            end,
            onHovered = function() -- Executed on player hover the button
                print("onHovered")
            end
        }, { textColor = redColor, rightText = "test", rightTextColor = blueColor } )

        GtaLib:lineSeparator(menu)

        GtaLib:button(menu, "Submenu button", "Submenu test in a button", {}, { rightText = ">" }, testSubmenu)

        ---

        -- CheckBox --
        --GtaLib:checkBox(parent, name, action, style, checked)

        GtaLib:checkBox(menu, "CheckBox", nil, {
            onChecked = function() -- Executed on player check the button
                print("onChecked")
                checkBox = true
            end,
            onUnchecked = function() -- Executed on player unCheck the button
                print("onUnchecked")
                checkBox = false
            end
        }, {}, checkBox)

        ---

        -- List --
        --GtaLib:list(parent, name, action, style, list, index, submenu)

        GtaLib:list(menu, "List", nil,    {
            onListChange = function(index) -- Executed on player change list index
                print("onListChange")
                listIndex = index
            end
        }, {}, list, listIndex, testListSubmenu)

        ---

        GtaLib:lineSeparator(menu, { color = blueColor })

        GtaLib:button(menu, "Button")
        GtaLib:button(menu, "Button")
        GtaLib:button(menu, "Button")
        GtaLib:button(menu, "Button")
        GtaLib:button(menu, "Button")
        GtaLib:button(menu, "Button")
        GtaLib:button(menu, "Button")
        GtaLib:button(menu, "Button")
        GtaLib:button(menu, "Button")
        GtaLib:button(menu, "Button")
        GtaLib:button(menu, "Button")
        GtaLib:button(menu, "Button")
    end)
end)