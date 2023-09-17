miniGameFoguete = {}

local clicks = 0

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

    self.venceu = nil

    return miniGameFoguete
end


function miniGameFoguete:update(dt)
    moverNuvens(self.nuvens, dt)
    buttonAnimation(self.botoes, dt)

    self:verificarMiniGame(dt)

end

function miniGameFoguete:verificarMiniGame(dt)
    self.temporizador = self.temporizador + dt

    if self.temporizador > 4 and clicks < 10 then
        self.venceu = false
    elseif self.temporizador <= 4 and clicks >= 10 then
        self.venceu = true
    end

end

function moverNuvens(nuvens, dt)
    nuvens.x = nuvens.x + nuvens.speed * dt
end


function buttonAnimation(botoes, dt)
    botoes.temporizador = botoes.temporizador + dt

    if botoes.temporizador >= botoes.intervalo then 
        if botoes.qual == 1 then
            botoes.qual = 2
        else
            botoes.qual = 1
        end

        botoes.temporizador = botoes.temporizador - botoes.intervalo

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

    if clicks < 5 then
        love.graphics.draw(self.foguete.image, self.foguete.x, self.foguete.y)
    elseif clicks < 9 then 
        love.graphics.draw(self.foguete.image, self.foguete.x, self.foguete.y)
        love.graphics.draw(self.fumaca1, 0, 0)
    else 
        love.graphics.draw(self.foguete.image, self.foguete.x, self.foguete.y - 182)
        love.graphics.draw(self.fumaca2, 0, 0)
    end

end

function love.keypressed(key)
    if 'x' == key then 
        clicks = clicks + 1
    end
end
