# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Hierarchy.destroy_all

Hierarchy.create!([
    {name: "CORONEL", acronym: "CEL", rank: 1}, 
    {name: "TENENTE-CORONEL", acronym: "TC", rank: 2}, 
    {name: "MAJOR", acronym: "MAJ", rank: 3}, 
    {name: "CAPITÃO", acronym: "CAP", rank: 4}, 
    {name: "1º TENENTE", acronym: "1TEN", rank: 5}, 
    {name: "2º TENENTE", acronym: "2TEN", rank: 6}, 
    {name: "ASPIRANTE", acronym: "ASP", rank: 7}, 
    {name: "ALUNO CFOA", acronym: "AL CFOA", rank: 8}, 
    {name: "ALUNO CFO", acronym: "AL CFO", rank: 9}, 
    {name: "SUB-TENENTE", acronym: "SUB TEN", rank: 10}, 
    {name: "1º SARGENTO", acronym: "1º SGT", rank: 11}, 
    {name: "2º SARGENTO", acronym: "2 SGT", rank: 12}, 
    {name: "3º SARGENTO", acronym: "3 SGT", rank: 13}, 
    {name: "ALUNO CFS", acronym: "AL CFS", rank: 14}, 
    {name: "CABO", acronym: "CB", rank: 15}, 
    {name: "ALUNO CFC", acronym: "AL CFC", rank: 16}, 
    {name: "SOLDADO", acronym: "SD", rank: 17}, 
    {name: "ALUNO CFSD", acronym: "AL CFSD", rank: 18}
  ])

  p "Created #{Hierarchy.count} hierarchies"