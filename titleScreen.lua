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
end


function TitleScreen:update(dt)
    
end


function TitleScreen:draw()
    love.graphics.draw(self.background, 0, 0)
    love.graphics.draw(self.stars, 0, 0)
    love.graphics.draw(self.title.image, self.title.x, self.title.y)
    love.graphics.draw(self.discoPlay.image, self.discoPlay.x, self.discoPlay.y)
end
