require("pry-byebug")
require_relative("./models/star.rb")
require_relative("./models/movie.rb")
require_relative("./models/casting.rb")

Casting.delete_all
Star.delete_all()
Movie.delete_all()


star1 = Star.new({ 'first_name' => 'John',
                   'last_name' => 'Travolta'
                  });
star1.save()

star2 = Star.new({ 'first_name' => 'Lino',
                   'last_name' => 'Banfi'
                  });
star2.save()

star3 = Star.new({ 'first_name' => 'Mario',
                   'last_name' => 'Merola'
                  });
star3.save()

star4 = Star.new({ 'first_name' => 'Alvaro',
                   'last_name' => 'Vitale'
                  });
star4.save()



movie1 = Movie.new({'title' => 'pulp fiction',
                    'genre' => 'pulp',
                    'budget' => 8500000.00
                    })
movie1.save()

movie2 = Movie.new({'title' => 'ma ke kazz d film',
                    'genre' => 'ultra trash',
                    'budget' => 100.0
                    })
movie2.save()


casting1 = Casting.new({ 'movie_id' => movie1.id,
                          'star_id' => star1.id,
                          'fee' => 1000.00
                          })
casting1.save()

casting2 = Casting.new({ 'movie_id' => movie2.id,
                          'star_id' => star2.id,
                          'fee' => 50.0
                          })
casting2.save()

casting3 = Casting.new({ 'movie_id' => movie2.id,
                          'star_id' => star3.id,
                          'fee' => 20.0
                          })
casting3.save()

casting4 = Casting.new({ 'movie_id' => movie2.id,
                          'star_id' => star4.id,
                          'fee' => 20.0
                          })
casting4.save()

binding.pry
nil
