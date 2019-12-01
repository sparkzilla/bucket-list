require_relative('../db/sql_runner')

class City

  attr_accessor :name
  attr_reader :id

  def initialize(options)
      @id = options['id'].to_i() if options['id']
      @name = options['name']
  end

  def save()
    sql = "INSERT INTO cities (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all
    sql = "DELETE FROM cities"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM cities"
    results = SqlRunner.run(sql)
    return results.map { |city| City.new(city) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM cities
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return City.new(results.first)
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM cities
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
