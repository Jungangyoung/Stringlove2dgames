function love.load()
    --load platform
    platform = {}
    platform.width = love.graphics.getWidth()    
	platform.height = love.graphics.getHeight()  
    platform.x = 0                               
	platform.y = platform.height / 3 * 2 
    --load player
    player = {}
    player.width = 50
    player.height = player.width
    player.x = love.graphics.getWidth() / 2 - player.width  
	player.y = platform.y - player.height
    player.speed = 300 
    player.ground = player.y     
	player.y_velocity = 0        
	player.jump_height = -400    
	player.gravity = -500      
end

function love.update(dt)
	--player move
    if love.keyboard.isDown('right') then 
        if player.x < (love.graphics.getWidth() - player.width) then                  
		    player.x = player.x + (player.speed * dt)   
        end 
	elseif love.keyboard.isDown('left') then  
        if player.x > 0 then              
		    player.x = player.x - (player.speed * dt) 
        end
    end  
	--player jump
    if love.keyboard.isDown('up') then                               
		if player.y_velocity == 0 then
			player.y_velocity = player.jump_height  
		end
	end 
    if player.y_velocity ~= 0 then                       
		player.y = player.y + player.y_velocity * dt               
		player.y_velocity = player.y_velocity - player.gravity * dt 
	end
    if player.y >= player.ground then    
		player.y_velocity = 0       
		player.y = player.ground 
    end   
end

function love.draw()
    --draw platform
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle('fill', platform.x, platform.y, platform.width, platform.height)
    --draw player
    love.graphics.setColor(0.5, 1, 0)
    love.graphics.rectangle('fill', player.x, player.y, player.width, player.height)
end
