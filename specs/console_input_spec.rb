require_relative '../lib/console_input'

describe 'ConsoleInput' do
  describe '#include?' do
    let(:input) { ConsoleInput.new(test_input_reader) }
    let(:test_input_reader) { TestInputReader.new }

    context 'when there is no characters in the input' do
      it 'returns false' do
        user_presses_nothing

        expect(input.include?(:stop)).to eq(false)
        expect(input.include?(:any_command)).to eq(false)
      end
    end

    context 'when there are characters in the input corresponding to :stop command' do
      it 'returns true' do
        user_presses_keys 'q'
        expect(input.include?(:stop)).to eq(true)

        ESCAPE_KEY = "\e"
        user_presses_keys ESCAPE_KEY
        expect(input.include?(:stop)).to eq(true)

        user_presses_keys 'whatever characters and "q" within them'
        expect(input.include?(:stop)).to eq(true)
      end
    end

    def user_presses_keys(keys)
      test_input_reader.raw_input = keys
    end

    def user_presses_nothing
      test_input_reader.raw_input = ''
    end
  end

  class TestInputReader
    def raw_input=(input)
      @raw_input = input
    end

    def read
      @raw_input
    end
  end
end
