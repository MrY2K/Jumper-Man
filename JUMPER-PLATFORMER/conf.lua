function love.conf(t)
	print("Config loaded!")
	t.title = "JUMPER"
	t.version = "11.5"               -- The LÖVE version this game was made for
	t.window.title = "JUMPER"        -- The window title
	t.window.width = 520             -- To be changed to 900
	t.window.height = 1000            -- To be changed to 1600

	t.window.highdpi = true            -- Enable high-dpi mode for the window on a Retina display for apple sceens [Make it look good on apple's high dpi screens]
	t.window.usedpiscale = true         -- Enable automatic DPI scaling when highdpi is set to true as well (boolean)
	t.window.x = 1450 --were the window to pop up keep it nil to be center of the screen
	t.window.y = 100

end

	--Modules:
	-- t.modules.audio = true              -- Enable the audio module (boolean)
	-- t.modules.data = true               -- Enable the data module (boolean)
	-- t.modules.event = true              -- Enable the event module (boolean)
	-- t.modules.font = true               -- Enable the font module (boolean)
	-- t.modules.graphics = true           -- Enable the graphics module (boolean)
	-- t.modules.image = true              -- Enable the image module (boolean)
	-- t.modules.joystick = true           -- Enable the joystick module (boolean)
	-- t.modules.keyboard = true           -- Enable the keyboard module (boolean)
	-- t.modules.math = true               -- Enable the math module (boolean)
	-- t.modules.mouse = true              -- Enable the mouse module (boolean)
	-- t.modules.physics = true            -- Enable the physics module (boolean)
	-- t.modules.sound = true              -- Enable the sound module (boolean)
	-- t.modules.system = true             -- Enable the system module (boolean)
	-- t.modules.thread = true             -- Enable the thread module (boolean)
	-- t.modules.timer = true              -- Enable the timer module (boolean), Disabling it will result 0 delta time in love.update
	-- t.modules.touch = true              -- Enable the touch module (boolean)
	-- t.modules.video = true              -- Enable the video module (boolean)
	-- t.modules.window = true             -- Enable the window module (boolean)

