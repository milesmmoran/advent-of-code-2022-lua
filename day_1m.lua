local eio = require("libs.eio")
local profile = require("libs.profile")

local input = eio.lines()

profile.start()

local calories = {}
local elf = 0
for _, v in pairs(input) do
	print(v)
	if v == "" then
		print("elf", elf)
		table.insert(calories, elf)
		elf = 0
	else
		elf = elf + v
	end
end

table.sort(calories)

local answer1 = calories[#calories]
eio.printf("Part 1: %i\n", answer1)

local answer2 = calories[#calories] + calories[#calories - 1] + calories[#calories - 2]
eio.printf("Part 2: %i\n", answer2)

return answer1, answer2, profile.finish()
