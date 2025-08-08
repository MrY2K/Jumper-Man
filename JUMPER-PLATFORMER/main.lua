--[[
▓█████▄ ▓█████ ██▒   █▓    ██▓     ▒█████   ▄████  ██████ 
▒██▀ ██▌▓█   ▀▓██░   █▒   ▓██▒    ▒██▒  ██▒██▒ ▀█▒██    ▒ 
░██   █▌▒███   ▓██  █▒░   ▒██░    ▒██░  ██▒██░▄▄▄░ ▓██▄   
░▓█▄   ▌▒▓█  ▄  ▒██ █░░   ▒██░    ▒██   ██░▓█  ██▓ ▒   ██▒
░▒████▓ ░▒████▒  ▒▀█░     ░██████▒░ ████▓▒░▒▓███▀▒██████▒▒
 ▒▒▓  ▒ ░░ ▒░ ░  ░ ▐░     ░ ▒░▓  ░░ ▒░▒░▒░ ░▒   ▒▒ ▒▓▒ ▒ ░
 ░ ▒  ▒  ░ ░  ░  ░ ░░     ░ ░ ▒  ░  ░ ▒ ▒░  ░   ░░ ░▒  ░ ░
 ░ ░  ░    ░       ░░       ░ ░   ░ ░ ░ ▒ ░ ░   ░░  ░  ░  
   ░       ░  ░     ░         ░  ░    ░ ░       ░      ░  
 ░                 ░                                      

▗▄▄▄  ▗▄▖▗▖  ▗▖    ▗▄▄▄▖
▐▌  █▐▌ ▐▌▝▚▞▘       █  
▐▌  █▐▛▀▜▌ ▐▌        █  
▐▙▄▄▀▐▌ ▐▌ ▐▌      ▗▄█▄▖

timespent:
	6 hours + made the pingpong game (in like 3h)
debugging:
	made a debugging function its very helpful for detecting the posison of the player and the platforms
gameplay:
	also made the player, constant jumping, wraping around the screen and moving mechanics
	made the first platform and the jumping over mechanics
	reselusion scalling for the player and the platforms


▗▄▄▄  ▗▄▖▗▖  ▗▖    ▗▄▄▄▖▗▄▄▄▖
▐▌  █▐▌ ▐▌▝▚▞▘       █    █  
▐▌  █▐▛▀▜▌ ▐▌        █    █  
▐▙▄▄▀▐▌ ▐▌ ▐▌      ▗▄█▄▖▗▄█▄▖

timespent:
	2.5 hours
art:
	added a primary art fot the player
gameplay/mechanics:
	added hit boxes for the player and platform
debugging:
	added the draw hitboxs function for debugging
	added the debug variable to enable debugging


▗▄▄▄  ▗▄▖▗▖  ▗▖    ▗▄▄▄▖▗▄▄▄▖▗▄▄▄▖
▐▌  █▐▌ ▐▌▝▚▞▘       █    █    █ 
▐▌  █▐▛▀▜▌ ▐▌        █    █    █ 
▐▙▄▄▀▐▌ ▐▌ ▐▌      ▗▄█▄▖▗▄█▄▖▗▄█▄▖

30 min before the club meeting
	made a table of random platforms -- needs a lot of tweaking
	implemented the camera and the camera following the player -- needs a lot of work
	reduce the jump force 
	also the player when it goes out of the screen from the top it returns from the bottom (need to fix the wraparound function)

tdo: today:
	Generate more platforms and delete old ones  DONE
	Fix coalition TO DO + Fix the player going straght trouw the platforms
	Add end game screen + fix the reset botton when a player is hight in the screen presssing r does not restart the gam eproperly
	Add start game screen 
	Add some sound effects And Music

	IMPORT TO Unity


	MULTIPLAYER MODE IDIA: 
	max 4 players race to get the hiest score in a specefice time limit
	fast paste extremly competitive and fun 
		when you fall you have a delai of time to get back up (the animation for this is your skilaton will throw a chain to the closest tile and start climing )
	we can also expirement with the idea of falling off the map means dead and  players can push each other players can jump on each other


* the game play is playable but the camera needs work
! need to reminder the player to use the sides
* need to fix the colliation problem: try to make hitbox smaller 
* make the jump smouther (editing line 174 player.lua (0.9))
! add a daeth screen and a restart bottun
! add a new type of platform: spikes then disaparing

game play:
	todo	fix the collsion and game object aka player should be the player not hitbox and well use the player from now on on collision and so on
				FIXED the player and the hitbox are both offseted
	todo	Make the main game loop :
			[x] random generation for platforms (true random)
			[x] infinite platform generation
			todo [ ] add if you touch the floor you die falling of the map mechanics (and the camera stops) mechanics

	todo [+] Make the platforms multiple
	todo [+] Make the platforms generate randomly
	todo [+] move the camera with jumping
	todo [x] fix the prob with jumping when your under the platform directly 
		make costum maps for debuging : droj
	todo [ ] Make the jumping smooth (by naking curved rathar than linear)
	n

keep in ind when porting to mobile that the moving is not stagnit as in the same speed if tilted more the speed increeses
for the future:

Idiea and Story:
	consept art for the main enemy and the player
		ASCII art for the player - []made a basic shape
		ASCII art for the main enemy
		ASCII art for the platforms
		ASCII art for the background
		ASCII art for the score
		ASCII art for the high score
		
	enemy Animation Hades Eaacting the world under you

Gameplay:
	add vraity of platforms:	hidden, fake, long-jump, moving platforms
	make enemys: spikes, moving enemys, flying-attacks-from hades

Art:
	Make the Player Art (ASCII Skileton)
	Make the Platform Art (ASCII Platform)
	Make the Enemy Art (ASCII Background)
	Make the Background Art (ASCII Background)
	Make a Color Scheme
		Make the Color scheme adjust with the time of the day
		Make the Color scheme adjust with the player's score

Menues:
	add a start menue with a start button
	add a GAME OVER screen with a restart button
	add a score system
	add a high score system
		add a new high record line

--]]


