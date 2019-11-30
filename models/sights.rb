require_relative('../db/sql_runner')

class Sight

  attr_accessor :name, :status
  attr_reader :id

  def initialize(options)
      @id = options['id'].to_i() if options['id']
      @name = options['name']
      @status = options['status']
  end

  def save()
    sql = "INSERT INTO sights (name, status) VALUES ($1, $2) RETURNING id"
    values = [@name, @status]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all
    sql = "DELETE FROM sights"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM sights"
    results = SqlRunner.run(sql)
    return results.map { |sight| Sight.new(sight) }
  end

end
