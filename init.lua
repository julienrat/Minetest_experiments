
-- Minetest experiments to get weather from openweathermap

local http_api = minetest.request_http_api()

if not http_api then
   print("ERROR: in minetest.conf, this mod must be in secure.http_mods!")
end

minetest.after(5, function()
   http_api.fetch({
      url = "http://api.openweathermap.org/data/2.5/weather?q=poitiers&APPID=e6207dffde5b69ce571dcb5801e2076a",
      timeout = 50
   }, function (res)
      local text =  dump(res.data)
      local data2 = minetest.parse_json(text)
      data2 = minetest.parse_json(data2)
      print(data2.coord.lon)
      end)
end)
