require_relative('../db/sql_runner')

class Visit

  attr_accessor :user_id, :sight_id, :status, :id

  def initialize(options)
      @id = options['id'].to_i() if options['id']
      @user_id = options['user_id'].to_i
      @sight_id = options['sight_id'].to_i
      @status = options['status']
  end

  def save()
    sql = "INSERT INTO visits (user_id, sight_id, status) VALUES ($1, $2, $3) RETURNING id"
    values = [@user_id, @sight_id, @status]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all
    sql = "DELETE FROM visits"
    SqlRunner.run(sql)
  end

end
