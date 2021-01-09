local ws, err = http.websocket("wss://echo.websocket.org")
if ws then
  ws.send("Working as expected")
  print(ws.receive())
  ws.close()
end