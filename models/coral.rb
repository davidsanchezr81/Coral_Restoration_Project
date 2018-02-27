require_relative("../db/sql_runner.rb")

class Coral

  attr_reader(:id, :reef_id )
  attr_accessor(:name, :species, :plant_date, :status )

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @species = options['species']
    @name = options['name']
    @plant_date = options['plantdate']
    @status = options['status']
    @reef_id = options['reef_id'].to_i
  end

  def save()
    sql = "INSERT INTO corals
    ( species,
      name,
      plantdate,
      status,
      reef_id
    )
    VALUES
    ($1,$2, $3, $4, $5)
    RETURNING id"
    values = [@species, @name, @plant_date, @status, @reef_id]
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

  def update()
    sql = "UPDATE corals
    SET
    (
      species,
      name,
      plantdate,
      status
      ) =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5"
      values = [@species, @name, @plant_date, @status, @id]
      SqlRunner.run( sql, values )
    end

    def delete()
      sql = "DELETE FROM corals
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
    end

    def Coral.find(id)
      sql = "SELECT * FROM corals WHERE id = '#{id}'"
      result = SqlRunner.run(sql).first
      return Coral.new(result)
    end


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
