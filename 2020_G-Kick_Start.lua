T = tonumber(io.read())

getmetatable("").__index = function(str, j)
  return string.sub(str, j, j)
end

for ks = 1, T do
  S = io.read()
  local npairs = 0
  local count = 0
  local len = string.len(S)

  for i = 1, len do
    if i <= len - 3 then
      if (S[i] == "K" and S[i + 1] == "I" and S[i + 2] == "C" and S[i + 3] == "K") then
        count = count + 1
      end
    end

    if i <= len - 4 then
      if (S[i] == "S" and S[i + 1] == "T" and S[i + 2] == "A" and S[i + 3] == "R" and S[i + 4] == "T") then
        npairs = npairs + count
      end
    end
  end

  print("Case #" .. ks .. ": " .. npairs)
end
