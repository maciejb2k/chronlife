Rails.logger.debug "Seeding article tags ..."

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

Rails.logger.debug "Seeding article tags done."
