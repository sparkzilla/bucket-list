require_relative('../db/sql_runner')

class Sight

  attr_accessor :name, :status, :city_id
  attr_reader :id

  def initialize(options)
      @id = options['id'].to_i() if options['id']
      @name = options['name']
      @status = options['status']
      @city_id = options['city_id'].to_i()
  end

  def save()
    sql = "INSERT INTO sights (name, status, city_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @status, @city_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all
    sql = "DELETE FROM sights"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM sights ORDER BY city_id ASC"
    results = SqlRunner.run(sql)
    return results.map { |sight| Sight.new(sight) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM sights
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Sight.new(results.first)
  end

  def self.find_by_status(status)
    sql = "SELECT * FROM sights
    WHERE status = $1"
    values = [status]
    results = SqlRunner.run(sql, values)
    return results.map { |sight| Sight.new(sight) }
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM sights
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  #Find the city a sight is in, as an object

  def city()
      sql = "SELECT * FROM cities
      WHERE id = $1"
      values = [@city_id]
      result = SqlRunner.run(sql, values)
      return City.new(result.first)
  end

end
