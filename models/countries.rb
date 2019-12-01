require_relative('../db/sql_runner')
require_relative('sights')
require_relative('countries')


class Country

  attr_accessor :name
  attr_reader :id

  def initialize(options)
      @id = options['id'].to_i() if options['id']
      @name = options['name']
  end

  def save()
    sql = "INSERT INTO countries (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all
    sql = "DELETE FROM countries"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM countries"
    results = SqlRunner.run(sql)
    return results.map { |country| Country.new(country) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM countries
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Country.new(results.first)
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM countries
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  #Find all cities in a country

  def cities()
    sql="SELECT * FROM cities WHERE country_id = $1"
    values = [@id]
    cities = SqlRunner.run(sql, values)
    return cities.map{|city| City.new(city)}
  end

  #if country exists return id

  def self.find_by_name_return_id(name)
    begin
      sql = "SELECT * FROM countries
      WHERE name = $1"
      values = [name]
      results = SqlRunner.run(sql, values)
      return results[0]['id'].to_i
    rescue
      return false
    end
  end

  #Find the country a city is in, as an object

  def city()
      sql = "SELECT * FROM countries
      WHERE id = $1"
      values = [@country_id]
      result = SqlRunner.run(sql, values)
      return Country.new(result.first)
  end


end
