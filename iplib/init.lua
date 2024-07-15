
iplib = {}


local function splitStr(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

function iplib:cidrStrToMask(cidrStr)
  local ipStrSplit = splitStr(cidrStr,"/")
  local prefixLength = tonumber(ipStrSplit[2])
  local mask = bit32.lshift(bit32.bnot(0),32 - prefixLength)
  return mask
end

function iplib:ipStrToIpInt(ipStr)
  local ipStrSplit = splitStr(ipStr,".")

  if #ipStrSplit < 4 then
    error("When attempting to convert ip "..ipStr.." we were unable to get all the required blocks")
  end
  print(textutils.serialize(ipStrSplit))

  --192.xxx.xxx.xxx
  local block1 = tonumber(ipStrSplit[1])
  block1 = bit32.lshift(block1,24)

  --xxx.168.xxx.xxx
  local block2 = tonumber(ipStrSplit[2])
  block2 = bit32.lshift(block2,16)

  --xxx.xxx.1.xxx
  local block3 = tonumber(ipStrSplit[3])
  block3 = bit32.lshift(block3,8)

  --xxx.xxx.xxx.1
  local block4 = tonumber(ipStrSplit[4])
  combined = bit32.bor(block1,block2,block3,block4)

  return combined

end

function iplib:ipToString(ipInt)
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


