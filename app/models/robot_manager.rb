require 'yaml/store'
require 'sequel'

class RobotManager

  def self.database
    if ENV["ROBOT_MANAGER_ENV"] == 'test'
      @database ||= Sequel.sqlite("db/robot_manager_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_manager_development.sqlite3")
    end
  end

  def self.create(robot)
         data = {"name" => robot[:name],
                 "city" => robot[:city],
                "state"=> robot[:state],
              "avatar"=> robot[:avatar],
       "birthdate" => robot[:birthdate],
       "datehired" => robot[:datehired],
     "department" => robot[:department]
    }
    database.from(:robots).insert(data)
  end

  def self.all
    database.from(:robots).all.map do |robot|
      Robot.new(robot)
    end
  end

  def self.find(id)
    robot = database.from(:robots).find(id).first
    Robot.new(robot)
  end

  def self.update(id, robot)
      database.from(:robots).where([:id => id]).update(
      :name     =>   robot[:name],
      :city     =>   robot[:city],
      :state    =>   robot[:state],
      :avatar   =>   robot[:avatar],
      :birthdate =>  robot[:birthdate],
      :datehired =>  robot[:datehired],
      :department => robot[:department])
  end

  def self.delete(id)
    database.from(:robots).where(:id => id).delete
  end 
  
  def self.delete_all
    database.from(:robots).delete
  end
end