# Run this file script through a terminal to visually verify the output. 

require_relative '../console_renderer'

grid_data = [
  [1,1,1,1],
  [1,1,1,0],
  [0,0,0,0],
  [0,0,0,1]
]

ConsoleRenderer.new.render grid_data
