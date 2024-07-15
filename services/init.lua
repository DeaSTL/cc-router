require("services.dhcp")
require("services.rednetinit")

function startServices()
  --startup services
  rednetService:init()
  dhcpService:init()

  parallel.waitForAll(
    rednet.run,
    dhcpService.run
  )
end
