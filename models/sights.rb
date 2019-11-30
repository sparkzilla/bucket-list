require_relative('../db/sql_runner')
require_relative('users')

class Sight

  attr_accessor :name
  attr_reader :id, :user_id

  def initialize(options)
      @id = options['id'].to_i() if options['id']
      @name = options['name']
      @user_id = options['user_id'].to_i()
  end

  def save()
    sql = "INSERT INTO sights (name, user_id) VALUES ($1, $2) RETURNING id"
    values = [@name, @user_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all
    sql = "DELETE FROM sights"
    SqlRunner.run(sql)
  end

end
