***Тестовое задание для стажеров***

> 1) Есть массив [1, 2, 12, 34, 35, 6, 0, 34, 122, 124, 789, 999, 33,
> 54, 763, 893] a) напишите функцию, которая получает на вход исходный
> массив и возвращает 2 максимальных значения b) напишите функцию,
> которая получает на вход исходный массив и возвращает 2 минимальных
> значения

> 2) Есть массив
> arr = [{a: 1, b: 2, c: 45}, {d: 123, c: 12}, {e: 87}]
> a) напишите выражение, которое получает массив всех ключей
> b) напишите выражение, которое получает массив всех значений
> с) напишите выражение, которое получает сумму всех значений

> 3) Найдите вхождения каждого элемента в массив [ nil, 2, :foo, “bar”,
> “foo”, “apple”, “orange”, :orange, 45, nil, :foo, :bar, 25, 45,
> :apple, “bar”, nil] чтобы на выходе получился Hash по типу { элемент
> => количество вхождений в массив}


> 4) Напишите функцию a) которая переводит градусы по Цельсию в градусы
> по Фаренгейту (формулу нужно найти в интернете) b) напишите консольную
> программу, которая просит юзера ввести число (градусы по Цельсию) и
> переводит его в Фаренгейты с) необязательно, но будет плюсом Напишите
> обработку ошибок, если юзер ввел неправильные данные (программа должна
> просить ввести число заново и сообщать об ошибке, но не прерываться)

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