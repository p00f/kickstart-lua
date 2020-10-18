T = tonumber(io.read())

-- function to split a string space-separated numbers into a table
function mysplit(sep, inputstr)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, tonumber(str))
  end
  return t
end

for ks = 1, T do
  NMQ = mysplit(" ", io.read())
  N = NMQ[1]
  M = NMQ[2]
  Q = NMQ[3]
  local TornArray = mysplit(" ", io.read())
  local RArray = mysplit(" ", io.read())
  local f = {}
  local tornRecord = {}

  -- tear pages
  for c = 1, M do
    tornRecord[TornArray[c]] = "torn"
  end

  -- Calculate f(x) = no. of pages which are multiples of x and not torn
  for i = 1, N do
    local x = 0
    for j = 1, math.floor(N / i) do
      if tornRecord[i * j] ~= "torn" then
        x = x + 1
      end
    end
    f[i] = x
  end

  -- Find sum of pages read by each reader
  local sum = 0
  for z = 1, Q do
    sum = sum + f[RArray[z]]
  end

  -- Print answer
  print("Case #" .. ks .. ": " .. sum)
end
