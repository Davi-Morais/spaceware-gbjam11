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

    self.botoes = {}
    self.botoes.botao1 = love.graphics.newImage("assets/miniGameFoguete/botao1.png")
    self.botoes.botao2 = love.graphics.newImage("assets/miniGameFoguete/botao2.png")
    self.botoes.qual = 2 --Qual botao vai ser desenhado
    self.botoes.intervalo = 0.3
    self.botoes.temporizador = 0

    self.foguete = {}
    self.foguete.image = love.graphics.newImage("assets/miniGameFoguete/foguete.png")
    self.foguete.x = 0
    self.foguete.y = 0

    self.fumaca1 = love.graphics.newImage("assets/miniGameFoguete/fumaca1.png")
    self.fumaca2 = love.graphics.newImage("assets/miniGameFoguete/fumaca2.png")

    self.temporizador = 0

    self.clicks = 0

    self.venceu = nil

    self.instance = miniGameFoguete

    return miniGameFoguete
end


function miniGameFoguete:update(dt)
    self:moverNuvens(dt)
    self:buttonAnimation(dt)

    if self.venceu == nil then
        self:verificarMiniGame(dt)
    end
end

function miniGameFoguete:verificarMiniGame(dt)
    self.temporizador = self.temporizador + dt

    if self.temporizador > 4 and self.clicks < 10 then
        self.venceu = false
    elseif self.temporizador <= 4 and self.clicks >= 10 then
        self.venceu = true
    end

end

function miniGameFoguete:moverNuvens(dt)
    self.nuvens.x = self.nuvens.x + self.nuvens.speed * dt
end


function miniGameFoguete:buttonAnimation(dt)
    self.botoes.temporizador = self.botoes.temporizador + dt

    if self.botoes.temporizador >= self.botoes.intervalo then 
        if self.botoes.qual == 1 then
            self.botoes.qual = 2
        else
            self.botoes.qual = 1
        end

        self.botoes.temporizador = self.botoes.temporizador - self.botoes.intervalo

    end
end




function miniGameFoguete:draw()
    love.graphics.draw(self.ceu, 0, 0)

    love.graphics.draw(self.nuvens.image, self.nuvens.x, self.nuvens.y)

    love.graphics.draw(self.cenario, 0, 0)

    if self.botoes.qual == 1 then
        love.graphics.draw(self.botoes.botao1, 0, 0)
    else
        love.graphics.draw(self.botoes.botao2, 0, 0)
    end

    if self.clicks < 5 then
        love.graphics.draw(self.foguete.image, self.foguete.x, self.foguete.y)
    elseif self.clicks < 9 then 
        love.graphics.draw(self.foguete.image, self.foguete.x, self.foguete.y)
        love.graphics.draw(self.fumaca1, 0, 0)
    else 
        love.graphics.draw(self.foguete.image, self.foguete.x, self.foguete.y - 182)
        love.graphics.draw(self.fumaca2, 0, 0)
    end

end


-- Lidar com os clicks do jogador:
function love.keypressed(key)
    if 'x' == key then 
        miniGameFoguete:PressA()
    end
end

function miniGameFoguete:PressA()
    
    if nil == self.instance.venceu then
        self.instance.clicks = self.instance.clicks + 1
        print(self.instance.clicks)
    end
end

