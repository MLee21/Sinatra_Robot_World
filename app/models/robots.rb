class Robot

  attr_reader :id,
              :name,
              :city,
              :state,
              :avatar,
              :birthdate,
              :datehired,
              :department

  def initialize(data)
    @id         = data["id"]
    @name       = data["name"]
    @city       = data["city"]
    @state      = data["state"]
    @avatar     = data["avatar"]
    @birthdate  = data["birthdate"]
    @datehired  = data["datehired"]
    @department = data["department"]
  end
end

 # Can you use http://robohash.org/ and/or https://github.com/stympy/faker? 
 # Can you add a dashboard so that we can see statistical robot data? Eg: average robot age, a breakdown of how many robots were hired each year, number of robots in each department/city/state, etc.