require("services.dhcp")
require("services.rednetinit")

function startServices()
  --startup services
  rednetinit:init()
  dhcp:init()

  parallel.waitForAll(
    rednetinit.run,
    dhcp.run
  )
end
