class Game
  def initialize(input:, world:, renderer:)
    @world = world
    @renderer = renderer
    @input = input
  end

  def run
    begin
      # @TODO: In order to enable more control over the game, we need to collect commands here, and find a way to
      # pass the input to the World.

      renderer.render world.simulate

      # @TODO: this sleep does not belong here. The Game object should be abstract enough to be useful in any game.
      # Currently it assumes the speed, but potentially it might be not suitable when
      # A) we want to run GoL or another game faster
      # B) world simulation could take longer therefore decreasing perceived speed.
      # Here are more details on game loops: https://gameprogrammingpatterns.com/game-loop.html
      sleep 0.1
    end while should_proceed?
  end

  def should_proceed?
    !input.include? :stop
  end

  private

  attr_reader :input, :world, :renderer
end
