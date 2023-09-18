require("controller")


function love.load()
    current = controller:new()
end


function love.update(dt)
    current:update(dt)
end


function love.draw()
    current:draw()
end

