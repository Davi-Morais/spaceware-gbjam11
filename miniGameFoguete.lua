miniGameFoguete = {}


function miniGameFoguete:new() 
    local miniGameFoguete = {}
    setmetatable(miniGameFoguete, self)
    self.__index = self

    self.ceu = love.graphics.newImage("assets/miniGameFoguete/ceu.png")

    self.nuvens = {}
    self.nuvens.image = love.graphics.newImage("assets/miniGameFoguete/nuvens.png")
    self.nuvens.x = 0
    self.nuvens.y = 0
    self.nuvens.speed = 20

    self.cenario = love.graphics.newImage("assets/miniGameFoguete/cenario.png")


    return miniGameFoguete
end


function miniGameFoguete:update(dt)
    moverNuvens(self.nuvens, dt)

end

function moverNuvens(nuvens, dt)
    nuvens.x = nuvens.x + nuvens.speed * dt
end


function miniGameFoguete:draw()
    love.graphics.draw(self.ceu, 0, 0)

    love.graphics.draw(self.nuvens.image, self.nuvens.x, self.nuvens.y)

    love.graphics.draw(self.cenario, 0, 0)

end