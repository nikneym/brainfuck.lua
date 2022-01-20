local Brainfuck = require "brainfuck"

local file = io.open("hello_world.bf", 'r')
local content = file:read("*a")
file:close()

Brainfuck(content)