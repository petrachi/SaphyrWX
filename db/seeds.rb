# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Path.create [
  {title: 'Saphyr Concepts', tag: 'saphyr-concepts'},
  {title: 'Saphyr Compiler', tag: 'saphyr-compiler'},
  {title: 'Ruby Challenges', tag: 'ruby-challenges'},
]

Video.create [
  {title: 'Video #1', brief: 'Cette video est vraiment chouettos', embed: 'a6cBdeUpVt4', path: Path['saphyr-concepts']},
  {title: 'Video #2', brief: 'Cette video est vraiment chouettos', embed: 'pofjHEBRwgE', path: Path['saphyr-compiler']}
]
