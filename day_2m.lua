-- Skipping day2 because I just don't like this problem;
local eio = require("libs.eio")
local profile = require("libs.profile")
local sequence = require("libs.sequence")

local input = eio.lines()
local printf = eio.printf
local match = string.match
local dual = sequence.dual
local score = {
	A = 1,
	B = 2,
	C = 3,
}

printf("Part 1: %i\n", totalScore)
printf("Part 2: %i\n", correctTotalScore)

return totalScore, correctTotalScore, profile.finish()
