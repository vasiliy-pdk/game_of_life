require_relative 'game'
require_relative 'world'
require_relative 'console_renderer'
require_relative 'console_input'
require_relative 'seeds'

Game.new(
  world: World.new(Seeds.random), 
  renderer: ConsoleRenderer.new, 
  input: ConsoleInput.new
).run()
