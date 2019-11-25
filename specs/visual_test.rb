# Run this file script through a terminal to visually verify the output. 
# Note: the related unit test is located in the renderer_spec.rb 

require_relative '../renderer'

grid_data = [
  [1,1,1,1],
  [1,1,1,0],
  [0,0,0,0],
  [0,0,0,1]
]

Renderer.new.render grid_data
