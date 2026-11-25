
function love.load()
    --parameters
    w = love.graphics.getWidth()
    h = love.graphics.getHeight()
    net_count = 21
    net_girth = 10 
    --ball
    ball = {}
    ball.size = 25
    ball.x = 200
    ball.y = 290
    ball.dx = 500
    ball.dy = 500   
    --paddle
    paddle = {}
    paddle.padding = ball.size
    paddle.thickness = ball.size
    paddle.length = 100
    paddle.x = paddle.padding
    paddle.y = 20  
    --contrapaddle
    contrapaddle = {}
    contrapaddle.padding = paddle.padding
    contrapaddle.thickness = paddle.thickness
    contrapaddle.length = 150
    contrapaddle.x = w - contrapaddle.padding - contrapaddle.thickness
    contrapaddle.y = paddle.y
end

function love.update(dt)
    local ball_nx = ball.x + ball.dx*dt
    local ball_ny = ball.y + ball.dy*dt
    if ball_nx < 0 or ball_nx + ball.size >= w then
        ball.dx = -ball.dx
    else 
        ball.x = ball_nx
    end
    if ball_ny < 0 or ball_ny + ball.size >= h then
        ball.dy = -ball.dy
    else 
        ball.y = ball_ny
    end
end

function love.draw()
    --background
    love.graphics.clear(0x30/255, 0x60/255, 0x30/255, 1)
    --ball
    love.graphics.rectangle("fill", ball.x, ball.y, ball.size, ball.size) 
    --paddle
    love.graphics.rectangle("fill", paddle.x, paddle.y, paddle.thickness, paddle.length)
    --contrapaddle
    love.graphics.rectangle("fill", contrapaddle.x, contrapaddle.y, contrapaddle.thickness, contrapaddle.length)
    --line
    local segment_length = h/net_count
    for i = 0, net_count-1 do
        if i % 2 == 0 then
            love.graphics.setLineWidth(net_girth)
            love.graphics.line(w/2, i*segment_length, w/2 - net_girth/2, (i + 1)*segment_length)
        end
    end
end