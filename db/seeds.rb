# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
roles = Role.create([{ name: "admin"}, { name: "account owner"}, { name: "manager"}, { name: "counselor"} ])
