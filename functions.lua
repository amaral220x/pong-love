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
pontos_esq = 0
pontos_dir = 0
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
function quicar()
    if bola.y < TELA_ALT and TELA_ALT < bola.y + 2 * bola.rad then
        bola.mov_y = -1 * bola.mov_y
    end
    if bola.y < 0 and 0 < bola.y + 2 * bola.rad then
        bola.mov_y = -1 * bola.mov_y
    end
end
function contar_ponto()
    if bola.x < TELA_LARG and TELA_LARG < bola.x + 2 * bola.rad then
        pontos_esq = pontos_esq + 1
        dir = 1
        recomecar(dir)
    end
    if bola.x < 0 and 0 < bola.x + 2 * bola.rad then
        pontos_dir = pontos_dir + 1
        esq = - 1
        recomecar(esq)
    end
end
function recomecar(lado)
    bola = { 
        x = TELA_LARG/2 - 5,
        y = TELA_ALT/2 - 5,
        rad = 5,
        mov_x = lado,
        mov_y = 0,
    }
end