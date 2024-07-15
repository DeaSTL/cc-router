dhcpService = {}

function dhcpService:init()
  print("Initializing dhcp service")
end
function dhcpService:run()
  print("Running dhcp service")
  while true do
    local id, message = rednet.recieve("dhcp")
  end
end
