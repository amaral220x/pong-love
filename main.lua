TELA_LARG = 480
TELA_ALT = 360
bola = { 
    x = 10,
    y = 10,
    rad = 5,
    mov_x = 1,
    mov_y = 1,
}
raquete = { 
    x = 0, 
    y = 0, 
    alt = 40, 
    larg = 5,

}

function colidir()
    if bola.x < raquete.x + raquete.larg and raquete.x < bola.x + 2 * bola.rad and bola.y < raquete.y + raquete.alt and raquete.y < bola.y + 2 * bola.rad then
        bola.mov_x = -bola.mov_x
        bola.mov_y = math.random(-1,1)
    end
end
function move_raquete()
    if love.keyboard.isDown('w') then
        if raquete.y > 0 then
            raquete.y = raquete.y - 1
        end
    end
    if love.keyboard.isDown('s') then
        if raquete.y + raquete.alt < TELA_ALT then
            raquete.y = raquete.y + 1
        end
    end
end
function quicar()
    if bola.x + 2 * bola.rad == TELA_LARG then
        bola.mov_x = -bola.mov_x
    end
    if bola.y + 2 * bola.rad == TELA_ALT or bola.y == 0 then
        bola.mov_y = -bola.mov_y
    end
    
end
function love.load()
    love.window.setMode(TELA_LARG,TELA_ALT, {resizable = false})
    
end
function love.update(dt)
    bola.x = bola.x + bola.mov_x
    bola.y = bola.y + bola.mov_y
    quicar()
    if love.keyboard.isDown('w','s') then
        move_raquete()
    end   
    colidir()
end

function love.draw()
    love.graphics.circle("fill", bola.x,bola.y,bola.rad)
    love.graphics.rectangle("fill", raquete.x, raquete.y, raquete.larg, raquete.alt)
end