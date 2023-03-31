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

local keys = {}
function GtaLib:registerKey(key, func)
    keys[#keys+1] = { key = key, func = func, cooldown = 0 }
end

hook.Add("Think", "GtaLib:KeyRegistered", function()
    for _, v in pairs(keys) do
        if input.IsKeyDown( v.key ) then
            if CurTime() >= v.cooldown then
                v.cooldown = CurTime() + 0.20
                v.func()
            end
        end
    end
end)