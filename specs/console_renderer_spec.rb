require_relative '../lib/console_renderer'

describe ConsoleRenderer do
  describe '#render' do
    it 'displays the world on the scene' do
      grid_data = [
        [1,1,1,1],
        [1,1,1,0],
        [0,0,0,0],
        [0,0,0,1]
      ]
      text = <<-TEXT
\e[H\e[2J
####
### 
    
   #
      TEXT

      output = StringIO.new
      renderer = ConsoleRenderer.new(output)
      
      renderer.render(grid_data)

      expect(output.string.inspect).to eq(text.inspect)
    end
  end
end