# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Task.destroy_all
Project.destroy_all
User.destroy_all

@vlad = User.create!([
  {
    email: 'vl.berezhnoi@gmail.com',
    password: '12345678',
    password_confirmation: '12345678'
  }
])

@testuser = User.create!([
  {
    email: 'test@test.test',
    password: '12345678',
    password_confirmation: '12345678'
  }
])

p "Created #{User.count} user!"

projects = [
  {
    name: 'My first Project',
    user_id: User.first.id
  },

  {
    name: 'My second Project',
    user_id: User.first.id
  },

  {
    name: 'My third Project',
    user_id: User.first.id
  }
]

Project.create!(projects)
p "Created #{Project.count} projects!"

tasks = [
  {
    name: 'My first task for first project',
    status: false,
    position: 1,
    project_id: Project.first.id
  },

  {
    name: 'My second task for first project',
    status: false,
    position: 2,
    project_id: Project.first.id
  },

  {
    name: 'My third task for first project',
    status: false,
    position: 3,
    project_id: Project.first.id
  },

  {
    name: 'My first task for second project',
    status: false,
    position: 1,
    project_id: Project.second.id
  },

  {
    name: 'My second task for second project',
    status: false,
    position: 2,
    project_id: Project.second.id
  }
]

Task.create!(tasks)
p "Created #{Task.count} tasks!"