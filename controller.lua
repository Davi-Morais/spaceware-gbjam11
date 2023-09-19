require("titleScreen")
require("miniGameFoguete")

controller = {}

function controller:new()
    local controller = {}
    setmetatable(controller, self)
    self.__index = self

    self.miniGames = {}
    self.miniGames.foguete = miniGameFoguete:new()

    self.current = self:proximoMiniGame()

    self.pontos = 0
    self.meta = 10
    self.erros = 5

    return controller
end


function controller:update(dt)
    local result = self.current:update(dt)
    
    if result == true then
        self.pontos = self.pontos + 1
        self.current:resetar()
        self.current = self:proximoMiniGame()
    elseif result == false then
        self.erros = self.erros - 1
        self.current:resetar()
        self.current = self:proximoMiniGame()
    end
    
    if self.pontos >= self.meta then
        print("Parabens!! Voce ganhou!")
        self.current:resetar()
        self:resetar()
        return 1
    elseif self.erros <= 0 then
        print("Infelizmente voce perdeu...")
        self.current:resetar()
        self:resetar()
        return 1
    end
end


function controller:draw()
    self.current:draw()
end


function controller:proximoMiniGame()
    --Logica de devolver minigames aleatorios vai acontecer aqui
    return self.miniGames.foguete
end
 

function controller:resetar()
    self.pontos = 0
    self.erros = 5
    self.current = self:proximoMiniGame()
end