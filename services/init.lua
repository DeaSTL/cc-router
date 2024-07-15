require("services.dhcp")
require("services.rednetinit")

function startServices()
  --startup services
  rednetinit:init()
  dhcp:init()

  waitForAll(dhcp:run(),rednetinit:run())
end
