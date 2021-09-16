require("functions")

TELA_LARG = 480
TELA_ALT = 360

function love.load()
    love.window.setMode(TELA_LARG,TELA_ALT, {resizable = false})
    state = "menu"
    
end

function love.update(dt)
    if state  == "menu" then
        if love.keyboard.isDown('space') then
            state = "game"
        end
    end
    if state == "game" then
        bola.x = bola.x + bola.mov_x
        bola.y = bola.y + bola.mov_y
        quicar()
        if love.keyboard.isDown('w','s', 'j', 'u') then
            move_raquete()
        end
        colidir()
        contar_ponto()
    end
end

function love.draw()
    if state == "menu" then
        s = "Aperte enter para espaço no jogo"
        love.graphics.print(s,TELA_LARG/2 - 100, TELA_ALT / 2)
    end
    if state == "game" then
        love.graphics.print("Lado esquerdo = " .. tostring(pontos_esq), 10, TELA_ALT / 2)
        love.graphics.print("Lado direito = ".. tostring(pontos_dir), TELA_LARG -110, TELA_ALT / 2)
        love.graphics.circle("fill", bola.x,bola.y,bola.rad)
        love.graphics.rectangle("fill", raquete_esq.x, raquete_esq.y, raquete_esq.larg, raquete_esq.alt)
        love.graphics.rectangle("fill", raquete_dir.x, raquete_dir.y, raquete_dir.larg, raquete_dir.alt)
    end
    
end