# require 'pry'
# class Pokemon
#   attr_accessor :id, :name, :type, :db
# 
# 
#   def initialize(args)
#     @name = args[:name]
#     @type = args[:type]
#     @db = args[:db]
#     @id = args[:id]
#   end
# 
#   def self.save(name, type, db)
#       sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
#       db.execute(sql, name, type)
#   end
# 
# 
#   def self.find(id, db)
#     sql = "SELECT * FROM pokemon WHERE id = ?"
#     result = db.execute(sql, id).flatten #flatten returns array w/o nested arrays.
#     Pokemon.new(id: result[0], name: result[1], type: result[2], db:db)
#   end
# end

class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
  end

  def initialize(id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end
  # Pokemon.reify_from_row(row).flatten
  # finds based on id, returns a new Pokemon object, selects their row from the db, using the id number
  # def alter(new_health, db)
      # sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
  #   db.execute(sql, new_health, self.id)
  # end

  #
  # def self.find(id_num, db)
  #   pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
  #   Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
  # end

  # def self.reify_from_row(rows)
  #   rows.collect{|r| reify_from_row(r) }
  # end


 # save, add, remove, change


#
#   def self.save(nam, type, db)# called from scraper class to save the newly scraped instance
#     database_connection.execute  ("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
#   end
# s
#
#   def self.find(id=nil, db)
#     database_connection.execute #find in database
# end
