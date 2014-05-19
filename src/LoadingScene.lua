--zzh 2014-05-17

require "ResourceName"

local layer = nil
local bg = nil
local progressBg = nil
local progress = nil

local s = 0
local w = 0
local h = 0

local function init() --@return typeOrObject
    layer = cc.LayerColor:create(cc.c4b(0,0,0,0))
    
    s = cc.Director:getInstance():getWinSize()
    w = s.width/2
    h = s.height/2
    --±³¾°
    bg = cc.Sprite:create(M_LOADING_BG)
    bg:setPosition(w, h)
    layer:addChild(bg, 0)
    --
    progressBg = cc.Sprite:create(M_PROGRESS_BG)
    progressBg:setPosition(w,h)
    layer:addChild(progressBg, 1)
    --
    progress = cc.ProgressTimer:create(cc.Sprite:create(M_PROGRESS))
    progress:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    progress:setMidpoint(cc.p(1,0))
    progress:setBarChangeRate(cc.p(1,0))
    progress:setPosition(w,h)
    layer:addChild(progress, 2)
    	
end

local function textureLoaded(pObj)
    local name = pObj
    cclog("Image loaded: ", name)
end 

local function loadTexture() 
    local cache = cc.Director:getInstance():getTextureCache()
--    cache:addImageAsynv(M_LOGIN_BG, textureLoaded)
--    cache:addImageAsynv(M_LOGIN_BTN_UP, textureLoaded)
--    cache:addImageAsynv(M_LOGIN_BTN_DOWN, textureLoaded)
--    cache:addImageAsynv(M_CHUANGJIAN_UP, textureLoaded)
end

local function onExit() --@return typeOrObject
	cc.Director:getInstance():getTextureCache():removeTextureForKey(M_LOADING_BG)
	cc.Director:getInstance():getTextureCache():removeTextureForKey(M_PROGRESS_BG)
	cc.Director:getInstance():getTextureCache():removeTextureForKey(M_PROGRESS)
	
	--cc.Director:getInstance():replaceScene()
end

local function onNodeEvent(event) --@return typeOrObject
	if "exit" == event then
	   onExit()
	end
end

local function createLayer() --@return typeOrObject
	init()
	loadTexture()
	
	layer:registerScriptHandler(onNodeEvent)
	return layer
end

function createLoadingScene() --@return typeOrObject
	local scene = cc.Scene:create()
	scene:addChild(createLayer())
	return scene
end

