--[[

Lock a door using a terminal password.
Blocks CTRL+T program termination.

To start on boot, edit your startup file to:
shell.run("password")

--]]

function clear()
	term.clear()
	term.setCursorPos(1,1)
end

function correct()
	clear()

	print("Password accepted.")
	redstone.setOutput("left", true)
	sleep(10)

	clear()
	redstone.setOutput("left", false)
	shell.run("password")
end

function wrong()
	clear()
	print("Password rejected. Please try again.")
	sleep(3)
	shell.run("password")
end

function main()
	repeat
	os.pullEvent = os.pullEventRaw
	local input = io.read()
	if input ~= "password" then wrong() end
	until input == "password"

	correct()
end

print("Password required:")
main()
