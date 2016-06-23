# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Information.create(name:'home', edit_title:'Modification de l\'accueil', show_title:'Bienvenue à la pharmacie', content:'Bienvenue à la pharmacie.')
Information.create(name:'charter', edit_title:'Modification de la charte de qualité', show_title:'Charte de qualité', content:'Ceci est la charte de qualité')
Information.create(name:'schedule', edit_title:'Modification des horaires', show_title:'Horaires', content:'Horaires')
Information.create(name:'map', edit_title: "Modification de l'adresse", show_title: 'Nous trouver', content: '8 rue de la Tour Eiffel')