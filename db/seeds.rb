# Only want this to run in development
if Rails.env == "development"
  params = { name: "default name", description: "description name", users_attributes: [role: "admin", email: "admin@safetyhub", password: "password", password_confirmation: "password"] }
  organisation = Organisation.create(params)
  organisation.users.create({email:"staff@safetyhub", password: "password", password_confirmation: "password"})
end