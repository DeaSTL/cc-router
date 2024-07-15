rednetService = {}


function setupModem()

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

---@param config routerConfig
function rednetService:init(config)
  print("Initializing rednet service")
  setupModem()
end

---@param config routerConfig
function rednetService:run(config)
  print("Running rednet service")
end
