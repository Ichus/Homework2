# This class allows a user 5 tries to guess a number between 1-100.
# Incorrect guesses will be noted as to high or to low
class UserGuessingGame
  # Sets the random number to be guessed and passes control to the guess method
  def initialize
    random_number = Random.new
    @number = random_number.rand(1..100)
    self.guess
  end

  # Allows the user to guess. If the guess is correct a message is posted.
  # Otherwise control is passed to the keep_guessing method
  def guess
    puts 'Guess a number between 1-100, You only have 5 tries to get it right.'

    guess = gets.to_i

    if guess == @number
      puts 'WOW!! You guessed it on the first try!'
    else
      self.keep_guessing guess
    end
  end

  # The user guesses until getting it right or running out of guesses.
  # Then control is passed to the results method.
  def keep_guessing(guess)
    count = 0
    until guess == @number || count == 4
      if guess < @number
        puts 'Your guess was too low. Try Again.'
      else
        puts 'Your guess was too high. Try Again'
      end

      guess = gets.to_i
      count += 1
    end

    self.results guess
  end

  # Prints the result of the game to the screen.
  def results(guess)
    if guess == @number
      puts 'Congratulations you guessed the right number!'
    else
      puts 'You ran out of guesses.'
    end
  end
end

# Create instance of UserGuessingGame to begin the game
try_to_guess = UserGuessingGame.new
try_to_guess
