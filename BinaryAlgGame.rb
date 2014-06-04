# This class allows the computer 5 tries to guess a number between 1-100.
# Incorrect guesses will be noted as to high or to low
class BinaryAlgorithmGuessingGame
  #asks user for the value the computer should guess, and sets initial values
  def initialize
    @LOWER_THAN = 1
    @GREATER_THAN = 2
    @lower_bound = 1
    @upper_bound = 100
    puts 'Enter a number between 1-100 which the computer will attempt to guess'
    @number = gets.to_i
    self.first_guess
  end

  # Takes the previous guess and whether it was < or > than the target as arguments from keep_guessing
  # Then calculates the next step in the binary search
  def binary_guess(guess, greater_or_less)
    if greater_or_less == @LOWER_THAN
        @lower_bound = guess + 1
        guess = (guess + ((@upper_bound - @lower_bound) / 2)) + 1
    else if greater_or_less == @GREATER_THAN
        @upper_bound = guess - 1
        guess = (guess - ((@upper_bound - @lower_bound) / 2)) - 1
      end
    end

    guess
  end

  #Sets the computers first guess. notes if correct. otherwise passes control to keep_guessing
  def first_guess# (guess)
    guess = @upper_bound / 2
    if guess == @number
      puts 'WOW!! the computer guessed it on the first try!'
    else
      self.keep_guessing guess
    end
  end

  # The computer guesses until getting it right or running out of guesses.
  # Then control is passed to the results method.
  def keep_guessing(guess)
    count = 0
    until guess == @number || count == 4
      if guess < @number
        puts 'The computer guessed ' + guess.to_s + ', guess was too low. Trying Again.'
        guess = self.binary_guess(guess, @LOWER_THAN)
      else
        puts 'The computer guessed ' + guess.to_s + ', guess was too high. Trying Again.'
        guess = self.binary_guess(guess, @GREATER_THAN)
      end

      count += 1
    end
    self.results guess
  end

  # Prints the result of the game to the screen.
  def results(guess)
    if guess == @number
      puts 'The computer guessed ' + guess.to_s + ', it guessed the right number!'
    else
      puts 'The computer guessed ' + guess.to_s + ', ran out of guesses.'
    end
  end
end

# Create instance of BinaryAlgorithmGuessingGame to begin the game
try_to_guess = BinaryAlgorithmGuessingGame.new
try_to_guess
