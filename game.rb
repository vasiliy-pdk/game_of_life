class Game
  def initialize(input:, world:, renderer:)
    @world = world
    @renderer = renderer
    @input = input
  end

  def run
    begin
      renderer.render world.simulate
      sleep 0.1
    end while should_proceed?
  end

  def should_proceed? 
    !input.stop_the_game?
  end

  private

  attr_reader :input, :world, :renderer
end