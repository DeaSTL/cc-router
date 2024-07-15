require("services.dhcp")
require("services.rednetinit")

function startServices()
  dhcp:init()
  rednetinit:init()
  waitForAll(dhcp:run(),rednetinit:run()) 
end
