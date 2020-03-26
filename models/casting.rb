require_relative('../db/sql_runner.rb')

class Casting

  attr_accessor :movie_id, :star_id, :fee
  attr_reader :id
  def initialize(cast)
    @id = cast["id"].to_i if cast["id"]
    @movie_id = cast["movie_id"].to_i
    @star_id = cast["star_id"].to_i
    @fee = cast["fee"].to_f
  end

def save()
  sql = "INSERT INTO castings (movie_id, star_id, fee)
        VALUES ($1, $2, $3) RETURNING id"
  values = [@movie_id, @star_id, @fee]
  @id = SqlRunner.run(sql,values)[0]['id'].to_i
end

def self.all()
  sql = "SELECT * FROM castings "
  all = SqlRunner.run(sql)
  return all.map{|casting| self.new(casting)}
end

def self.delete_all()
  sql = "DELETE FROM castings"
  return SqlRunner.run(sql)
end

def update()
  sql = "UPDATE castings SET (movie_id, star_id, fee)
        = ($1, $2, $3) WHERE id = $4"
  values = [@movie_id, @star_id, @fee, @id]
  return SqlRunner.run(sql,values)
end



end
