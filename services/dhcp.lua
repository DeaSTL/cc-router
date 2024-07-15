dhcpService = {}

function dhcpService:init()
  print("Initializing dhcp service")
end
function dhcpService:run()
  print("Running dhcp service")
  while true do
    local id, message = rednet.receive("dhcp")

    print("ID:",id,"Message:",message)

    ---@type requestFmt
    local data = iplib:serializeRequest(message)
    

  end
end
