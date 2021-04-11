***Тестовое задание для стажеров***

> 1) Есть массив [1, 2, 12, 34, 35, 6, 0, 34, 122, 124, 789, 999, 33,
> 54, 763, 893] a) напишите функцию, которая получает на вход исходный
> массив и возвращает 2 максимальных значения b) напишите функцию,
> которая получает на вход исходный массив и возвращает 2 минимальных
> значения

Первое, второе и третье задания в одной файле: [tasks_1_2_3.rb](https://github.com/Lyams/testovoe_uchi_ru/blob/master/tasks_1_2_3.rb)

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
```
Алгоритмических вариантов, принципиально отличающихся от простых, я не нашёл,
не уходя совсем в дебри. Все они получались просто «разворачиванием» с
использованием each и map.

> 3) Найдите вхождения каждого элемента в массив [ nil, 2, :foo, “bar”,
> “foo”, “apple”, “orange”, :orange, 45, nil, :foo, :bar, 25, 45,
> :apple, “bar”, nil] чтобы на выходе получился Hash по типу { элемент
> => количество вхождений в массив}

```ruby
entry = Hash.new(0)
arr3 = [nil, 2, :foo, 'bar', 'foo', 'apple', 'orange', :orange, 45, nil, :foo, :bar, 25, 45, :apple, 'bar', nil]
arr3.each { |el| entry[el] += 1 }
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
Но меня он как то не устраивал. Поэтому изменил код, возможно перемудрив:
```ruby  
class Temperature

  def cels_to_fahrenheit(value)
    (9.0 * value) / 5.0 + 32.0
  end

  def start
    str = gets_celsium
    matches(str) ? (c = str.to_f) : raise
    check_existence(c) ? pretty_p(c, cels_to_fahrenheit(c)) : raise
  rescue StandardError
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
Отмечу, что неясна необходимая точность и будет ли температура переводиться туда-сюда.
В редких слчаях может иметь смысл использовать BigDecimal из Std-lib вместо float,
если возможны проблемы в чём-то схожие с конвертацией денег. Либо наоборот Integer — 
если перевод температуры, например, носит информационный характер и используется
только для показа на сайте погоды для ппростых пользователей.


> 5) Напишите функцию, которая имитирует работу светофора a) на вход она
> получает один из цветов в виде строки (‘red’, ‘green’, ‘yellow’ ), на
> выходе будет результат (идти, стоять или ждать) b) напишите это в виде
> консольной программы, которая не прекращает работу после однократного
> вызова, а ждет следующих запросов c) необязательно, но будет плюсом
> напишите обработку некорректных данных и добавьте возможность юзеру
> завершить работу программы



> 5^)  Обязательное задание. Есть таблица students с колонками id int name
> varchar created_at datetime parent_id int a) посчитайте количество
> всех студентов b) посчитайте количество студентов с именем Иван c)
> посчитайте количество студентов созданных после 1 сентября 2020 года
> ^ - слегка сбилась нумерация.

> 6) Необязательное задание, но его выполнение будет плюсом. Так же есть
> таблица parents (см задание 5) id int name varchar created_at datetime
> a) посчитайте количество студентов с родителями b) посчитайте
> количество студентов с родителями при том что имя родителя Марина c)
> посчитайте количество студентов без родителя
По заданию три файла:

По заданиям с запросами 3 файла:
1. Файл с запросами на SQL: [task_dr5_6_query.sql](https://github.com/Lyams/testovoe_uchi_ru/blob/master/task_dr5_6_query.sql "task_dr5_6_query.sql")
2. Файл с имитационными дынными, на которых я проверял работу запросов в игрушечном примере используя dbeaver community: [task_dr5_6_seed.sql](https://github.com/Lyams/testovoe_uchi_ru/blob/master/task_dr5_6_seed.sql "task_dr5_6_seed.sql")
3. Так как в требованиях к ТЗ указано, что при выполнении всех заданий использовать Ruby, привел пример одного из запросов в Ruby коде: [task_dr5_6.rb](https://github.com/Lyams/testovoe_uchi_ru/blob/master/task_dr5_6.rb "task_dr5_6.rb")



> 7) Необязательная, но выполнение будет очень большим плюсом a)Напишите
> простой блог на рельсе с минимальным функционалом (один автор, который
> выкладывает посты. Комментарии, сортировки, фильтры и основные рюшечки
> не обязательны, но остаются на ваше усмотрение и желание. Как и
> стилизация) b) выложить проект на Heroku

Сначала я думал о том, чтобы «прикрутить» gem devise. Так как требовалось с минимальным функционалом с одним автором, то сделал [простой вариант по этой инструкции](https://api.rubyonrails.org/classes/ActionController/HttpAuthentication/Basic.html). Блог оформлен [отдельным гитхаб репозиторием](https://github.com/Lyams/Uchi_very_simple_blog) и [задеплоен на Heroku](https://simpleblogfortrainee.herokuapp.com/articles). Рюшешчки прикручивать почти не стал (немного бутсрапа в сыром виде), ограничившись валидацией Article.