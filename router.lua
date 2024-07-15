require("iplib")
require("services")


---@type routerConfig
local config = {
  ip=iplib:ipStrToInt("192.168.1.1"),
  ipRange=iplib:cidrStrToMaskInt("192.168.1.0/24"),
}


function config:generateIpRange()
  local maxRange = bit32.bnot(self.ipRange)
  local ipPrefix = bit32.band(self.ip, self.ipRange)
  for i = 0, maxRange, 1 do
    print(iplib:ipIntToStr(bit32.bor(ipPrefix,i))) 
  end
end




print("ipstr:"..iplib:ipIntToStr(config.ip))
print("masked ip:"..
  iplib:ipIntToStr(
    bit32.band(
      bit32.bnot(config.ipRange),
      config.ip
    )
  )
)

startRouterServices(config)
-- print("inverted range: ",bit32.bnot(router.ipRange))
-- router:generateIpRange()
-- getModem()





