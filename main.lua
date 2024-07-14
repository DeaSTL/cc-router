

local config = {
  ip="192.168.1.1",
  dhcpIpRange="192.168.1.0/24"
}

function splitStr(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

function cidrStrToMask(cidrStr)
   
end

function ipStrToIpInt(ipStr)
  ipStrSplit = splitStr(ipStr,".")

  if #ipStrSplit < 4 then
    error("When attempting to convert ip "..ipStr.." we were unable to get all the required blocks")
  end
  print(textutils.serialize(ipStrSplit))

  local block1 = tonumber(ipStrSplit[1])
  block1 = bit32.lshift(block1,24)
  local block2 = tonumber(ipStrSplit[2])
  block2 = bit32.lshift(block2,16)
  local block3 = tonumber(ipStrSplit[3])
  block3 = bit32.lshift(block3,8)
  local block4 = tonumber(ipStrSplit[4])
 
  print(
  block1.."."..
  block2.."."..
  block3.."."..
  block4
  )
  combined = bit32.bor(block1,block2,block3,block4)

  return combined

end

function ipToString(ipInt)
  --192.xxx.xxx.xxx
  local block1 = bit32.band(0xFF000000,ipInt)
  block1 = bit32.rshift(block1,24)

  --xxx.168.xxx.xxx
  local block2 = bit32.band(0x00FF0000,ipInt)
  block2 = bit32.rshift(block2,16)

  --xxx.xxx.1.xxx
  local block3 = bit32.band(0x0000FF00,ipInt)
  block3 = bit32.rshift(block3,8)

  --xxx.xxx.xxx.1
  local block4 = bit32.band(0x000000FF,ipInt)

  return
  block1.. "." ..
  block2.. "." ..
  block3.. "." ..
  block4
  
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

config.ip = 

getModem()
ipToString(config.ip)

ipStrToIpInt("192.168.1.1")




