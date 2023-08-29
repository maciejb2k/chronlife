puts "Seeding article tags ..."

ArticleTag.create(
  [
    {
      name: "diet"
    },
    {
      name: "medications"
    },
    {
      name: "supplements"
    },
    {
      name: "exercises"
    },
    {
      name: "diseases"
    }
  ]
)

puts "Seeding article tags done."
