local eio = require("libs.eio")
local profile = require("libs.profile")

local input = eio.lines()

profile.start()

local calories = {}
local elf = 0
for _, v in pairs(input) do
	if v ~= "" then
		elf = elf + v
	else
		table.insert(calories, elf)
		elf = 0
	end
end

table.sort(calories)

local answer1 = calories[#calories]
eio.printf("Part 1: %i\n", answer1)

local answer2 = calories[#calories] + calories[#calories - 1] + calories[#calories - 2]
eio.printf("Part 2: %i\n", answer2)

return answer1, answer2, profile.finish()

-- The performance difference between the two code samples can be attributed to several factors. Let's discuss some of the potential reasons:
--
-- 1. **Iteration Method**:
--    - The first snippet uses a `for` loop with an index to iterate over the `input` table, which is generally faster in Lua than using `pairs`, as in the second snippet. The `for` loop with a numeric index avoids the overhead of the `pairs` iterator function.
--
-- 2. **Handling Numbers**:
--    - The first code explicitly checks if the converted input is a number (`if n then`) before adding it to the sum. In contrast, the second code lacks this check, which may lead to attempting to add non-numeric values (`elf = elf + v`), relying on implicit type conversion or erroring out if `v` is not convertible to a number.
--
-- 3. **Table Insertion**:
--    - In the first code, a new element is added to the `calories` table using direct indexing (`calories[#calories + 1] = sum`). This method is typically more efficient than using `table.insert` as in the second snippet because it avoids the overhead of a function call.
--
-- 4. **String Concatenation vs. Function Call**:
--    - The first snippet calls `printf` directly with the formatted string, whereas the second snippet makes an additional call to `eio.printf`, which is likely just a wrapper around a similar `printf` function. Even though this is a minor difference, direct calls are typically more efficient than indirect ones through module tables.
--
-- 5. **Error Handling**:
--    - The second code snippet doesn't handle non-numeric input explicitly, which could cause runtime errors when attempting to perform arithmetic with non-numeric strings. Such error handling, if present, might incur additional overhead.
--
-- 6. **Empty String Check**:
--    - The second snippet checks for empty strings with `if v ~= "" then`, which could be slightly less efficient than the numeric check in the first snippet. However, this difference should be minimal unless the dataset is enormous or the check is particularly costly due to input types.
--
-- Considering these points, the first snippet is designed with more attention to Lua's faster operations, such as direct table indexing and numeric for loops. While these optimizations may offer only minor performance improvements individually, together they can result in a noticeably faster execution, especially with large datasets. Always remember that the actual performance will also depend on the implementation of the Lua interpreter or JIT compiler being used, and profiling in the target environment is the best way to understand performance characteristics.
