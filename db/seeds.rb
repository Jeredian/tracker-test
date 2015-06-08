# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  UserRole.create([
                    {name: 'Admin',admin_panel: true, add_project:true},
                    {name: 'User',admin_panel: false, add_project:false}
                  ])
  User.create([
                {name: 'root',email:'root@root.com', encrypted_password:'root' ,password: 'root',user_role_id:1},
                {name: 'John Doe',email:'user@user.com',encrypted_password:'user', password: 'user',user_role_id:2}
              ])