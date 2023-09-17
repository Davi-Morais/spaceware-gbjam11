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

    return miniGameFoguete
end


function miniGameFoguete:update(dt)
    moverNuvens(self.nuvens, dt)
    buttonAnimation(self.botoes, dt)
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

end