-- main.lua
----------------------------------------GLOBAL VARS----------------------------------------------------

DEBUGING = false

----------------------------------------REQUIRES----------------------------------------------------

require("player")
require("camera")
Menu = require("menu")
Deadscreen = require("dead")
if DEBUGING then -- toggle debugging mode -- IMPROV: Use a config file or table to store multiple debug settings for modularity.
	require("platform")
else
	require("platform")
end

----------------------------------------VARS----------------------------------------------------

local highestY = love.graphics.getHeight() -- Start with the menu screen

--Game State
gameState = "menu" -- Possible states: "playing", "dead"


--SCORE
local score = 0
local highScore = 0 -- Optional: Track the highest score

--FONTS
local font = love.graphics.getFont() --main font
-- local font = love.graphics.newFont("assets/fonts/FSEX300.ttf", 12)
-- local font = love.graphics.newFont("assets/fonts/ProFont.ttf", 12)
local player_font = love.graphics.newFont("assets/fonts/PixelOperator.ttf", 30)
love.graphics.setFont(font) -- Set the created font as the current font


----------------------------------------LOAD----------------------------------------------------

function love.load()
	Time = 0
	Menu:load()
	Camera:load()
	Player:load()
	Platform:load()
	-- Dead:load()
end

----------------------------------------UPDATE----------------------------------------------------

function love.update(dt)
	Time = Time + dt
	if gameState == "menu" then
		Menu:update(dt)
	end
	if gameState == "dead" then
		Menu:update(dt)
	end
	if gameState == "playing" then
		Player:update(dt, Platform)
		Platform:update(Camera.y)
		Camera:update(Player)
	end

	function love.mousepressed(x, y, button)
		if gameState == "menu" then
			Menu:mousepressed(x, y, button)
		elseif gameState == "dead" then
			Menu:mousepressed(x, y, button)
		end
	end

	-- Update Score based on the player's progress
	if Player.y < highestY then
		highestY = Player.y -- Update the highest position reached
		score = math.floor((love.graphics.getHeight() - highestY) / 10) -- Scale score calculation
		if score > highScore then
			highScore = score -- Update the high score
		end
	end
end

function love.keypressed(key) -- Press 'R' to restart the game --todo=Needs Fixing
	if key == "r" then 
		Player:load()
		Platform:load()
		Camera:load()
		score = 0
		highestY = love.graphics.getHeight() -- Reset to starting position
	end
end

----------------------------------------DRAW----------------------------------------------------

