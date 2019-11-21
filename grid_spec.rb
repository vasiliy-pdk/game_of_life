require_relative 'grid'

describe 'Grid' do
  describe '#neighbours' do
    context 'when empty' do
      it 'returns nil' do
        world = Grid.new [[]]
        expect(world.neighbours(0, 0)).to be_nil
      end
    end

    context 'when contains cells' do
      it 'returns the adjacent cells to the specified one' do
        grid = Grid.new [
          [1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]
        ]

        expect(grid.neighbours(1, 1)).to eq([1, 2, 3, 4, 6, 7, 8, 9])
        expect(grid.neighbours(1, 0)).to eq([1, 3, 4, 5, 6]) 
        expect(grid.neighbours(1, 2)).to eq([4, 5, 6, 7, 9])
        expect(grid.neighbours(0, 0)).to eq([2, 4, 5])
        expect(grid.neighbours(1, 0)).to eq([1, 3, 4, 5, 6])
      end
    end
  end

  describe '#neighbours_within_row' do
    let(:grid) do
      Grid.new [
        ['cell1', 'cell2', 'cell3'],
        ['cell4', 'cell5', 'cell6']
      ]
    end
    
    it 'returns the adjacent cells within the row to the specified cell index' do
      expect(grid.neighbours_within_row(0, 0)).to eq(['cell2'])
      expect(grid.neighbours_within_row(0, 2)).to eq(['cell2'])
      expect(grid.neighbours_within_row(0, 1)).to eq(['cell1', 'cell3'])
      expect(grid.neighbours_within_row(1, 2)).to eq(['cell5'])
      expect(grid.neighbours_within_row(1, 1)).to eq(['cell4', 'cell6'])
    end

    context 'when cell does not exist' do
      it 'raises an exception' do
        expect { grid.neighbours_within_row(3, 0) }.to raise_error('Row 3 does not exsist')
        expect { grid.neighbours_within_row(0, 100) }.to raise_error('Column 100 does not exsist')
      end
    end
  end
end