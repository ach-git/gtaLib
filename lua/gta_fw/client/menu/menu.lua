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

GtaLib.Menus = setmetatable({}, GtaLib.Menus)

GtaLib.Menus.__index = GtaLib.Menus
GtaLib.Menus.__call = function()
    return true
end

function GtaLib.Menus:setBackground(background)
    self.background = background and Material("gta_lib/"..background, "smooth") or GtaLib.Materials["bannerBasic"]
end

function GtaLib.Menus:setTitle(title)
    self.title = title
end

function GtaLib.Menus:setSubtitle(subtitle)
    self.subTitle = subtitle
end

function GtaLib.Menus:isClosable(bool)
    self.closable = bool
end

function GtaLib.Menus:close()
    self:closeMenu()
end

function GtaLib.Menus:goBack()
    self:goBackMenu()
end