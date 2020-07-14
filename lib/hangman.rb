class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = create_array
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      false
    end
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |c, i|
      if c == char
        indices << i
      end
    end
    indices
  end

  def fill_indices(char, array)
    array.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    else 
      attempted_chars<<char
      if get_matching_indices(char).length > 0
        fill_indices(char, get_matching_indices(char))
      else
        @remaining_incorrect_guesses -= 1
      end
      
    end
    return true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    guess = gets.chomp
    return self.try_guess(guess)
  
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else 
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end
    false
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    end
    return false
  end

  def create_array
    new_array = []
    @secret_word.length.times do
      new_array << "_"
    end
    new_array
  end 
end
