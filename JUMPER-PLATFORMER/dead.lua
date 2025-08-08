Dead = {}

----------------------------------------VARS----------------------------------------------------
-- ASCII Art (Stored as a string)
    AsciiArt = 
[[
        .,:loxxxxddc:,..            
        .;d0NWWWWMMMMMMWNX0kdc;'.        
     .c0WMMMMMMMMMMMMMMMMMWWN0Oxo:..     
    oNMMMMMMMMMMMMMMMMMMMMMMMWNX0ko;.    
  ;XMMMMMMMMMMMMMMMMMMMMMMMMMMMMWX0d;.   
 dMMMWXMMMMMMMMMMMMMMMMMMMMMWNWWWN0xc'.. 
LMMMMNxMMMMMMMMMMMMMMMMWMMMMW00Okddc:,'. .                    
.WMMMMW,MMMMMMMMMMMMMMMMMMMMMN0xdc::,,,:   .                   
0MMWWMWlMMMMMMMMMMMMMMWMMMWMMWN0xl;;';:;  
.MMMMMWKXMMMMMNNXNWMMWXNWMWWWMWNXKKOoodx;    .                  
'MMMWXklWW0o;.    'oxcO0KXXXxc.     .,lOd  
.MMWNx;0N.          . l.0l             .0c   
.MMNo.lMd            .0cWl              dx   
WNx, .Ml           ,lxlx               k:   
o0c. .Wc          :kc  ,  ..           X,   
o.  kMN,   .,:ldKXO   .  :'.....,,.  ck'.  
oo;,kMMMMO:xKXXKNWW        c ;'okxOkK0Nxlc'... 
'XMMMMMMMMkXd0oo0MK   c    x..,'d0NxWXkdc:,'.  
,MMMMMMN0;,,,;xNWN..0Wl.c'o ., .clc00ko:...   
 :kNWx,....,ccxXMW,WMWc,kX;..'   . ..:c''..   
    '.. .  .ONWXMWdWMWO.0N:o..        .       
     .X.d   :NNNWWKMKWk;xN'k..        .       
      0MM   .ol:,o:xxc0K': .        '.        
      oMM;   lOxlxxo0:KN'K l .     .'.        
      cMMK   ;                     ''. 
      oMMMo ;..                   .... 
      cWMMMxx.                    .... 
       .xWMNOo.,k, ..                   
         cMMW,ooco:K.lc.c               
         .MMMk;:cd,l,cc  .'.            
          lWMMNx';k.x.x.;'              
           .xMMMKOddO,c.,'              
             ,NMWWWXWXodl;'...          
              .kMMMWMMNNKxxo.           
                .,:oxxddl,.                                    
                                                          
]]


-- Retry button properties
Dead.button = {
    text = "Retry",
    x = 300,
    y = 500,
    width = 200,
    height = 50,
    action = function()
        gameState = "playing" -- Reset the game
    end
}

----------------------------------------LOAD----------------------------------------------------
function Dead:load()
    self.font = love.graphics.newFont(12) -- Set font size
end

---------------------------------------UPDATE----------------------------------------------------
function Dead:update(dt)
    -- Check if the mouse is hovering over the button
    local mx, my = love.mouse.getPosition()
    self.button.isHovered = mx > self.button.x and mx < self.button.x + self.button.width and
                            my > self.button.y and my < self.button.y + self.button.height
end


function Dead:mousepressed(x, y, button)
    if button == 1 then -- Left mouse button
        for _, btn in ipairs(self.buttons) do
            if btn.isHovered then
                btn.action() -- Trigger the button's action
            end
        end
    end
end
---------------------------------------DRAW----------------------------------------------------
function Dead:draw()
    -- Draw the ASCII art
    love.graphics.setFont(self.font)
    love.graphics.printf(AsciiArt, 0, 50, love.graphics.getWidth(), "center")

    -- Draw the Retry button
    if self.button.isHovered then
        love.graphics.setColor(0.7, 0.7, 0.7) -- Highlighted color
    else
        love.graphics.setColor(1, 1, 1) -- Normal color
    end
    love.graphics.rectangle("fill", self.button.x, self.button.y, self.button.width / 2.5, self.button.height)

    -- Draw button text
    love.graphics.setColor(0, 0, 0) -- Text color
    love.graphics.printf(self.button.text, self.button.x, self.button.y + 15, self.button.width / 2.5, "center")

    love.graphics.setColor(1, 1, 1) -- Reset color
end

return Dead
