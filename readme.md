***Тестовое задание для стажеров***

> 1) Есть массив [1, 2, 12, 34, 35, 6, 0, 34, 122, 124, 789, 999, 33,
> 54, 763, 893] a) напишите функцию, которая получает на вход исходный
> массив и возвращает 2 максимальных значения b) напишите функцию,
> которая получает на вход исходный массив и возвращает 2 минимальных
> значения

Первое, второе и третье задания в одном файле: [tasks_1_2_3.rb](https://github.com/Lyams/testovoe_uchi_ru/blob/master/tasks_1_2_3.rb)

Использование простых библиотечных методов:
```ruby
arr1 = [1, 2, 12, 34, 35, 6, 0, 34, 122, 124, 789, 999, 33, 54, 763, 893]
arr1.max(2)
arr1.min(2)
```
Если попробовать написать такую функцию самому, то у меня получилось такое для варианта возвращения двух максимальных значений:
```ruby
def max_two(arr)
  m1 = arr[0]
  m2 = arr[1]
  m2, m1 = m1, m2 if m2 > m1
  arr[2..].each do |tmp|
    if tmp > m1
      m2 = m1
      m1 = tmp
    elsif tmp > m2
      m2 = tmp
    end
  end
  [m1, m2]
end
```
Несложно заметить, что функция, возвращающая два минимальных значения, будет отличаться от max_two только несколько раз повторяющимся знаком неравенства. Поэтому я написал функцию высшего порядка, принимающей вторым агрументом функцию сравнения (Proc lambda). Т.о. order_two мы можем использовать для сравнения по нужному критерию (например, сравнивая как строки и т.п.) с возвращением двух значений.
```ruby
def order_two(arr, f)
  m1 = arr[0]
  m2 = arr[1]
  return [m1, nil] if m2.nil?

  m2, m1 = m1, m2 if f.call(m2, m1)
  arr[2..].each do |tmp|
    if f.call(tmp, m1)
      m2 = m1
      m1 = tmp
    elsif f.call(tmp, m2)
      m2 = tmp
    end
  end
  [m1, m2]
end
```
Тогда искомые функции:
```ruby
def min_2(arr)
  sravni = ->(x, y) { x < y }
  order_two(arr, sravni)
end

def max_2(arr)
  sravni = ->(x, y) { x > y }
  order_two(arr, sravni)
end
```
> 2) Есть массив
> arr = [{a: 1, b: 2, c: 45}, {d: 123, c: 12}, {e: 87}]
> a) напишите выражение, которое получает массив всех ключей
> b) напишите выражение, которое получает массив всех значений
> с) напишите выражение, которое получает сумму всех значений

Простой вариант с использованием библиотечных функций:
```ruby
arr2 = [{ a: 1, b: 2, c: 45 }, { d: 123, c: 12 }, { e: 87 }]
values_arr2 = arr2.flat_map { |hash| hash.values }
keys_arr2 = arr2.flat_map { |hash| hash.keys }
summ_values = values_arr2.sum
```
Алгоритмических вариантов, принципиально отличающихся от простых, я не нашёл,
не уходя совсем в дебри. Все они получались просто «разворачиванием» с
использованием each и map.

> 3) Найдите вхождения каждого элемента в массив [ nil, 2, :foo, “bar”,
> “foo”, “apple”, “orange”, :orange, 45, nil, :foo, :bar, 25, 45,
> :apple, “bar”, nil] чтобы на выходе получился Hash по типу { элемент
> => количество вхождений в массив}


В версиях Ruby до 2.6 включительно:

```ruby
arr3 = [nil, 2, :foo, 'bar', 'foo', 'apple', 'orange', :orange, 45, nil, :foo, :bar, 25, 45, :apple, 'bar', nil]
arr3.each_with_object( Hash.new(0) ) { |el, obj| obj[el] += 1 }
```
Начиная с Ruby 2.7 появился метод tally с той же функциональностью:

```ruby
arr3.tally
```

если же изобретать велосипед, то можно так:

```ruby
acc = Hash.new(0)
until arr3.empty? do
  acc[ arr3.pop ] += 1
end
```

> 4) Напишите функцию a) которая переводит градусы по Цельсию в градусы
> по Фаренгейту (формулу нужно найти в интернете) b) напишите консольную
> программу, которая просит юзера ввести число (градусы по Цельсию) и
> переводит его в Фаренгейты с) необязательно, но будет плюсом Напишите
> обработку ошибок, если юзер ввел неправильные данные (программа должна
> просить ввести число заново и сообщать об ошибке, но не прерываться)

Сначала я написал такой работающий вариант:
```ruby
def cels_to_fahrenheit(value)
   (9 * value) / 5.0 + 32.0
end

def gets_celsium
  puts 'Пожалуйста, введите градусы по Цельсию'
  gets.chomp
end

loop do
  str = gets_celsium
  unless str.match?(/^-*\d+/)
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
```
При вводе допускается если пользователь введет что-то вроде: 20 C.

