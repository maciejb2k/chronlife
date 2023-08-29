puts "Seeding article tags ..."

ArticleTag.create(
  [
    {
      name: "dieta"
    },
    {
      name: "leki"
    },
    {
      name: "suplementy"
    },
    {
      name: "ćwiczenia"
    },
    {
      name: "choroby"
    }
  ]
)

puts "Seeding article tags done."
