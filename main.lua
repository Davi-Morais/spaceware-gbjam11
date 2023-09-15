require("titleScreen")

current = TitleScreen

function love.load()
    current:load()
end


function love.update(dt)
    current:update(dt)
end


function love.draw()
    current:draw()
end

