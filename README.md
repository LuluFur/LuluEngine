# LuluEngine### **LuluEngine.lua**

**Description**:  
LuluEngine is an abstraction layer for [LÖVE (Love2D)](https://love2d.org), designed to simplify game development and provide a structured framework for managing game objects, rendering, and common operations. Created by **Lulu (LuluFluffy)**, this lightweight engine offers tools for object lifecycle management, graphical utilities, and seamless integration with LÖVE's callbacks.

---

### **Features**:
- **Object Management**: Add, remove, and update game objects with minimal boilerplate.
- **Graphical Utilities**: Simplified access to common `love.graphics` functions, including transformations and color management.
- **Lifecycle Integration**: Unified initialization, update, and rendering pipelines for both global logic and individual objects.
- **Extensibility**: Easily add new features to the engine or extend existing ones.

---

### **Function Reference**

#### **Object Management**

- **`LuluEngine:addObject(obj)`**
  Adds an object to the engine's management. If the object defines an `init()` method, it will be automatically called.

  **Parameters**:
  - `obj` (table): The game object to add.

- **`LuluEngine:removeObject(obj)`**
  Removes a specific object from the engine.

  **Parameters**:
  - `obj` (table): The game object to remove.

- **`LuluEngine:clearObjects()`**
  Clears all objects managed by the engine.

- **`LuluEngine:findObjectsBy(key, value)`**
  Searches for objects with a specific key-value pair.

  **Parameters**:
  - `key` (string): The key to search for.
  - `value` (any): The value to match.

  **Returns**:
  - `results` (table): A list of matching objects.

---

#### **Lifecycle Management**

- **`LuluEngine:Initialize()`**
  Calls `love.initialize()` (if defined) and initializes all managed objects by invoking their `init()` method (if defined). Should be called in `love.load()`.

- **`LuluEngine:Update(dt)`**
  Calls `love.update(dt)` (if defined) and updates all managed objects by invoking their `update(dt)` method (if defined). Should be called in `love.update(dt)`.

  **Parameters**:
  - `dt` (number): The time delta since the last frame.

- **`LuluEngine:Render()`**
  Calls `love.render()` (if defined) and renders all managed objects by invoking their `draw()` method (if defined). Should be called in `love.draw()`.

---

#### **Graphical Utilities**

- **`LuluEngine:SetDrawColor(color)`**
  Sets the current draw color.

  **Parameters**:
  - `color` (table): A table containing RGBA values, e.g., `{1, 0, 0, 1}` for red.

- **`LuluEngine:ResetDrawColor()`**
  Resets the draw color to the default (white with full opacity).

- **`LuluEngine:PushTransform()`**
  Pushes the current transformation state onto the stack.

- **`LuluEngine:PopTransform()`**
  Pops the last transformation state from the stack.

- **`LuluEngine:Translate(dx, dy)`**
  Translates the drawing context by the specified offsets.

  **Parameters**:
  - `dx` (number): The x-axis offset.
  - `dy` (number): The y-axis offset.

- **`LuluEngine:Rotate(angle)`**
  Rotates the drawing context by the specified angle (in radians).

  **Parameters**:
  - `angle` (number): The rotation angle in radians.

- **`LuluEngine:Scale(sx, sy)`**
  Scales the drawing context.

  **Parameters**:
  - `sx` (number): The scaling factor along the x-axis.
  - `sy` (number): The scaling factor along the y-axis (optional, defaults to `sx`).

---

### **Usage Example**

```lua
local LuluEngine = require("LuluEngine")

-- Example GameObject class
local GameObject = {}
GameObject.__index = GameObject

function GameObject:new(x, y, color)
    return setmetatable({ x = x, y = y, color = color or {1, 1, 1}, size = 20 }, GameObject)
end

function GameObject:init()
    print("Initialized at:", self.x, self.y)
end

function GameObject:update(dt)
    self.x = self.x + 100 * dt
end

function GameObject:draw()
    LuluEngine:SetDrawColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, self.size, self.size)
    LuluEngine:ResetDrawColor()
end

-- Add objects to LuluEngine
LuluEngine:addObject(GameObject:new(100, 100, {1, 0, 0}))
LuluEngine:addObject(GameObject:new(200, 200, {0, 1, 0}))

-- LÖVE Callbacks
function love.initialize()
    print("Global Initialization")
end

function love.load()
    LuluEngine:Initialize()
end

function love.update(dt)
    LuluEngine:Update(dt)
end

function love.render()
    love.graphics.print("LuluEngine is running!", 10, 10)
end

function love.draw()
    LuluEngine:Render()
end
```

---

### **License**
This code is free to use, modify, and distribute under the [MIT License](https://opensource.org/licenses/MIT). Proper attribution to Lulu (LuluFluffy) is appreciated. 🐾

---

### **Version**
**LuluEngine v1.0**  
Date: **2025-01-19**

For questions or feedback, feel free to contact **LuluFluffy**!
