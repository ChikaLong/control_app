# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FoodCategory.create!(
  [
    {name: '米'},
    {name: '麺'},
    {name: 'パン'},
    {name: '菓子類'},
    {name: '肉類'},
    {name: '野菜類'},
    {name: '魚類'},
    {name: '卵類'},
    {name: '乳製品'},
    {name: '乾物'},
    {name: '調味料'},
    {name: '缶詰'},
    {name: 'インスタント'},
    {name: 'レトルト'},
    {name: 'ジャム'},
    {name: '調味料'},
    {name: '冷凍食品'},
    {name: '惣菜'},
    {name: 'その他'}
  ]
)