class Temperature
# Неясна необходимая точность и будет ли температура
# переводиться туда-сюда. Возможно имеет смысл
# использовать BigDecimal из Std-lib вместо float
# либо наоборот Integer
def cels_to_fahrenheit(value)
  (9.0 * value) / 5.0 + 32.0
end

def start
    str = gets_celsium
    matches(str) ? (c = str.to_f) : raise
    check_existence(c) ? pretty_p(c, cels_to_fahrenheit(c)) : raise
  rescue 
     retry
end

private 

def gets_celsium
  puts 'Пожалуйста, введите градусы по Цельсию'
  gets.chomp
end

def  matches(s)
  unless s.match?(/-*\d+/)
    puts 'Ошибка, надо вводить только числа без букв, отрицательные - допускаются'
    return false
  end
  return true
end

def  check_existence(s)
  if s < -273.15
  puts 'Температура не может быть ниже абсолютного нуля!'
  return false
  end
  return true
end

def pretty_p(cels, fahr)
  puts "#{cels} градусов по Цельсию будет равно #{fahr.round(2)} градусов по Фаренгейту"
end

end

Temperature.new.start 

=begin Изначальный вариант был такой
def cels_to_fahrenheit(value)
  (9 * value) / 5.0 + 32.0
end

def gets_celsium
  puts 'Пожалуйста, введите градусы по Цельсию'
  gets.chomp
end

loop do
  str = gets_celsium
  unless str.match?(/-*\d+/)
    puts 'Ошибка, надо вводить только числа без букв, отрицательные - допускаются'
    next
  end
  c = str.to_f
  if c < -273.15
    puts 'Температура не может быть ниже абсолютного нуля!'
    next
  end
  puts "#{c} градусов по Цельсию будет равно #{cels_to_fahrenheit(c)} градусов по Фаренгейту"
  break
end  
=end
