class World
  DEAD_CELL = 0
  ALIVE_CELL = 1

  def initialize(first_population)
    @world = first_population
  end

  def simulate
    @world = generate_new_world
  end

  private

  def generate_new_world
    world.map.with_index do |row, y|
      row.map.with_index do |cell, x|
        simulate_cell(cell, alive_neighbours_count(x, y))
      end
    end
  end

  def simulate_cell(cell, alive_neighbours_count)
    if cell == ALIVE_CELL && [2, 3].include?(alive_neighbours_count)
      ALIVE_CELL
    elsif cell == DEAD_CELL && alive_neighbours_count == 3
      ALIVE_CELL
    else
      DEAD_CELL
    end
  end

  def alive_neighbours_count(x, y)
    neighbours(x, y).count(ALIVE_CELL)
  end

  def neighbours(x, y)
    Grid.new(world).neighbours(x, y)
  end

  attr_reader :world
end