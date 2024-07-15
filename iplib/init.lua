
iplib = {}


local function split_str(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

function iplib:cidr_str_to_mask_int(cidrStr)
  local ip_str_split = split_str(cidrStr,"/")
  local prefix_length = tonumber(ip_str_split[2])
  local mask = bit32.lshift(bit32.bnot(0),32 - prefix_length)
  return mask
end

function iplib:ip_str_to_ip_int(ip_str)
  local ip_str_split = split_str(ip_str,".")

  if #ip_str_split < 4 then
    error("When attempting to convert ip "..ip_str.." we were unable to get all the required blocks")
  end
  print(textutils.serialize(ip_str_split))

  --192.xxx.xxx.xxx
  local block1 = tonumber(ip_str_split[1])
  block1 = bit32.lshift(block1,24)

  --xxx.168.xxx.xxx
  local block2 = tonumber(ip_str_split[2])
  block2 = bit32.lshift(block2,16)

  --xxx.xxx.1.xxx
  local block3 = tonumber(ip_str_split[3])
  block3 = bit32.lshift(block3,8)

  --xxx.xxx.xxx.1
  local block4 = tonumber(ip_str_split[4])
  combined = bit32.bor(block1,block2,block3,block4)

  return combined

end

function iplib:ip_int_to_str(ipInt)
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


