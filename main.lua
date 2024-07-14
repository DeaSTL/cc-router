rednet.open("top")

sides = {
  "top",
  "bottom",
  "left",
  "right",
  "back",
  "front"
}

peripherals = peripheral.getName()

for i=1,#peripherals do
  print(peripherals[i])
end

for i=1,#sides do
  print(sides[i])
end


