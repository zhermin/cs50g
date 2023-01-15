PauseState = Class {
    __includes = BaseState
}

local gameData = {}

function PauseState:update(dt)
    if love.keyboard.wasPressed('p') or love.mouse.wasPressed(1) then
        sounds['pause']:play()
        gStateMachine:change('countdown', gameData)
    end
end

function PauseState:render()
    love.graphics.setFont(hugeFont)
    love.graphics.printf('| |', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(gameData.score), 0, 150, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Click or press P to resume!', 0, 170, VIRTUAL_WIDTH, 'center')
end

function PauseState:enter(params)
    sounds['music']:pause()
    gameData = params
end

function PauseState:exit()
    sounds['music']:play()
end
