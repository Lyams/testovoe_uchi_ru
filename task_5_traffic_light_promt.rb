require 'tty-prompt'

ACTION = %w(quit red green yellow)

def gets_color(input)
  cmd = { 'red' => 'стоять', 'green' => 'идти', 'yellow' => 'ждать' }
  cmd[input]
end

def start_light
prompt = TTY::Prompt.new
loop do
  choice = prompt.select('Select color or quit: ', ACTION , filter: true)
  break if choice == 'quit'
  result = gets_color(choice)
  prompt.say(result, color: choice.to_sym )
end
end

start_light
