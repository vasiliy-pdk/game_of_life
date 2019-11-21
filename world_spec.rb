require_relative 'world'

describe 'World' do
  describe '#simulate' do
    context 'with 4 dead cells' do
      it 'resurects no cells' do
        world = World.new [
          [0, 0],
          [0, 0]
        ]
        expect(world.simulate).to eq([
          [0, 0],
          [0, 0]
        ])
      end
    end

    context 'with just one living cell' do
      it 'makes the cell dead' do
        world = World.new [
          [1, 0],
          [0, 0]
        ]

        expect(world.simulate).to eq([
          [0, 0],
          [0, 0]
        ])
      end
    end

    context 'with 2 neighbouring cells' do
      it 'makes all cells dead' do
        world = World.new [
          [1, 0],
          [0, 1]
        ]

        expect(world.simulate).to eq([
          [0, 0],
          [0, 0]
        ])
      end
    end

    context 'with a cell that has 2 neighbours' do
      it 'keeps the cell alive' do
        world = World.new [
          [0, 1, 0],
          [1, 0, 1],
          [0, 1, 0]
        ]

        expect(world.simulate).to eq([
          [0, 1, 0],
          [1, 0, 1],
          [0, 1, 0]
        ])
      end
    end

    context 'with a cell that had 3 neighbours' do
      it 'keeps alive such a cell' do
        world = World.new [
          [1, 1, 0],
          [1, 1, 0],
          [0, 0, 0]
        ]
        expect(world.simulate).to eq([
          [1, 1, 0],
          [1, 1, 0],
          [0, 0, 0]
        ])
      end

      it 'resurrects a dead cell' do
        world = World.new [
          [0, 0, 0],
          [1, 1, 1],
          [0, 0, 0]
        ]

        expect(world.simulate).to eq([
          [0, 1, 0],
          [0, 1, 0],
          [0, 1, 0]
        ])
      end
    end

    context 'with a cell with more than 4 living neighbours' do
      it 'kills it' do
        world = World.new [
          [1, 1, 0],
          [1, 1, 1],
          [0, 0, 0]
        ]

        expect(world.simulate).to eq([
          [1, 0, 1],
          [1, 0, 1],
          [0, 1, 0]
        ])
      end
    end
  
    context 'when simulation is run continuously' do
      it 'keeps simulating properly' do
        world = World.new [
          [0, 0, 0],
          [1, 1, 1],
          [0, 0, 0]
        ]
        world.simulate
        expect(world.simulate).to eq([
          [0, 0, 0],
          [1, 1, 1],
          [0, 0, 0]
        ])
      end
    end
  end
end