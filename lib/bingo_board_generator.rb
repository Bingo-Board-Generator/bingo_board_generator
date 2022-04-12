class BingoBoardGenerator

  attr_reader :word_list,
              :grid_size,
              :box_length

  def initialize(word_list, grid_size = 4)
    @grid_size = grid_size
    @word_list = word_list # REQ: word_list.count >= grid_size**2
    @box_length = @word_list.max_by(&:length).length + 2
  end

  def randomize_board_words
    shuffled = @word_list.shuffle # Randomize word_list
    sliced = shuffled.slice(0, @grid_size.to_i * @grid_size.to_i - 1) # Slice a range from 0 to # squares to fill minus 1 (space for free square).

    if @grid_size.odd?
      sliced.insert((sliced.length / 2), 'free') # Odd size grid has a center spot
    else
      sliced << 'free'
      sliced.shuffle # Even size grid has no center, so place 'free' randomly
    end
  end
end
