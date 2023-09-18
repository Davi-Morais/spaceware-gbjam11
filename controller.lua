require("miniGameFoguete")

controller = {}

function controller:new()
    local controller = {}
    setmetatable(controller, self)
    self.__index = self

    self.miniGames = {}
    self.miniGames.foguete = miniGameFoguete:new()

    self.timer = 0
    self.current = nil

    return controller
end


function controller:update(dt)
    if self.current then

        self.current:update(dt)

        if self.current.venceu == true or self.current.venceu == false then
            self.current:resetarMiniGame()
            self.current = nil
        end
        return
    end

    self.timer = self.timer + dt

    if self.timer >= 5 then
        print('5 segundos passaram!')
        self.current = self.miniGames.foguete
        self.timer = 0
    end
end


function controller:draw()
    if self.current then
        self.current:draw()
    end
end
 