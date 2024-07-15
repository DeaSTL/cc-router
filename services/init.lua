require("services.dhcp")
require("services.rednet")

---@alias routerConfig {ip: integer, ipRange: integer}
--
---@param config routerConfig
function startServices(config)
  --startup services
  rednetService:init()
  dhcpService:init()

  parallel.waitForAll(
    rednetService.run,
    dhcpService.run
  )
end
