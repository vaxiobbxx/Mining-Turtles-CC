--[===[

Mining Turtles CC
file: startup.lua

info:
init file

checks if async lib installed
if not installed, installs
if installed, loads using the async lib
]===]--

-- Clear screen and set curs pos
term.clear()
term.setCursorPos(1,1)

-- Error Func
function mtcc_err(err)
    print("[MTCC Error]> " .. err);
end

-- Info Func
function mtcc_info(err)
    print("[MTCC Info]> " .. err);
end
-- File Installation Func
function mtcc_download(fn)
    mtcc_info("Downloading '" .. fn .. "'...")
    local fdata = http.get("https://raw.githubusercontent.com/vaxiobbxx/Mining-Turtles-CC/master/" .. fn)
    local f = fs.open("mtcc_data/" .. fn, 'w')
    f.write(fdata.readAll())
    f.close()
    mtcc_info("Finished Downloading '" .. fn .. "'. Proceeding")
end

-- Init text
mtcc_info("Mining Turtle CC Init")
textutils.slowPrint("##################################")


if not fs.exists("mtcc_data") then
    mtcc_err("MTCC Data Folder Missing. Assuming this is a fresh install")
    mtcc_info("Beginning Install...")
    sleep(1)
    fs.makeDir("mtcc_data")
    mtcc_info("Created 'mtcc_data' folder")
    mtcc_info("Downloading Files...")
    sleep(1)
    mtcc_download("main.lua") 
    mtcc_info("Finished Installation, Rebooting in 5 seconds")
    sleep(5)
    os.reboot()
end

sleep(2)
shell.run("mtcc_data/main.lua")
