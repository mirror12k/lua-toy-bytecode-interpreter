
local bytecode
bytecode = {
	function (reg, inst, a, b, next_index)
		reg[a] = b

		if next_index > #inst then return end
		local t = inst[next_index]
		return bytecode[t[1]](reg, inst, t[2], t[3], next_index + 1)
	end,
	function (reg, inst, a, b, next_index)
		reg[a] = reg[b]

		if next_index > #inst then return end
		local t = inst[next_index]
		return bytecode[t[1]](reg, inst, t[2], t[3], next_index + 1)
	end,
	function (reg, inst, a, b, next_index)
		reg[a] = reg[a] + reg[b]

		if next_index > #inst then return end
		local t = inst[next_index]
		return bytecode[t[1]](reg, inst, t[2], t[3], next_index + 1)
	end,
	function (reg, inst, a, b, next_index)
		reg[a] = reg[a] - reg[b]

		if next_index > #inst then return end
		local t = inst[next_index]
		return bytecode[t[1]](reg, inst, t[2], t[3], next_index + 1)
	end,
	function (reg, inst, a, b, next_index)
		reg[a] = reg[a] * reg[b]

		if next_index > #inst then return end
		local t = inst[next_index]
		return bytecode[t[1]](reg, inst, t[2], t[3], next_index + 1)
	end,
	function (reg, inst, a, b, next_index)
		reg[a] = reg[a] / reg[b]

		if next_index > #inst then return end
		local t = inst[next_index]
		return bytecode[t[1]](reg, inst, t[2], t[3], next_index + 1)
	end,
	function (reg, inst, a, b, next_index)
		print("[" .. tostring(a) .. "]: " .. tostring(reg[a]))

		if next_index > #inst then return end
		local t = inst[next_index]
		return bytecode[t[1]](reg, inst, t[2], t[3], next_index + 1)
	end,
}


local inst = {
	{1, 1, 5},
	{1, 2, 5},
	{3, 1, 2},
	{3, 1, 2},
	-- {7, 1},
}

function run_bytecode(inst)
	local reg = {0, 0, 0, 0}
	if 0 == #inst then return end
	return bytecode[inst[1][1]](reg, inst, inst[1][2], inst[1][3], 2)
end

-- function run_bytecode(inst)
-- 	local i = 1
-- 	local reg = {0, 0, 0, 0}
-- 	while i <= #inst do
-- 		local t = inst[i]
-- 		bytecode[t[1]](reg, t[2], t[3])
-- 		i = i + 1
-- 	end
-- end


-- run_bytecode(inst)

for i = 1, 10000000 do
	run_bytecode(inst)
end

print ("done")
