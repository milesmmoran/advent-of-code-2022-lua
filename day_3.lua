local eio = require("libs.eio")
local profile = require("libs.profile")
local estring = require("libs.estring")
local Set = require("libs.Set")

local input = eio.lines()
local printf = eio.printf
local isLower = estring.isLower
local byte = string.byte
local sub = string.sub
local len = string.len
local makeSet = Set.fromString
local any = Set.getAnyElement
local floor = math.floor

local priorities = {}

local alphabet = {}
for i = 65, 90 do -- ASCII values for uppercase letters A-Z
	table.insert(alphabet, string.char(i))
end

profile.start()
local sols = {}
for _, str in pairs(input) do
	local sol = nil
	local f = {}
	for i = 1, #str / 2 do
		local first = str:sub(i, i)
		table.insert(f, first)
	end
	for j = #str / 2 + 1, #str do
		local second = str:sub(j, j)
		for i = 1, #f do
			local first = str:sub(i, i)
			if first == second then
				sol = first
				break
			end
		end
		if sol ~= nil then
			table.insert(sols, sol)
			break
		end
	end
end
local score = 0
for i = 1, #sols do
	for j = 1, #alphabet do
		if sols[i] == alphabet[j] then
			score = score + i
		end
	end
end

print(score)
-- local answer1 = sumPrioritiesOfCommonItemsInCompartments()
-- printf("Part 1: %i\n", answer1)
--
-- local answer2 = sumPrioritiesOfCommonItemsInThreeBags()
-- printf("Part 2: %i\n", answer2)

return answer1, answer2, profile.finish()
