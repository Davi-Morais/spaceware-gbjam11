require("titleScreen")
require("miniGameFoguete")

controller = {}

function controller:new()
    local controller = {}
    setmetatable(controller, self)
    self.__index = self

    self.miniGames = {}
    self.miniGames.foguete = miniGameFoguete:new()

    self.titleScreen = TitleScreen:new()
    self.current = self.titleScreen
    
    self.timer = 0

    return controller
end


function controller:update(dt)
    self.current:update(dt)
end


function controller:draw()
    self.current:draw()
end
 