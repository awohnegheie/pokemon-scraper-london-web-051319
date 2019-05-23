class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    self
  end
  #is initialized with keyword arguments of id, name, type and db

  def self.save(name, type, db)
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
 end
#saves an instance of a pokemon with the correct id
  def self.find(id, db)
   result = db.execute("SELECT name,type FROM pokemon WHERE id = ?", id)

   Pokemon.new(id:id, name:result[0][0], type:result[0][1], db:db)
 end
#finds a pokemon from the database by their id number and returns a new Pokemon object

end
