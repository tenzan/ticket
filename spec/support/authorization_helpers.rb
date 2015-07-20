module AuthorizationHelpers
	def assign_role!(user, role, client)
    	Role.where(user: user, client: client).delete_all
    	Role.create!(user: user, role: role, client: client)
  	end
end

RSpec.configure do |c|
  c.include AuthorizationHelpers
end