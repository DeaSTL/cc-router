require("services.dhcp")
require("services.rednetinit")

function startServices()
  --startup services
  rednetService:init()
  dhcpService:init()

  parallel.waitForAll(
    rednetService.run,
    dhcpService.run
  )
end
