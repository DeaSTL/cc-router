require("iplib")


local config = {
  ip=iplib:ipStrToInt("192.168.1.1"),
  subnetMask=iplib:cidrStrToMaskInt("192.168.1.0/24")
}



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
  bit32.band(
    iplib:cidrStrToMaskInt(config.subnetMask),
    config.ip
  )
)
getModem()





