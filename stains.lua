local stains = {}

stains.elements = {}

function stains.update()
  for i = 1, #stains.elements do
    local element = stains.elements[i]

    if element and element.isRadiusExpands then
      element.radius = element.radius + 0.5

      if element.transparency > 70 then
        element.transparency = element.transparency - 0.3
      elseif element.transparency > 40 and element.transparency <= 70 then
        element.transparency = element.transparency - 0.6
      elseif element.transparency <= 40 and element.transparency > 0 then
        element.transparency = element.transparency - 2
      else
        element.transparency = 0
      end
    end

    if element and element.radius > 100 then
      element.isRadiusExpands = false
      table.remove(stains.elements, i)
    end
  end


end

function stains.draw()
  for i = 1, #stains.elements do
    local element = stains.elements[i]

    love.graphics.setColor(255, 255, 255, element.transparency)
    love.graphics.circle('line', element._x, element._y, element.radius)
  end
end

function stains.create_stain(x, y)
  local element = {
    _x = x,
    _y = y,
    radius = 1,
    isRadiusExpands = true,
    transparency = 100
  }

  table.insert(stains.elements, element)
end

function love.mousepressed(x, y, button)
  stains.create_stain(x, y)
end

return stains
