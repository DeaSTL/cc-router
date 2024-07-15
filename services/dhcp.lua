dhcpService = {}

---@param config routerConfig
function dhcpService:init(config)
  print("Initializing dhcp service")
end

---@param config routerConfig
function dhcpService:run(config)
  print("Running dhcp service")
  while true do
    local id, message = rednet.receive("dhcp")
    local requestData = iplib:deserializeRequest(message)

    print("ID:",id,"Message:",requestData)

    ---@type requestFmt
    local data = iplib:serializeRequest(message)
    
    
  end
end
