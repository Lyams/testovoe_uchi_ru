COMMANDS = { 'red' => 'стоять', 'green' => 'идти', 'yellow' => 'ждать' }

def gets_action(input)
  COMMANDS[input]
end

loop do
  puts 'Ввведите цвет светофора. Для выхода введите q'
  choice = gets.chomp.downcase
  break if choice == 'q'

  action = gets_action(choice)
  if action.nil?
    puts 'Некорректные данные, повторите ввод.'
    puts "На ваш выбор следующие допустимые цвета: #{COMMANDS.keys.join(', ')}, а для выхода: 'q'"
    next
  end
  puts "На выбранный цвет сигнала светофора следует #{action}"
end
