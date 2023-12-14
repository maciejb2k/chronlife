Rails.logger.debug "Seeding predefined diseases ..."

PredefinedDisease.create(
  [
    {
      name: "atopic dermatitis",
      description: "A skin condition characterized by rashes and itching."
    },
    {
      name: "multiple sclerosis",
      description: "A neurological disease causing damage to the myelin sheath of nerves."
    },
    {
      name: "overweight",
      description: "A condition related to an excessive amount of body fat."
    },
    {
      name: "diabetes",
      description: "A metabolic disease affecting the blood sugar level."
    },
    {
      name: "heart failure",
      description: "A condition in which the heart cannot pump blood effectively enough."
    },
    {
      name: "osteoporosis",
      description: "A bone disease characterized by a loss of bone mass."
    },
    {
      name: "hypertension",
      description: "High blood pressure, increasing the risk of heart diseases."
    },
    {
      name: "hypothyroidism",
      description: "A condition in which the thyroid gland doesn't produce enough hormones."
    },
    {
      name: "asthma",
      description: "A respiratory disease causing bronchial spasms."
    },
    {
      name: "celiac disease",
      description: "An intestinal disease that hinders gluten digestion."
    },
    {
      name: "psoriasis",
      description: "A skin condition characterized by patches and scales."
    },
    {
      name: "crohns disease",
      description: "A chronic inflammatory bowel disease."
    },
    {
      name: "parkinsons disease",
      description: "A neurodegenerative disease affecting movement control."
    },
    {
      name: "endometriosis",
      description: "A gynecological condition where uterine tissue grows outside the uterus."
    }
  ]
)

Rails.logger.debug "Seeding predefined diseases done."
