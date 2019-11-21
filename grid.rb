class Grid
  def initialize(cells)
    @cells = cells
  end

  def neighbours(column, row)
    return nil if cells.flatten.empty?

    neighbours = []

    if row > 0
      neighbours << neighbours_within_row(row - 1, column, true)
    end

    neighbours << neighbours_within_row(row, column)
    
    if row < cells.size - 1
      neighbours << neighbours_within_row(row + 1, column, true)
    end
    
    neighbours.flatten
  end

  def neighbours_within_row(row_index, column_index, include_self = false)
    ensure_cell_address_valid! row_index, column_index
    row = cells[row_index]
    neighbours = []
    neighbours << row[column_index + 1] if column_index < row.size - 1
    neighbours << row[column_index] if include_self
    neighbours << row[column_index - 1] if column_index > 0
    neighbours.reverse
  end

  private

  def ensure_cell_address_valid!(row_index, column_index)
    raise RangeError, "Row #{row_index} does not exsist" unless cells[row_index]
    raise RangeError, "Column #{column_index} does not exsist" unless column_index < cells[row_index].size 
  end

  attr_reader :cells
end