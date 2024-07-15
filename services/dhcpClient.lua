dhcpClientService = {}

function dhcpClientService:init()
  print("Initializing dhcp client service")
  
  rednet.send()
end

function dhcpClientService:run()
  print("Running dhcp client service")
end

