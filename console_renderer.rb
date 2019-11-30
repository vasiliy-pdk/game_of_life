# Renderer accepts the grid and formats to string then clears 
# the console and outputs
#
# @TODO: Improve it visually:
# 1. Clear the entire screen and position cursor at exact beginning
# 2. Provide some information at the first line
# 3. Draw the field better:
# 3.1 Colours
# 3.2 Unicode symbols: https://charbase.com/ output by "\u2620"; ASCII symbols: 
# 3.3 Box drawing: https://charbase.com/block/box-drawing ; https://en.wikipedia.org/wiki/Block_Elements 
#
# Notes: more on ASCII https://en.wikipedia.org/wiki/ASCII ; https://en.wikipedia.org/wiki/ANSI_art ; https://en.wikipedia.org/wiki/ANSI_escape_code 
class ConsoleRenderer
  HOME_CURSOR = "\e[H"
  CLEAR_SCREEN = "\e[2J"

  def initialize(output = $stdout)
    @out = output
  end

  def render(grid)
    out.print HOME_CURSOR
    out.puts CLEAR_SCREEN
    out.print format(grid)
  end

  private

  def format(grid)
    grid.map do |row|
      row.map { |cell| format_cell(cell) }.join 
    end.join("\n") + "\n"
  end

  def format_cell(cell)
    [' ', '#'][cell]
  end

  attr_reader :out
end