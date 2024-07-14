rednet.open("top")

sides = {
  "top",
  "bottom",
  "left",
  "right",
  "back",
  "front"
}

peripherals = peripheral.getNames()

for i=1,#peripherals do
  per = peripherals[i]
  print(peripheral.getType(per))
end

for i=1,#sides do
  print(sides[i])
end


