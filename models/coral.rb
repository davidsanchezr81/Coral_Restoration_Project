require_relative("../db/sql_runner.rb")

class Coral

  attr_reader(:id, :species ,:name, :plant_date, :reef_id )

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @species = options['species']
    @name = options['name']
    @plant_date = options['plantdate']
    @reef_id = options['reef_id'].to_i
  end

  def save()
    sql = "INSERT INTO corals
    ( species,
      name,
      plantdate,
      reef_id
    )
    VALUES
    ($1,$2, $3, $4)
    RETURNING id"
    values = [@species, @name, @plant_date, @reef_id]
    results =SqlRunner.run(sql, values).first
    @id = results['id'].to_i
  end

  # def reefs
  #   sql = "SELECT r.* FROM reefs r INNER JOIN restorations ON
  #   restorations.reef_id = r.id WHERE restorations.coral_id = $1;"
  #   values = [@id]
  #   results = SqlRunner.run(sql, values)
  #   return results.map{|reef| Reef.new(reef) }
  # end


  def Coral.all
    sql = "SELECT * FROM corals"
    results = SqlRunner.run(sql)
    return results.map {|coral| Coral.new(coral)}
  end



  def Coral.delete_all
    sql = "DELETE FROM corals"
    results = SqlRunner.run(sql)
  end

end
