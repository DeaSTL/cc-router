
function getModem()

  local peripherals = peripheral.getNames()

  for i=1,#peripherals do
    per = peripherals[i]
    perType = peripheral.getType(per))
    if perType then 
      print("found modem at " .. per)
      rednet.open(per)
      break
    end
  end
  error("Could not find modem")
end



getModem()





