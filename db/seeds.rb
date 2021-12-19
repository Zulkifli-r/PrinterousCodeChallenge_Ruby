require 'bcrypt'

user = User.new
user.name = 'Super Admin'
user.email = 'super@admin.com'
user.admin = true
user.password = 'password'
user.password_confirmation = 'password'
user.save!