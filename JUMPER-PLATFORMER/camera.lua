require("player")



Camera = {}

function Camera:load()
    self.x = 0
    self.y = 0
	print("Camera initialized:", self.x, self.y) -- Camera is loeaded
    self.followHeight = love.graphics.getHeight() / 1-- Player threshold for camera to move up --!Edited this line to speed up game play 
	-- Set buffer zones for smoother scrolling
	self.topBuffer = love.graphics.getHeight() * 0.3
	self.bottomBuffer = love.graphics.getHeight() * 0.7
	self.sceneBottomBuffer = love.graphics.getHeight() * 0.9 -- Near bottom of the screen
    self.lerpSpeed = 2 -- Smooth camera movement speed
end

function Camera:update(player)
    local dt = love.timer.getDelta()


    if player.currentPlatform then
        local platformY = player.currentPlatform.y

        -- Calculate the target Y position for the camera
        local targetY = platformY - self.followHeight
        if player.y < platformY - self.followHeight then
            targetY = math.min(self.y, platformY - self.followHeight)
        elseif player.y > platformY + self.sceneBottomBuffer then
            targetY = math.max(self.y, platformY + self.sceneBottomBuffer)
        end

        -- Smoothly move the camera towards the target Y position
        self.y = self.y + (targetY - self.y) * self.lerpSpeed * dt
		-- For Debuggung
		--print("Camera Y:", self.y, "Target Y:", targetY)
	end
end



-- function Camera:update(player)
--     -- Follow the player upwards if they go above the followHeight
--     local dt = love.timer.getDelta()

--     -- Follow the player upwards if they go above the followHeight
--     if player.y < self.y + self.followHeight then
--         local diff = (self.y + self.followHeight - player.y)
--         self.y = math.max(self.y - diff * self.lerpSpeed * dt, 0)
--     end

--     -- Allow the camera to peek slightly downwards if the player is near the scene's bottom
--     if player.y + player.height > self.y + self.sceneBottomBuffer then
--         local diff = (player.y + player.height - (self.y + self.sceneBottomBuffer))
--         self.y = math.min(self.y + diff * self.lerpSpeed * dt, love.graphics.getHeight())
--     end
-- end



function Camera:apply()
    love.graphics.push()
    love.graphics.translate(0, -self.y)
end



function Camera:reset()
    love.graphics.pop()
end

function Camera:debug(player)
    if player.currentPlatform then
        love.graphics.setColor(1, 0, 0) -- Red for platform reference
        love.graphics.line(0, player.currentPlatform.y, love.graphics.getWidth(), player.currentPlatform.y)
    end

    love.graphics.setColor(0, 1, 0) -- Green for camera
    love.graphics.line(0, self.y, love.graphics.getWidth(), self.y)

    love.graphics.setColor(1, 1, 1) -- Reset color
end
