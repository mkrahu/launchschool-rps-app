VALID_CHOICES = %w(rock paper scissors).freeze

RESULTS = { 'rock' => { 'scissors' => 1,
                        'paper' => -1,
                        'rock' => 0 },
            'paper' => { 'rock' => 1,
                         'scissors' => -1,
                         'paper' => 0 },
            'scissors' => { 'paper' => 1,
                            'rock' => -1,
                            'scissors' => 0 } }.freeze

def prompt(message)
  puts ">> #{message}"
end

def display_results(user_choice, computer_choice)
  if RESULTS[user_choice][computer_choice] == 1
    prompt 'You won!'
  elsif RESULTS[user_choice][computer_choice] == -1
    prompt 'You lost...'
  else
    prompt 'You tied.'
  end
end

prompt "Welcome to #{VALID_CHOICES.map(&:upcase).join(', ')}!"

loop do
  prompt "Please make a choice: #{VALID_CHOICES.join(', ')}"

  user_choice = ''
  loop do
    user_choice = gets.chomp
    break if VALID_CHOICES.include? user_choice
    puts 'Not a valid choice...'
  end

  computer_choice = VALID_CHOICES.sample

  prompt "You chose: #{user_choice}; computer chose: #{computer_choice}"

  display_results(user_choice, computer_choice)

  prompt 'Want to play again?'
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt 'Thanks for playing! Goodbye!'
