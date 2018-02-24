require_relative("../db/sql_runner.rb")

class Reef

  attr_reader(:id, :name ,:location )

  def initialize(options)
    @id = options['id'].to_i
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


  def Reef.all
    sql = "SELECT * FROM reefs"
    results = SqlRunner.run(sql)
    return results.map {|reef| Reef.new(reef)}
  end

  def Reef.delete_all
    sql = "DELETE FROM reefs"
    results = SqlRunner.run(sql)
  end
end