Регулярным выражением /^-*\d+/ проверяется, чтобы начало введенного выражения было
числовым. Сначала минус я хотел ограничить одним знаком или отсутсвием с помощью "?" в
регулярном выражении, но потом решил, что то — не нужное ограничение.
Но меня первый вариант как то не устраивал. Поэтому изменил код, возможно перемудрив:
```ruby  
class Temperature

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

  def matches(s)
    if s.match?(/^-*\d+/)
      true
    else
      puts 'Ошибка, надо вводить только числа без букв, отрицательные - допускаются'
      false
    end
  end

  def  check_existence(s)
    if s < -273.15
      puts 'Температура не может быть ниже абсолютного нуля!'
      false
    else
      true
    end
  end

  def pretty_p(cels, fahr)
    puts "#{cels} градусов по Цельсию будет равно #{fahr.round(2)} градусов по Фаренгейту"
  end
end

Temperature.new.start
```
Файл с 4 заданием: [task_4_Celsium.rb](https://github.com/Lyams/testovoe_uchi_ru/blob/master/task_4_Celsium.rb)

Отмечу, что неясна необходимая точность и будет ли температура переводиться туда-сюда
в задании 4а.
В редких случаях может иметь смысл использовать BigDecimal из Std-lib вместо float,
если возможны проблемы в чём-то схожие с конвертацией денег. Либо наоборот Integer — 
если перевод температуры, например, носит информационный характер и используется
только для показа на сайте погоды для пользователей, интересующихся, как им одеться.


> 5) Напишите функцию, которая имитирует работу светофора a) на вход она
> получает один из цветов в виде строки (‘red’, ‘green’, ‘yellow’ ), на
> выходе будет результат (идти, стоять или ждать) b) напишите это в виде
> консольной программы, которая не прекращает работу после однократного
> вызова, а ждет следующих запросов c) необязательно, но будет плюсом
> напишите обработку некорректных данных и добавьте возможность юзеру
> завершить работу программы

Простой вариант, выход осуществляется через ввод q при ожидани ввода:
```ruby  
COMMANDS = { 'red' => 'стоять', 'green' => 'идти', 'yellow' => 'ждать' }

def gets_action(input)
  COMMANDS[input]
end

loop do
  puts 'Ввведите цвет сигнала светофора. Для выхода введите q'
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
```
До этого чуть-чуть играл с гемом tty-prompt. Переписал в такой вариант, где пользователь
выбирает из списка вариант, а после выбора необходимое действие (стоять, идти, ждать)
окрашено соответствующим ему цветом:

![Пример работы в консоли](https://github.com/Lyams/testovoe_uchi_ru/blob/master/png/task5withPromt.png)
Файлы с пятым заданием: [task_5_traffic_light_promt.rb](https://github.com/Lyams/testovoe_uchi_ru/blob/master/task_5_traffic_light_promt.rb), [task_5_traffic_light.rb](https://github.com/Lyams/testovoe_uchi_ru/blob/master/task_5_traffic_light.rb)

```ruby
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
```



> 5^)  Обязательное задание. Есть таблица students с колонками id int name
> varchar created_at datetime parent_id int a) посчитайте количество
> всех студентов b) посчитайте количество студентов с именем Иван c)
> посчитайте количество студентов созданных после 1 сентября 2020 года
>
> ^ - слегка сбилась нумерация.

```SQL
select COUNT(*) from students;
select COUNT(*) from students where name = 'Иван';
select COUNT(*) from students where created_at >= '2020-09-02 00:00:00';
```

> 6) Необязательное задание, но его выполнение будет плюсом. Так же есть
> таблица parents (см задание 5) id int name varchar created_at datetime
> a) посчитайте количество студентов с родителями b) посчитайте
> количество студентов с родителями при том что имя родителя Марина c)
> посчитайте количество студентов без родителя

```SQL
select COUNT(students.id) from students where students.parent_id is NOT null;
select COUNT(students.id) from students inner join parents
on students.parent_id =  parents.id where parents.name = 'Марина';
select COUNT(students.id) from students left join parents
on students.parent_id = parents.id where parents.id is null;
```

Так как в требованиях к ТЗ указано, что при выполнении заданий использовать Ruby,
привел пример применения одного из запросов в Ruby коде:
```ruby
require 'pg'
conn = PG.connect(dbname: 'postgres', user: 'ilya', password: '1')

conn.exec("select COUNT(*) from students where name = 'Иван';") do |result|
  puts
  result.each { |row| puts row.values }
end
```

По заданиям с запросами 3 файла:
1. Файл с запросами на SQL: [task_dr5_6_query.sql](https://github.com/Lyams/testovoe_uchi_ru/blob/master/task_dr5_6_query.sql "task_dr5_6_query.sql")
2. Файл с имитационными данными, на которых я проверял работу запросов в игрушечном примере используя dbeaver community: [task_dr5_6_seed.sql](https://github.com/Lyams/testovoe_uchi_ru/blob/master/task_dr5_6_seed.sql "task_dr5_6_seed.sql")
3. Пример одного из запросов в Ruby коде: [task_dr5_6.rb](https://github.com/Lyams/testovoe_uchi_ru/blob/master/task_dr5_6.rb "task_dr5_6.rb")



> 7) Необязательная, но выполнение будет очень большим плюсом a)Напишите
> простой блог на рельсе с минимальным функционалом (один автор, который
> выкладывает посты. Комментарии, сортировки, фильтры и основные рюшечки
> не обязательны, но остаются на ваше усмотрение и желание. Как и
> стилизация) b) выложить проект на Heroku

Сначала я думал о том, чтобы «прикрутить» gem devise. Так как требовалось
с минимальным функционалом с одним автором, то сделал
[простой вариант аутентификации автора по этой инструкции](https://api.rubyonrails.org/classes/ActionController/HttpAuthentication/Basic.html). Блог оформлен [отдельным гитхаб репозиторием](https://github.com/Lyams/Uchi_very_simple_blog) и [задеплоен на Heroku](https://simpleblogfortrainee.herokuapp.com/articles).
Рюшешчки прикручивать почти не стал (немного бутсрапа в сыром виде),
ограничившись валидацией Article.
