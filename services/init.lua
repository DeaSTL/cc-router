require("services.dhcp")
require("services.rednet")
require("services.dhcpClient")
require("services.icmp")


---@alias routerConfig {ip: integer, ipRange: integer}
--
---@param config routerConfig
function startRouterServices(config)
  --startup services
  rednetService:init(config)
  dhcpService:init(config)

  parallel.waitForAll(
    rednetService.run,
    dhcpService.run
  )
end

function startClientServices(config)
  rednetService:init(config)
  dhcpClientService:init()

  parallel.waitForAll(
    rednetService.run,
    dhcpClientService.run,
    icmpService.run
  )
end

