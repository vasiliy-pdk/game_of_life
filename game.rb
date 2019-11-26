class Game
  def initialize(world:, renderer:)
    @world = world
    @renderer = renderer
  end

  def run
    begin
      renderer.render world.simulate
      sleep 0.1
    end while should_proceed?
  end

  def should_proceed?
    result = ''
    $stdin.read_nonblock(1, result)
    return false unless result.empty?
  rescue
    true
  end

  private

  attr_reader :world, :renderer
end