function love.draw()
	if gameState == "menu" then
		Menu:draw();
	elseif gameState == "dead" then
		Menu:draw()
	elseif gameState == "playing" then
		Camera:apply() -- Start camera transformation

		if DEBUGING then
			DEBUGING_LINES()
			Camera:debug(Player)
			Platform:debug()
			Platform:debug()
			Player:DEBUG_drawHitbox()
		end

		-- Draw player NOTE:alwase draw the player first
		love.graphics.setFont(player_font)
		Player:draw()
		love.graphics.setFont(font)
		Platform:draw()

		-- Calculate radiant color based on time
		local r = math.sin(Time * 0.1) * 0.5 + 0.5
		local g = math.sin(Time * 0.1 + math.pi / 2) * 0.5 + 0.5
		local b = math.sin(Time * 0.1 + math.pi) * 0.5 + 0.5

		love.graphics.setBackgroundColor(r, g, b)

		Camera:reset() -- Reset transformation for UI and other elements


		-- Draw score
		love.graphics.setColor(1, 1, 1) -- White color for text
		love.graphics.print("Score: " .. formatScore(score, 5), 10, 10)

		-- Optional: Draw high score
		love.graphics.print("High Score: " .. formatScore(highScore, 5), 10, 30)
	end
end

function Player:DEBUG_drawHitbox()
	local hitbox = self:getHitbox()
	-- Set color for the hitbox outline (red for visibility)
	love.graphics.setColor(1, 0, 0) -- RGB for red
	love.graphics.rectangle("line", hitbox.x, hitbox.y, hitbox.width, hitbox.height)
	-- Reset color to default for other drawings
	love.graphics.setColor(1, 1, 1)
end

function Platform:debug()
    for _, platform in ipairs(self.list) do
        love.graphics.setColor(0, 1, 0) -- Green for platform hitbox
        love.graphics.rectangle("line", platform.x, platform.y, platform.width, platform.height)
    end
    love.graphics.setColor(1, 1, 1) -- Reset to white
end

-- DEBUGING LINES
function DEBUGING_LINES()
--~~~~~~~~~~~~~~~~~~~~~~--~~~~~~~~~~~~~~~~~~~~~~PRINT THE CORDNTES~~~~~~~~~~~~~~~~~~~~~~--~~~~~~~~~~~~~~~~~~~~~~
	local _txt_spot = 8;
	local _txt_spot2 = 20;

	function update_text_pos()
		_txt_spot = _txt_spot + 32
		_txt_spot2 = _txt_spot2 + 32
	end
    -- Print the mouse coordinates
    love.graphics.print('Mouse X: ' .. love.mouse.getX(), 8, _txt_spot)
    love.graphics.print('Mouse Y: ' .. love.mouse.getY(), 8, _txt_spot2)
	update_text_pos()
    -- Print the player rectangle coordinates
    love.graphics.print('Player X: ' .. string.format("%.2f", Player.x), 8, _txt_spot)
    love.graphics.print('Player Y: ' .. string.format("%.2f", Player.y), 8, _txt_spot2)
	update_text_pos()
	-- World coordinates
	love.graphics.print('World Player X: ' .. string.format("%.2f", Player.x), 8, _txt_spot)
	love.graphics.print('World Player Y: ' .. string.format("%.2f", Player.y), 8, _txt_spot2)
--~~~~~~~~~~~~~~~~~~~~~~--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--~~~~~~~~~~~~~~~~~~~~~~
	local canvasWidth = love.graphics.getWidth()
	local canvasHeight = love.graphics.getHeight()
	-- Set a color for the axes (red for X-axis, blue for Y-axis)
	love.graphics.setColor(1, 0, 0) -- Red color for the X-axis
	love.graphics.line(0, 0, canvasWidth, 0) -- X-axis (horizontal, starts at top-left corner)
	love.graphics.setColor(0, 0, 1) -- Blue color for the Y-axis
	love.graphics.line(0, 0, 0, canvasHeight) -- Y-axis (vertical, starts at top-left corner)
	-- Draw tick marks on the X-axis (every 50 pixels)
	love.graphics.setColor(1, 1, 0) -- Yellow color for tick marks
	for x = 0, canvasWidth, 50 do
		love.graphics.line(x, -5, x, 5) -- Tick marks for X-axis
	end
	-- Draw tick marks on the Y-axis (every 50 pixels)
	for y = 0, canvasHeight, 50 do
		love.graphics.line(-5, y, 5, y) -- Tick marks for Y-axis
	end
	-- love.graphics.setColor(0.33, 0.87, 0) -- Green color for the Middle Line
	-- love.graphics.line(0, canvasHeight / 2, canvasWidth, canvasHeight / 2)
	-- love.graphics.setColor(1, 1, 1)	-- Reset color to white for further drawing
end


function formatScore(score, width)
    local str = tostring(score)
    while #str < width do
        str = "0" .. str
    end
    return str
end