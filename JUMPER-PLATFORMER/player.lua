
Player = {}

----------------------------------------REQUIRES----------------------------------------------------



require("platform")

----------------------------------------------LOAD---------------------------------------

function Player:load()

	-- Player size
	self.width = 27.2
	self.height = 83.1

	--Player inisial Posision
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() - self.height

	-- Player speed
	self.speed = 500 --50

	--jumping mechanics
	self.gravity = 1000 --100
	self.jumpForce = -900 -- -110
	self.velocityY = 0
	self.isJumping = false

	self.isMovingLeft = false
	self.isMovingRight = false

	self.isDead = false
	self.hasJumped = false
	self.currentPlatform = nil -- Current platform reference

	-- Hitbox dimensions and offsets
	self.hitboxWidth = 20 -- Adjust as needed
	self.hitboxHeight = 50 -- Adjust as needed
	self.hitboxOffsetX = 4 -- Offset from the player's x position
	self.hitboxOffsetY = 20 -- Offset from the player's y position

	-- Art
	self.art = self.art or {}
	self.art.moving = self.art.moving or {}

	self.art.stand = [[
 O
/|\
/ \
]]

	self.art.jump = [[
\o/
 | 
/ \
]]

	self.art.moving.right = [[
 o
<|>
/ >]]

	self.art.moving.left = [[
 o
<|>
< \]]



end

--------------------------------------------------------------------------------------------

function Player:update(dt, platform)
	if self.isDead then --end the game when player dies
		gameState = "dead" -- Switch to the game
		return
	end
	self.isMovingLeft = false
	self.isMovingRight = false
	Player:movement(dt)
	Player:applyGravity(dt)
	Player:wrapAroundScreen()
	Player:alwaysJump(platform)

	-- Check if the player lands on a platform
	for _, p in ipairs(platform.list) do
		if self.y + self.height >= p.y and self.y + self.height <= p.y + 10 and
			self.x + self.width > p.x and self.x < p.x + p.width then
			self.currentPlatform = p -- Update the current platform
			break
		end
	end
end

function Player:getHitbox()
	return 
	{
		x = self.x - self.width / 3, -- Apply horizontal offset
		y = self.y - self.height / 3, -- Apply vertical offset
		width = self.width / 1.5, -- Use custom hitbox width
		height = self.height / 1.5      -- Use custom hitbox height
	}
end

function Player:movement(dt) --* Player movement
	local isMoving = false
	if love.keyboard.isDown("left") then
		self.x = self.x - self.speed * dt
		isMoving = true
		self.isMovingLeft = true
		self.isMovingRight = false
	elseif love.keyboard.isDown("right") then
		self.x = self.x + self.speed * dt
		isMoving = true
		self.isMovingLeft = false
		self.isMovingRight = true
	else
		self.isMovingLeft = false
		self.isMovingRight = false
	end
end

function Player:applyGravity(dt) -- Applies gravity to the player and updates the vertical position
	if self.isJumping then
		self.velocityY = self.velocityY + self.gravity * dt
		self.y = self.y + self.velocityY * dt * 1.2
	end
-- Checks if the player has landed on the ground
	if self.y + self.height >= love.graphics.getHeight() then
		if self.hasJumped then
			self.isDead = true -- only mark the player dead after the jumps once and touches the ground
		else
			self.y = love.graphics.getHeight() - self.height
			self.isJumping = false
			self.velocityY = 0
		end
	end
end

function Player:jump()-- Initiates the jump by setting the vertical velocity
	-- if not self.isJumping then
		self.isJumping = true
		self.velocityY = self.jumpForce
		self.hasJumped = true
	-- end
end

function Player:alwaysJump(platform)
		-- Ensures the player always jumps when on a platform
		if not self.isJumping then
			self:jump()
		else
			local hitbox = self:getHitbox() -- use the players hit box
			for _, platform in ipairs(platform.list) do
				if hitbox.y + hitbox.height >= platform.y and hitbox.y < platform.y and
					hitbox.x + hitbox.width > platform.x and hitbox.x < platform.x + platform.width then
					if self.velocityY > 0 then -- This condition Fix Jumping when directly inder a platform yhr Player only jumps when falling
						self:jump()
					end
					break -- Jump on the first platform found
				end
			end
		end
end






function Player:wrapAroundScreen() -- This Function Stops the player from going off the screen --* Will change it to a function that will make the player wrap around the screen
	-- Check if the player has moved off the left side of the screen
	if self.x + self.width < 0 then
		self.x = love.graphics.getWidth()
	-- Check if the player has moved off the right side of the screen
	elseif self.x > love.graphics.getWidth() then
		self.x = -self.width
	end
end
--------------------------------------------------------------------------------------------

function Player:draw()

	-- Draw player as a rectangle for now
	-- love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	-- Draw the ASCII art
	love.graphics.setColor(1, 1, 1) -- Set color to white (default)
	-- if self.isJumping then
		-- love.graphics.print(self.art.jump, self.x, self.y)
	if self.isMovingLeft then
		love.graphics.print(self.art.moving.left, self.x, self.y, nil, 1, nil, self.width/2, self.height/2)
	elseif self.isMovingRight then
		love.graphics.print(self.art.moving.right, self.x, self.y, nil, 1, nil, self.width/2, self.height/2)
	elseif self.isJumping then
        love.graphics.print(self.art.jump, self.x, self.y, nil, 1, nil, self.width/2, self.height/2)
	else
		love.graphics.print(self.art.stand, self.x, self.y, nil, 1, nil, self.width/2, self.height/2)
	end

end

return Player