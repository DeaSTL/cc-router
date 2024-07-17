require("iplib")

dhcpClientService = {}



function requestNewIP()
  local dhcpPayload = {
    type = iplib.messageTypes.NEW_DHCP_ADDRESS,
    data = {
      computerId = os.getComputerID()
    }
  }
  ---@type requestFmt
  local request = {
    src = 0,
    dest = 0,
    timestamp = os.date(),
    payload = textutils.serializeJSON(dhcpPayload)
  }
  rednet.broadcast(iplib:serializeRequest(request),"dhcp")
end

function dhcpClientService:init()
  print("Initializing dhcp client service")
  local dhcpIP = settings.get("dhcp.ip")

  if dhcpIP == nil then
    requestNewIP()
  end
end

function dhcpClientService:run()
  print("Running dhcp client service")
end

