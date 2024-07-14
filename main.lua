

local config = {
  ip=0xC0A80001
}


function formatIP(ipInt)
  local block1 = bit32.band(0xFF000000)
  block1 = bit32.rshift(block1,24)

  local block2 = bit32.band(0x00FF0000)
  block2 = bit32.rshift(block1,16)

  local block3 = bit32.band(0x0000FF00)
  block3 = bit32.rshift(block1,8)

  local block4 = bit32.band(0x000000FF)

  print(
  block1.. "," ..
  block2.. "," ..
  block3.. "," ..
  block4
  )
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



getModem()





