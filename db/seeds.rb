# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Insert hierarchy default elements
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

# Insert card_staus default elements 
CardStatus.destroy_all

CardStatus.create!([
    {describe: "PRINTED"}, 
    {describe: "USING"}
  ])

p "Created #{CardStatus.count} card_statuses"

# Insert military exemples
Military.destroy_all

h1 = Hierarchy.find_by_acronym("CB")
h2 = Hierarchy.find_by_acronym("SD")

Military.create!([
    {name: "ABELHINHA", identification: "11111111", hierarchy: h1, father_name: "ZANGÃO", mother_name: "ABELHA RAINHA", born_date: DateTime.now, registration: "1111111", naturalness: "RECIFE-PE", vote_number: "111111111111", vote_zone:"111", vote_section: "111", cpf: "11111111111", digital_factor: "D9999E9999", blood_type: 1, blood_factor: 1, carry_weapon: false },
    {name: "ABELHUDO", identification: "22222222", hierarchy: h2, father_name: "ZANGÃO", mother_name: "ABELHA RAINHA", born_date: DateTime.now, registration: "2222222", naturalness: "RECIFE-PE", vote_number: "222222222222", vote_zone:"222", vote_section: "222", cpf: "22222222222", digital_factor: "D8888E8888", blood_type: 2, blood_factor: 2, carry_weapon: true }
  ])

p "Created #{Military.count} militaries"