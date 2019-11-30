require_relative('../db/sql_runner')

class User

  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(options)
      @id = options['id'].to_i() if options['id']
      @first_name = options['first_name']
      @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO users (first_name, last_name) VALUES ($1, $2) RETURNING id"
    values = [@first_name, @last_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all
    sql = "DELETE FROM users"
    SqlRunner.run(sql)
  end

  def sights_all
    sql ="SELECT sights.*
    FROM sights
    INNER JOIN visits
    ON visits.sight_id = sights.id
    WHERE user_id = $1;"
    values = [@id]
    sights = SqlRunner.run(sql, values)
    result = sights.map { |sight| Sight.new(sight) }
    return result
  end

  def sights_visited
    sql ="SELECT sights.*
    FROM sights
    INNER JOIN visits
    ON visits.sight_id = sights.id
    WHERE user_id = $1 AND status = 'visited';"
    values = [@id]
    sights = SqlRunner.run(sql, values)
    result = sights.map { |sight| Sight.new(sight) }
    return result
  end

  def sights_bucketed
    sql ="SELECT sights.*
    FROM sights
    INNER JOIN visits
    ON visits.sight_id = sights.id
    WHERE user_id = $1 AND status = 'bucket';"
    values = [@id]
    sights = SqlRunner.run(sql, values)
    result = sights.map { |sight| Sight.new(sight) }
    return result
  end

end
