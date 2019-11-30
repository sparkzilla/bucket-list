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

end
