Rails.logger.info "[ChronLife] Seeding..."

PredefinedDisease.create(
  [
    {
      name: "atopowe zapalenie skóry",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "stwardnienie rozsiane",
      description: "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet."
    },
    {
      name: "nadwaga",
      description: "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet."
    },
    {
      name: "cukrzyca",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "niewydolność serca",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "osteoporoza",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "nadciśnienie tętnicze",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "niedoczynność tarczycy",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "astma",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "celiakia",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "łuszczyca",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "choroba leśniowskiego-crohna",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "choroba parkinsona",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "endometrioza",
      description: "Lorem ipsum dolor sit amet."
    }
  ]
)

# AZS

azs = PredefinedDisease.find_by(name: "atopowe zapalenie skóry")

azs.predefined_symptoms.create(
  [
    {
      name: "swędzenie",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "zaczerwienienie",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "suchość skóry",
      description: "Lorem ipsum dolor sit amet."
    }
  ]
)

Rails.logger.info "[ChronLife] Seeding done."
