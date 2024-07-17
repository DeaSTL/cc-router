require('dhcplib')

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
    local request_data = iplib:deserializeRequest(message)

    print("ID:",id,"Message:",textutils.serialize(request_data))

    ---@type dhcpRequest
    local dhcp_request = textutils.JSONdeserialize(request_data.payload)

    if dhcp_request.type == dhcplib.messageTypes.NEW_DHCP_ADDRESS then
      
    end

  end
end
