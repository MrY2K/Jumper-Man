

Platform = {}

local platform_count = 6
local width = 50
local height = 8

function Platform:load()
	self.list = {}
	self:generatePlatform()
	self.width = width
	self.height = height

	self.x = love.graphics.getWidth() / 2
	self.y = 800 -- 1240
end


function Platform:generatePlatform()
    for i = 1, platform_count do
        local platform = {
            x = math.random(50, love.graphics.getWidth() - 50),
            y = love.graphics.getHeight() - i * 150, -- Staggered starting positions
            width = width,
            height = 8,
        }
        table.insert(self.list, platform)
    end
end



function Platform:update(cameraY)
	if #self.list == 0 then
        self:generatePlatform()
    end

    print("Camera Y:", cameraY, "Camera Bottom:", cameraY + love.graphics.getHeight())
    for i = #self.list, 1, -1 do
        print("Checking Platform Y:", self.list[i].y)
        if self.list[i].y > cameraY + love.graphics.getHeight() then
            print("Removing Platform Y:", self.list[i].y)
            table.remove(self.list, i)
        end
    end

    local highestPlatformY = self:getHighestPlatformY()
    print("Highest Platform Y:", highestPlatformY)
    while #self.list < platform_count do
        local newPlatform = {
            x = math.random(50, love.graphics.getWidth() - 50),
            y = highestPlatformY - math.random(150, 250),
            width = width,
            height = 5,
        }
        print("Adding Platform at Y:", newPlatform.y)
        table.insert(self.list, newPlatform)
        highestPlatformY = newPlatform.y
    end
end



-- Helper function to find the Y position of the highest platform
function Platform:getHighestPlatformY()
    local highestY = math.huge
    for _, platform in ipairs(self.list) do
        if platform.y < highestY then
            highestY = platform.y
        end
    end
    return highestY
end


-- function Platform:draw() --DRAW one platform
-- 	-- Draw a platform as a rectangle for now
-- 	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
-- end

function Platform:draw() --DRAW multiple platforms
	for _, Platform in ipairs(self.list) do
		love.graphics.rectangle("fill", Platform.x, Platform.y, Platform.width, Platform.height)
	end
end

function Platform:debug()
    for _, platform in ipairs(self.list) do
        love.graphics.setColor(0, 1, 0) -- Green for debugging
        love.graphics.rectangle("line", platform.x, platform.y, platform.width, platform.height)
    end
    love.graphics.setColor(1, 1, 1) -- Reset color
end
