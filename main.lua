require("iplib")
require("services")


local router = {
  ip=iplib:ipStrToInt("192.168.1.1"),
  ipRange=iplib:cidrStrToMaskInt("192.168.1.0/24"),
}


function router:generateIpRange()
  local maxRange = bit32.bnot(self.ipRange)
  local ipPrefix = bit32.band(self.ip, self.ipRange)
  
  for i = 0, maxRange, 1 do
    print(iplib:ipIntToStr(bit32.bor(ipPrefix,i))) 
  end
end



function getModem()

  local peripherals = peripheral.getNames()

  for i=1,#peripherals do
    per = peripherals[i]
    perType = peripheral.getType(per)
    if perType == 'modem' then 
      print("found modem at " .. per)
      rednet.open(per)
      return
    end
  end
  error("Could not find modem")
end

print("ipstr:"..iplib:ipIntToStr(router.ip))
print("masked ip:"..
  iplib:ipIntToStr(
    bit32.band(
      bit32.bnot(router.ipRange),
      router.ip
    )
  )
)

startServices()
print("inverted range: ",bit32.bnot(router.ipRange))
router:generateIpRange()
getModem()





