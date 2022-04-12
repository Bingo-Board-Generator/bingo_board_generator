require 'rspec'
require 'bingo_board_generator'

RSpec.describe BingoBoardGenerator do
  let(:word_list) {
    [
      'kill',
      'zodiac',
      'royal',
      'victory',
      'bakery',
      'dancer',
      'diamonds',
      'young',
      'shoulders',
      'nine',
      'flan',
      'torch',
      'electrical',
      'knee',
      'summer',
      'leafer'
    ]
  }

  let(:board) { BingoBoardGenerator.new(word_list)}

  it 'exists with attributes' do
    expect(board).to be_a BingoBoardGenerator
    expect(board.word_list).to eq(word_list)
    expect(board.grid_size).to eq(4)
    expect(board.box_length).to eq(word_list.max_by(&:length).length + 2)
  end

  it 'can have custom grid size' do
    new = BingoBoardGenerator.new(word_list, 5)

    expect(new.grid_size).to eq 5
  end

  describe 'instance methods' do
    describe '#randomize_board_words' do
      it 'shuffles the word list array for a board' do
        board_1 = board.randomize_board_words
        board_2 = board.randomize_board_words

        expect(board_1).to_not eq(board_2)
        expect(board_1).to include('free')
        expect(board_2).to include('free')
      end
    end
  end
end
