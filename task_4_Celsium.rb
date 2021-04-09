def cels_to_fahrenheit(value)
  (9 * value) / 5.0 + 32.0
end

def gets_celsium
  puts 'Пожалуйста, введите градусы по Цельсию'
  gets.chomp
end
loop do
  c = gets_celsium.to_i
  if c < -273.15
    puts 'Температура не может быть ниже абсолютного нуля!'
    next
  end
  puts "#{c} градусов по Цельсию будет равно #{cels_to_fahrenheit(c)} градусов по Фаренгейту"
  break
end
