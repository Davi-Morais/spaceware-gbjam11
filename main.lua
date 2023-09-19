require("controller")
require("titleScreen")


function love.load()
    titleScreen = TitleScreen:new()
    controller = controller:new()

    current = titleScreen
end


function love.update(dt)
    local status = current:update(dt)

    if status == 1 then
        if current == controller then
            current = titleScreen
        else
            current = controller
        end
    end
end


function love.draw()
    current:draw()
end

