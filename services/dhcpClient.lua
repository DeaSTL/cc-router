dhcpClientService = {}

function requestNewIP()
  local dhcpPayload = {
    type = iplib.messageTypes.NEW_DHCP,
    data = {
      computerId = os.getComputerID()
    }
  }
  ---@type requestFmt
  local request = {
    src = nil,
    dest = nil,
    timestamp = os.date(),
    payload = textutils.serializeJSON(dhcpPayload)
  }
  rednet.broadcast(request,"dhcp")
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

