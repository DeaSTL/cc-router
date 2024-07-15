require("iplib")


local config = {
  ip=iplib:ipStrToInt("192.168.1.1"),
  ipRange=iplib:cidrStrToMaskInt("192.168.1.0/16"),
}

function config:generateIpRange()
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

print("ipstr:"..iplib:ipIntToStr(config.ip))
print("masked ip:"..
  iplib:ipIntToStr(
    bit32.band(
      bit32.bnot(config.ipRange),
      config.ip
    )
  )
)

print("inverted range: ",bit32.bnot(config.ipRange))
config:generateIpRange()
getModem()





