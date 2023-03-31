GtaLib = {}

function GtaLib:AddFile(strPath, boolInclude)
	local files, folders = file.Find(strPath .. "*", "LUA")

	for _,v in pairs(files or { }) do
		if boolInclude then
			include(strPath .. v)
		else
			AddCSLuaFile(strPath .. v)
		end
	end

	for _,v in pairs(folders) do
		self:AddFile(strPath .. v .. "/",boolInclude)
	end
end

if ( SERVER ) then
	-- Load Shared Files
	GtaLib:AddFile("gta_lib/shared/",true)
	GtaLib:AddFile("gta_lib/shared/",false)

	-- Load Server Files
	GtaLib:AddFile("gta_lib/server/",true)

	-- Load Client Files
	GtaLib:AddFile("gta_lib/client/",false)

	return
end

GtaLib:AddFile("gta_lib/shared/",true)

GtaLib:AddFile("gta_lib/client/",true)