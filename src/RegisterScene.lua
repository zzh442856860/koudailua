--register scene

local layer = nil
local editbox_user = nil
local editbox_pwd = nil

local s = cc.Director:getInstance():getVisibleSize()
local w = s.width/2
local h = s.height/2

local function judegePwd() --@return typeOrObject
	
end

local function sendRegisterMsg() --@return typeOrObject
	
end

local function recvRegisterMsg() --@return typeOrObject
	
end

local function init() --@return typeOrObject
    layer = cc.Layer:create()
	--cc.NotificationCenter:getInstance():
	local p1 = cc.Scale9Sprite:create()
	local p2 = cc.Scale9Sprite:create()
	
	editbox_user = cc.EditBox:create(cc.size(500, 80), p1)
	editbox_user:setFontSize(30)
	editbox_user:setReturnType(cc.KEYBOARD_RETURNTYPE_DONE)
	--editbox_user:setInput
	editbox_user:setPosition(w-130, h*2/3-60)
	editbox_user:setFontColor(cc.c3b(0,0,0))
	editbox_user:setText("")
	layer:addChild(editbox_user)
	
end

local function createLayer() --@return typeOrObject
	init()
	
	return layer
end

function CreateRigisterScene() --@return typeOrObject
	local scene = cc.Scene:create()
	scene:addChild(layer)
	return scene
end





