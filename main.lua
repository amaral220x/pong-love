TELA_LARG = 480
TELA_ALT = 360
bola = { 
    x = TELA_LARG/2 - 5,
    y = TELA_ALT/2 - 5,
    rad = 5,
    mov_x = 1,
    mov_y = 0,
}
raquete_esq = { 
    x = 0, 
    y = 0, 
    alt = 70, 
    larg = 5,

}

raquete_dir = {
    x = TELA_LARG - 5, 
    y = 0,
    alt = 70, 
    larg = 5
}

function colidir()
    if bola.x < raquete_esq.x + raquete_esq.larg and raquete_esq.x < bola.x + 2 * bola.rad and bola.y < raquete_esq.y + raquete_esq.alt and raquete_esq.y < bola.y + 2 * bola.rad then
        bola.mov_x = -1.15 * bola.mov_x 
        bola.mov_y = math.random(-1,1)
    end
    if bola.x < raquete_dir.x + raquete_dir.larg and raquete_dir.x < bola.x + 2 * bola.rad and bola.y < raquete_dir.y + raquete_dir.alt and raquete_dir.y < bola.y + 2 * bola.rad then
        bola.mov_x = -1.15 * bola.mov_x 
        bola.mov_y = math.random(-1,1)
    end
end
function move_raquete()
    if love.keyboard.isDown('w') then
        if raquete_esq.y > 0 then
            raquete_esq.y = raquete_esq.y - 2
        end
    end
    if love.keyboard.isDown('s') then
        if raquete_esq.y + raquete_esq.alt < TELA_ALT then
            raquete_esq.y = raquete_esq.y + 2
        end
    end
    if love.keyboard.isDown('u') then
        if raquete_dir.y > 0 then
            raquete_dir.y = raquete_dir.y - 2
        end
    end
    if love.keyboard.isDown('j') then
        if raquete_dir.y + raquete_dir.alt < TELA_ALT then
            raquete_dir.y = raquete_dir.y + 2
        end
    end
end
function quicar(dt)
    if bola.y < TELA_ALT and TELA_ALT < bola.y + 2 * bola.rad then
        bola.mov_y = -1 * bola.mov_y
    end
    if bola.y < 0 and 0 < bola.y + 2 * bola.rad then
        bola.mov_y = -1 * bola.mov_y
    end
    
end
function love.load()
    love.window.setMode(TELA_LARG,TELA_ALT, {resizable = false})
    
end
function love.update(dt)
    bola.x = bola.x + bola.mov_x
    bola.y = bola.y + bola.mov_y
    quicar()
    if love.keyboard.isDown('w','s', 'j', 'u') then
        move_raquete()
    end   
    colidir()
end

function love.draw()
    love.graphics.circle("fill", bola.x,bola.y,bola.rad)
    love.graphics.rectangle("fill", raquete_esq.x, raquete_esq.y, raquete_esq.larg, raquete_esq.alt)
    love.graphics.rectangle("fill", raquete_dir.x, raquete_dir.y, raquete_dir.larg, raquete_dir.alt)
end