controller = {}

function controller:new()
    local controller = {}
    setmetatable(controller, self)
    self.__index = self

    return controller
end


function controller:update(dt)
    
end


function controller:draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", 100, 100, 15, 5)
end
 