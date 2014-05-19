--zzh 20140519
local cjson = require "json"

local function onOpenWs(strData) --@return typeOrObject
   -- wsStatus:setString("Echo Ws was opened.")
   cclog("onOpenWs")
end

local function onMessageWs(strData)
    cclog("onMessageWs")
--    recvTimes = recvTimes + 1
--    local strInfo = "Recv: " .. strData .. ":" .. recvTimes
--    wsStatus:setString(strInfo)
    print(strData)
    local data = nil
    data = cjson.decode(strData)
    if nil ~= data then
        local cmd = data.Cmd
        local param = data.Param
        if cmd == CMD_ENTERBATTLE then
            MsgRecv[cmd] = param
        end
        
        print(cmd)
    end

end 

local function onCloseWs(strData) --@return typeOrObject
cclog("onCloseWs")
--    print("Echo ws closed.")
--    --wsStatus:setString("Echo Ws was closed.")
--    wsStatus = nil
--    wsEcho = nil
end

local function onErrorWs(strData)
cclog("onErrorWs")
--    print("Echo ws Error.")
--    wsStatus:setString("Echo Ws was Error.")
end

function InitWsSock() --@return typeOrObject
	WsSock = cc.WebSocket:create(WsAddr)
	
	if nil ~= WsSock then
       cclog("WsSock is not nil")
       
       WsSock:registerScriptHandler(onOpenWs, kWebSocketScriptHandlerOpen)
       WsSock:registerScriptHandler(onMessageWs, kWebSocketScriptHandlerMessage)
       WsSock:registerScriptHandler(onCloseWs, kWebSocketScriptHandlerClose)
       WsSock:registerScriptHandler(onErrorWs, kWebSocketScriptHandlerError)
    end 
end

