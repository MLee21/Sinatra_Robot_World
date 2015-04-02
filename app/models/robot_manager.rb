require 'yaml/store'

class RobotManager

  def self.database
    if ENV["ROBOT_MANAGER_ENV"] == 'test'
      @database ||= YAML::Store.new("db/robot_manager_test")
    else
      @database ||= YAML::Store.new("db/robot_manager")
    end
  end

  def self.create(robot)
    database.transaction do 
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << { "id" => database['total'], 
                                 "name" => robot[:name],
                                 "city" => robot[:city],
                                "state"=> robot[:state],
                              "avatar"=> robot[:avatar],
                       "birthdate" => robot[:birthdate],
                       "datehired" => robot[:datehired],
                     "department" => robot[:department]
      }
    end
  end

  def self.robots
    database.transaction do 
      database['robots'] || []
    end
  end

  def self.all
    robots.map { |robot| Robot.new(robot) }
  end

  def self.robot(id)
    robots.find { |robot| robot["id"] == id }
  end

  def self.find(id)
    Robot.new(robot(id))
  end

  def self.update(id, robot)
    database.transaction do
      target = database['robots'].find { |data| data["id"] == id }
      target["name"]       = robot[:name]
      target["city"]       = robot[:city]
      target["state"]      = robot[:state]
      target["avatar"]     = robot[:avatar]
      target["birthdate"]  = robot[:birthdate]
      target["datehired"]  = robot[:datehired]
      target["department"] = robot[:department]
    end
  end

  def self.delete(id)
    database.transaction do 
      database['robots'].delete_if { |robot| robot["id"] == id }
    end
  end

  def self.delete_all
    database.transaction do
      database['robots'] = []
      database['total'] = 0
    end
  end
end