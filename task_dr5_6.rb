require 'pg'

conn = PG.connect( dbname: 'postgres', user: 'ilya' , password: '1')

conn.exec( "select COUNT(*) from students where name = 'Иван';" ) do
  |result| puts 
  result.each{ |row| puts row.values}
end
