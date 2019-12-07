class ConsoleInput
  def initialize(reader = ConsoleInputReader.new)
    @reader = reader
  end

  def include?(command)
    buffer = reader.read
    buffer.include?('q') || buffer.codepoints.include?(27)
  end

  private

  attr_reader :reader

  class ConsoleInputReader
    def read
      system("stty raw -echo")
      buffer = ''
      $stdin.read_nonblock(16, buffer) rescue nil
      system("stty -raw echo")
      buffer
    end
  end
end
