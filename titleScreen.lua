require("controller")

TitleScreen = {}

function TitleScreen:new()

    local titleScreen = {}
    setmetatable(titleScreen, self)
    self.__index = self

    self.background = love.graphics.newImage("assets/title-screen/background.png")
    
    self.stars = {}
    self.stars.image = love.graphics.newImage("assets/title-screen/stars.png")
    self.stars.speed = 5
    self.stars.x = 0
    self.stars.y = 0
    

    self.title = {}
    self.title.image = love.graphics.newImage("assets/title-screen/title.png")
    self.title.x = love.graphics.getWidth() / 2 - self.title.image:getWidth() / 2
    self.title.y = love.graphics.getHeight() / 4 - self.title.image:getHeight() / 2

    self.discoPlay = {}
    self.discoPlay.image = love.graphics.newImage("assets/title-screen/disco-play.png")
    self.discoPlay.x = love.graphics.getWidth() / 2 - self.discoPlay.image:getWidth() / 2
    self.discoPlay.y = love.graphics.getHeight() / 2 + self.discoPlay.image:getHeight() / 2
    self.discoPlay.yInicio = self.discoPlay.y
    self.discoPlay.speed = 50

    return titleScreen
end


function TitleScreen:update(dt)
    moverDisco(self.discoPlay, dt)
    moverStars(self.stars, dt)
end

function moverDisco(disco, dt) 

    disco.y = disco.y + disco.speed * dt

    if disco.y > disco.yInicio + disco.image:getHeight() / 4 or disco.y < disco.yInicio - disco.image:getHeight() / 4 then 
        disco.speed = -disco.speed
    end

end

function moverStars(stars, dt) 

    stars.x = stars.x + stars.speed * dt

    if stars.x - 20 > 0 or stars.x + 20 < 0 then 
        stars.speed = -stars.speed
    end

end


function TitleScreen:draw()
    love.graphics.draw(self.background, 0, 0)
    love.graphics.draw(self.stars.image, self.stars.x, self.stars.y)
    love.graphics.draw(self.title.image, self.title.x, self.title.y)
    love.graphics.draw(self.discoPlay.image, self.discoPlay.x, self.discoPlay.y)
end


function love.keypressed( key, scancode, isrepeat )
    if key =='x' or key == 'z' or key == 'return' or key == 'v' then
        current = controller:new()
    end
end