require_relative '../game'

describe Game do 
  it 'runs the game until receives stop input' do
    data_to_render = double('Some Data')
    world = double('World', simulate: data_to_render)
    renderer = double('Renderer', render: true)

    input_with_delayed_stop_command = InputWithDelayedStopCommand.new(stop_on_frame: 10)
    game = Game.new(world: world, renderer: renderer, input: input_with_delayed_stop_command)
    game.run()

    expect(renderer).to have_received(:render).exactly(10).times.with(data_to_render)
  end

  class InputWithDelayedStopCommand
    def initialize(stop_on_frame:)
      @frames_counter = 0
      @stop_on_frame = stop_on_frame
    end

    def stop_the_game?
      @frames_counter += 1
      @frames_counter == @stop_on_frame
    end
  end
end