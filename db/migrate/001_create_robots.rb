require_relative '../../app/models/robot_manager'

environments = %w(development test)

environments.each do |env|
  Sequel.sqlite("db/robot_manager_#{env}.sqlite3").create_table :robots do 
    primary_key :id
    String :name
    String :city
    String :state
    String :avatar
    String :birthdate
    String :datehired
    String :department
  end
end