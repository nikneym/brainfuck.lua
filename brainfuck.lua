-- + => 43
-- - => 45
-- [ => 91
-- ] => 93
-- > => 62
-- < => 60
-- . => 46
-- , => 44

local function cell_exists(cells, cell)
  if not cells[cell] then
    cells[cell] = 0
  end
end

return function(input)
  assert(type(input) == "string")

  local cells = { 0 }
  local cell = 1
  local i = 1
  local old_i

  while i <= #input do
    local b = input:byte(i)
  
    if b == 62 then
      cell = cell + 1
      cell_exists(cells, cell)
  
      goto continue
    end
  
    if b == 60 then
      cell = math.max(cell - 1, 1)
      cell_exists(cells, cell)
  
      goto continue
    end
  
    if b == 43 then
      cells[cell] = cells[cell] + 1
  
      goto continue
    end
  
    if b == 45 then
      cells[cell] = math.max(cells[cell] - 1, 0)
  
      goto continue
    end
  
    if b == 91 then
      old_i = i
  
      goto continue
    end
  
    if b == 93 then
      if cells[cell] ~= 0 then
        i = old_i
      end
  
      goto continue
    end
  
    if b == 46 then
      io.write(string.char(cells[cell]))
  
      goto continue
    end
  
    if b == 44 then
      cells[cell] = tonumber(string.byte(io.read()))
  
      goto continue
    end
  
    ::continue::
    i = i + 1
  end
end