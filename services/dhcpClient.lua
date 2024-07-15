dhcpClientService = {}

function requestNewIP()
  local dhcpPayload = {
    type = "DHCP_NEW"

  }
  local request = {

  }
  rednet.send
end

function dhcpClientService:init()
  print("Initializing dhcp client service")
  local dhcpIP = settings.get("dhcp.ip")

  if dhcpIP == nil then
    
  end
  ---@type requestFmt
  local request = {
    src = 
  }
  rednet.send()
end

function dhcpClientService:run()
  print("Running dhcp client service")
end

