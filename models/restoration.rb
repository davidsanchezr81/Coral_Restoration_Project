require_relative("../db/sql_runner.rb")
require_relative("coral.rb")
require_relative("reef.rb")

class Restoration

  attr_reader(:id, :coral_id ,:reef_id )

  def initialize(options)
    @id = options['id'].to_i
    @coral_id = options['coral_id'].to_i
    @reef_id= options['reef_id'].to_i
  end

  def save()
    sql = "INSERT INTO restorations
    ( coral_id,
      reef_id
    )
    VALUES
    ($1,$2)
    RETURNING id"
    values = [@coral_id, @reef_id]
    results =SqlRunner.run(sql, values).first
    @id = results['id'].to_i
  end
  #

    def coral()
    sql = "SELECT * FROM corals
    WHERE id = $1"
    values = [@coral_id]
    results = SqlRunner.run( sql, values )
    return Coral.new( results.first )
  end

  def reef()
    sql = "SELECT * FROM reefs
    WHERE id = $1"
    values = [@reef_id]
    results = SqlRunner.run( sql, values )
    return Reef.new( results.first )
  end

  def Restoration.all
    sql = "SELECT * FROM restorations"
    results = SqlRunner.run(sql)
    return results.map {|restore| Restoration.new(restore)}
  end
  #
  def Restoration.delete_all
    sql = "DELETE FROM restorations"
    results = SqlRunner.run(sql)
  end
end
