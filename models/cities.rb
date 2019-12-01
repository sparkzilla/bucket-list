require_relative('../db/sql_runner')
require_relative('sights')

class City

  attr_accessor :name, :country_id
  attr_reader :id

  def initialize(options)
      @id = options['id'].to_i() if options['id']
      @name = options['name']
      @country_id = options['country_id'].to_i()
  end

  def save()
    sql = "INSERT INTO cities (name, country_id) VALUES ($1, $2) RETURNING id"
    values = [@name, @country_id]
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

  #Find all sights in a city

  def sights()
    sql="SELECT * FROM sights WHERE city_id = $1"
    values = [@id]
    sights = SqlRunner.run(sql, values)
    return sights.map{|city| Sight.new(city)}
  end

  #if city exists return id

  def self.find_by_name_return_id(name)
    begin
      sql = "SELECT * FROM cities
      WHERE name = $1"
      values = [name]
      results = SqlRunner.run(sql, values)
      return results[0]['id'].to_i
    rescue
      return false
    end
  end


end
