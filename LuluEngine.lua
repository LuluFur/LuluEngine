local LuluEngine = {}

-- Initialize object list
LuluEngine.objects = {}
LuluEngine.defaultColor = {1, 1, 1, 1} -- White with full opacity

-- Adds an object to the engine
function LuluEngine:addObject(obj)
    table.insert(self.objects, obj)
    if obj.init then obj:init() end -- Call object's init method if it exists
end

-- Removes an object from the engine
function LuluEngine:removeObject(obj)
    for i = #self.objects, 1, -1 do
        if self.objects[i] == obj then
            table.remove(self.objects, i)
            break
        end
    end
end

-- Clears all objects
function LuluEngine:clearObjects()
    self.objects = {}
end

-- Set the draw color
function LuluEngine:SetDrawColor(color)
    love.graphics.setColor(color[1], color[2], color[3], color[4] or 1)
end

-- Reset the draw color to default
function LuluEngine:ResetDrawColor()
    self:SetDrawColor(self.defaultColor)
end

-- Push the current transformation state
function LuluEngine:PushTransform()
    love.graphics.push()
end

-- Pop the last transformation state
function LuluEngine:PopTransform()
    love.graphics.pop()
end

-- Translate the drawing context
function LuluEngine:Translate(dx, dy)
    love.graphics.translate(dx, dy)
end

-- Rotate the drawing context
function LuluEngine:Rotate(angle)
    love.graphics.rotate(angle)
end

-- Scale the drawing context
function LuluEngine:Scale(sx, sy)
    love.graphics.scale(sx, sy or sx)
end

-- Runs once during initialization
function LuluEngine:Initialize()
    if love.initialize then love.initialize() end -- Call love.initialize() if it exists

    for _, obj in ipairs(self.objects) do
        if obj.init then obj:init() end
    end
end

-- Updates all objects
function LuluEngine:Update(dt)
    if love.update then love.update(dt) end -- Call love.update(dt) if it exists

    for _, obj in ipairs(self.objects) do
        if obj.update then obj:update(dt) end
    end
end

-- Renders all objects
function LuluEngine:Render()
    if love.render then love.render() end -- Call love.render() if it exists

    for _, obj in ipairs(self.objects) do
        if obj.draw then obj:draw() end
    end
end

return LuluEngine
