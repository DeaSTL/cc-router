require("services.dhcp")
require("services.rednet")


---@param routerConfig
function startServices(config)
  --startup services
  rednetService:init()
  dhcpService:init()

  parallel.waitForAll(
    rednetService.run,
    dhcpService.run
  )
end
