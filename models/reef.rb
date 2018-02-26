require_relative("../db/sql_runner.rb")

class Reef

  attr_accessor(:name, :location )
  attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @location = options['location']
  end

  def save()
    sql = "INSERT INTO reefs
    ( name,
      location
    )
    VALUES
    ($1,$2)
    RETURNING id"
    values = [@name, @location]
    results =SqlRunner.run(sql, values).first
    @id = results['id'].to_i
  end

  def corals
    sql = "SELECT c.* FROM corals c
    INNER JOIN restorations
    ON restorations.coral_id = c.id
    WHERE restorations.reef_id = $1; "
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|coral| Coral.new(coral) }
  end

  def Reef.all
    sql = "SELECT * FROM reefs"
    value = []
    results = SqlRunner.run(sql)
    return results.map {|reef| Reef.new(reef)}
  end

  def Reef.delete_all
    sql = "DELETE FROM reefs"
    results = SqlRunner.run(sql)
  end
end
