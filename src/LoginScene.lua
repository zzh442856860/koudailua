--20140517

local layer = nil--cc.Layer
local loginMenu = nil--cc.Menu
local regisMenu = nil --cc.Menu


local function loadUI() --@return typeOrObject
	
end

local function addRegisterLayer() --@return typeOrObject
	
end

local function init() --@return typeOrObject
	layer = cc.Layer:create()
	
	--WsSock = cc.Websock(WS_ADDR)
	
	
end

local function createLayer() --@return typeOrObject
	init()
	
	return layer
end

function CreateLoginScene() --@return typeOrObject
	local scene = cc.Scene:create()
    scene:addChild(createLayer())
    return scene
end
