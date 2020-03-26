require_relative('../db/sql_runner.rb')

class Movie
  attr_accessor :title, :genre, :budget
  attr_reader :id

  def initialize(movie)
    @id = movie["id"].to_i if movie["id"]
    @title = movie["title"]
    @genre = movie["genre"]
    @budget = movie["budget"].to_f
  end

  def save()
    sql = "INSERT INTO movies (title, genre, budget)
            VALUES ($1, $2, $3) RETURNING id;"
    values = [@title, @genre, @budget]
    @id = SqlRunner.run(sql,values).first()["id"].to_i
  end

 def self.all()
   sql = "SELECT * FROM movies"
   all = SqlRunner.run(sql)
   return all.map{|movie| self.new(movie)}
 end

def self.delete_all()
  sql = "DELETE FROM movies"
  return SqlRunner.run(sql)
end

def update()
  sql = "UPDATE movies SET (title, genre, budget) = ($1, $2, $3) WHERE id = $4"
  values = [@title, @genre, @budget, @id]
  return SqlRunner.run(sql, values)
end

def stars()
  sql = "SELECT stars.* FROM stars
        INNER JOIN castings
        ON castings.star_id = stars.id
        WHERE castings.movie_id = $1;"
  values =[@id]
  stars_hash = SqlRunner.run(sql,values)
  return stars_hash.map{|star| Star.new(star)}
end


def budget_left()
  sql = "SELECT stars.*, castings.fee FROM stars
        INNER JOIN castings
        ON castings.star_id = stars.id
        WHERE castings.movie_id = $1;"
  values=[@id]
  total_hash = SqlRunner.run(sql,values)
  return @budget - total_hash.reduce(0.0){|sum,fee| sum += fee['fee'].to_f }
end






end
