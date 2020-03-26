require_relative('../db/sql_runner.rb')


class Star
  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(star)
    @id = star['id'].to_i if star['id']
    @first_name = star["first_name"]
    @last_name = star["last_name"]
  end

def save()
  sql = "INSERT INTO stars (first_name,last_name)
        VALUES ($1,$2) RETURNING id;"
  values = [@first_name,@last_name]
  @id = SqlRunner.run(sql,values).first()["id"].to_i
end

def self.all()
  sql = "SELECT * FROM stars"
  all = SqlRunner.run(sql)
  return all.map{|star| self.new(star)}
end

def self.delete_all()
  sql = "DELETE FROM stars"
  return SqlRunner.run(sql)
end

def update()
  sql = "UPDATE stars SET(first_name, last_name) = ($1,$2) WHERE id = $3"
  values = [@first_name,@last_name,@id]
  return SqlRunner.run(sql,values)
end

def movies()
  sql = "SELECT movies.* FROM movies
        INNER JOIN castings
        ON movies.id = castings.movie_id
        WHERE castings.star_id = $1;"
 values = [@id]
 hash_movies = SqlRunner.run(sql,values)
 return hash_movies.map{|movie| Movie.new(movie)}
end





end
