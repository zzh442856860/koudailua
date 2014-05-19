--zzh 20140519
local cjson = require("json")


CMD_ENTERBATTLE = "Cmd_enterbattle"

function ConstructMsg(cmd, msg) --@return typeOrObject
    local buf = {}
    buf["Cmd"] = cmd 
    buf["Param"] = msg
	return cjson.encode(buf)
end