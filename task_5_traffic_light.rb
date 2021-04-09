require 'tty-prompt'

def gets_color(input)
  cmd = { 'red' => 'стоять', 'green' => 'идти', 'yellow' => 'ждать' }
  cmd[input]
end

prompt = TTY::Prompt.new

loop do
  puts 'Ввведите цвет светофора'
  action = gets_color(gets.chomp.downcase)
  puts 'Некорректные данные, повторите ввод' if action.nil?
  puts action
  break if prompt.yes?('Хотите ли вы выйти?')
end
