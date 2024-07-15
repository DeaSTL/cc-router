require("services.dhcp")

function startServices()
  waitForAll(dhcp:run()) 
end
