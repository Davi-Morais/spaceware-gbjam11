TitleScreen = {}

function TitleScreen:load()
    self.background = love.graphics.newImage("assets/title-screen/background.png")
    self.stars = love.graphics.newImage("assets/title-screen/stars.png")

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
end


function TitleScreen:update(dt)
    moverDisco(self.discoPlay, dt)
end

function moverDisco(disco, dt) 

    disco.y = disco.y + disco.speed * dt

    if disco.y > disco.yInicio + disco.image:getHeight() / 4 or disco.y < disco.yInicio - disco.image:getHeight() / 4 then 
        disco.speed = -disco.speed
    end

end


function TitleScreen:draw()
    love.graphics.draw(self.background, 0, 0)
    love.graphics.draw(self.stars, 0, 0)
    love.graphics.draw(self.title.image, self.title.x, self.title.y)
    love.graphics.draw(self.discoPlay.image, self.discoPlay.x, self.discoPlay.y)
end
