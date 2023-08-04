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
