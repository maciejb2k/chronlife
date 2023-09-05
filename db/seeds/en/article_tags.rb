Rails.logger.debug "Seeding article tags ..."

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

Rails.logger.debug "Seeding article tags done."
