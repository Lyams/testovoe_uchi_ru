require 'tty-prompt'

CMD = { 'red' => 'стоять', 'green' => 'идти', 'yellow' => 'ждать' }

def gets_color(input)
  CMD[input]
end

def start_light
  prompt = TTY::Prompt.new
  loop do
    choice = prompt.select('Select color or quit: ', CMD.keys + ['quit'] , filter: true)
    break if choice == 'quit'

    result = gets_color(choice)
    prompt.say(result, color: choice.to_sym)
  end
end

start_light
