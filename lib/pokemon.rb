class Pokemon
 attr_accessor :id,:name,:type,:db
    def initialize(id:,name:,type:,db:)
        @id=id
        @name=name
        @type=type
        @db=db
    end
    def self.save(name,type,db)
        db.execute("INSERT INTO pokemon(name,type) VALUES(?,?)",name,type)
    end
    def self.find(id,db)
        poke=db.execute("Select * from pokemon where id=?",id).flatten
        Pokemon.new(id:poke[0],name:poke[1],type:poke[2],db:db)

    end
end
