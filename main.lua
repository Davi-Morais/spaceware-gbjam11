require("titleScreen")


function love.load()
    current = TitleScreen:new()
end


function love.update(dt)
    current:update(dt)
end


function love.draw()
    current:draw()
end

