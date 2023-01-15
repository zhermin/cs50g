--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]] ScoreState = Class {
    __includes = BaseState
}

-- ribbons
local bronze = love.graphics.newImage('assets/sprites/bronze-ribbon.png')
local silver = love.graphics.newImage('assets/sprites/silver-ribbon.png')
local gold = love.graphics.newImage('assets/sprites/gold-ribbon.png')
local ribbon_width = bronze:getWidth()

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') or
        love.mouse.wasPressed(1) then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    if self.score >= 6 then
        love.graphics.draw(gold, VIRTUAL_WIDTH / 2 - ribbon_width / 4, 120, 0, 0.5, 0.5)
        love.graphics.printf('Amazing! That was a great run!', 0, 64, VIRTUAL_WIDTH,
            'center')
    elseif self.score >= 4 then
        love.graphics.draw(silver, VIRTUAL_WIDTH / 2 - ribbon_width / 4, 120, 0, 0.5,
            0.5)
        love.graphics.printf('Well done! Keep it up!', 0, 64, VIRTUAL_WIDTH, 'center')
    elseif self.score >= 2 then
        love.graphics.draw(bronze, VIRTUAL_WIDTH / 2 - ribbon_width / 4, 120, 0, 0.5,
            0.5)
        love.graphics.printf('Good job! Keep practising!', 0, 64, VIRTUAL_WIDTH,
            'center')
    else
        love.graphics.printf('Practice makes perfect!', 0, 64, VIRTUAL_WIDTH, 'center')
    end

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH,
        'center')

    love.graphics.printf('Click or press Enter to Play Again!', 0, 180, VIRTUAL_WIDTH,
        'center')
end
