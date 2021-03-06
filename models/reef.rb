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
    sql = "SELECT * FROM corals where reef_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|coral| Coral.new(coral) }
  end

  def delete()
    sql = "DELETE FROM reefs
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def Reef.all
    sql = "SELECT * FROM reefs"
    value = []
    results = SqlRunner.run(sql)
    return results.map {|reef| Reef.new(reef)}
  end

  def Reef.find_by_id(id)
    sql = "SELECT * FROM reefs where id = '#{id}'"
    result = SqlRunner.run(sql).first
    return Reef.new(result)
  end



  def Reef.delete_all
    sql = "DELETE FROM reefs"
    results = SqlRunner.run(sql)
  end
end
