CHOICES_TO_VALUES = { 'r' => 'rock',
                      'p' => 'paper',
                      'sc' => 'scissors',
                      'l' => 'lizard',
                      's' => 'spock' }.freeze

RESULTS = { 'rock' => %w(lizard scissors),
            'paper' => %w(rock spock),
            'scissors' => %w(paper lizard),
            'lizard' => %w(spock paper),
            'spock' => %w(scissors rock) }.freeze

def prompt(message)
  puts ">> #{message}"
end

def display_choices
  formatted_choices = CHOICES_TO_VALUES.map do |choice, value|
    "#{choice} => #{value}"
  end.join(', ')

  prompt(formatted_choices)
end

def win?(first_choice, second_choice)
  RESULTS[first_choice].include? second_choice
end

def display_results(user_choice, computer_choice)
  if win?(user_choice, computer_choice)
    prompt 'You won!'
  elsif win?(computer_choice, user_choice)
    prompt 'You lost...'
  else
    prompt 'You tied.'
  end
end

prompt "Welcome to #{CHOICES_TO_VALUES.values.map(&:upcase).join(', ')}!"

loop do
  user_score = 0
  computer_score = 0

  loop do
    prompt 'Please make a choice:'
    display_choices

    user_choice = ''

    loop do
      user_choice = gets.chomp
      break if CHOICES_TO_VALUES.keys.include? user_choice
      puts 'Not a valid choice...'
    end
    user_choice = CHOICES_TO_VALUES[user_choice]

    computer_choice = CHOICES_TO_VALUES.values.sample

    prompt "You chose: #{user_choice}; computer chose: #{computer_choice}"

    display_results(user_choice, computer_choice)
    user_score += 1 if win?(user_choice, computer_choice)
    computer_score += 1 if win?(computer_choice, user_choice)

    prompt "The score is now user: #{user_score}; computer: #{computer_score}"
    break if user_score == 5 || computer_score == 5
  end

  prompt user_score == 5 ? 'You won the game!' : 'The computer won the game!'

  prompt 'Want to play again?'
  break unless gets.downcase.start_with? 'y'
end

prompt 'Thanks for playing! Goodbye!'
