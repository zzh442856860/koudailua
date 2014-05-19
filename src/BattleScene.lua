--zzh 20140519
local cjson = require "json"

local layer = nil
local s = cc.Director:getInstance():getVisibleSize()
local w = s.width/2
local h = s.height/2
local scheduleMsg = nil
local scheduler = cc.Director:getInstance():getScheduler()

local function recvEnterBattle(dt) --@return typeOrObject
    local msg = MsgRecv[CMD_ENTERBATTLE]
    if nil ~= msg then
       --unschedule(recvEnterBattle)
       print(msg)
       print("recv msg: ", cjson.decode(msg))
       MsgRecv[CMD_ENTERBATTLE] = nil
       msg = nil
       scheduler:unscheduleScriptEntry(scheduleMsg)
       scheduleMsg = nil
       
    end
end

local function sendEnterBattle() --@return typeOrObject
	local tab = {}
	tab["pid"] = "zzh"
	--data to json
	--local jsonData = cjson.encode(tab)
	--WsSock:sendString(jsonData)
	local buf = ConstructMsg(CMD_ENTERBATTLE,tab)
	WsSock:sendString(buf)
	print(jsonData)
	scheduleMsg = scheduler:scheduleScriptFunc(recvEnterBattle, 1.0, false)
	--schedule(recvEnterBattle)
end



local function createLayer() --@return typeOrObject
	layer = cc.Layer:create()
	
	local bg = cc.Sprite:create(M_BATTLE_BG)
	bg:setPosition(w,h)
	layer:addChild(bg)
	
	sendEnterBattle()
	return layer
end

function CreateBattleScene() --@return typeOrObject
	local scene = cc.Scene:create()
	scene:addChild(createLayer())
	return scene
end