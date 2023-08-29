puts "Seeding predefined symptoms ..."

azs = PredefinedDisease.find_by(name: "atopic dermatitis")
azs.predefined_symptoms.create(
  [
    {
      name: "itchiness",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "redness",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "skin dryness",
      description: "Lorem ipsum dolor sit amet."
    }
  ]
)

obesity = PredefinedDisease.find_by(name: "overweight")
obesity.predefined_symptoms.create(
  [
    {
      name: "increased body mass",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "difficulty in maintaining physical activity",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "breathing problems",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "fatigue and lack of energy",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "digestive issues",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "joint pain",
      description: "Lorem ipsum dolor sit amet."
    }
  ]
)

diabetes = PredefinedDisease.find_by(name: "diabetes")
diabetes.predefined_symptoms.create(
  [
    {
      name: "excessive thirst (polydipsia)",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "excessive urination (polyuria)",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "excessive hunger (polyphagia)",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "sudden weight loss",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "fatigue and weakness",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "frequent infections, difficulty in wound healing",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "vision disturbances",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "skin thickening, itching, or dryness",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "trembling hands",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "numbness in hands and feet",
      description: "Lorem ipsum dolor sit amet."
    }
  ]
)

asthma = PredefinedDisease.find_by(name: "asthma")
asthma.predefined_symptoms.create(
  [
    {
      name: "shortness of breath or breathlessness",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "wheezing breath",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "chest wheezing",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "nighttime cough",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "bronchial constriction",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "difficulty in expelling mucus",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "increased bronchial reactivity to stimuli",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "excessive mucus production",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "increased coughing activity in the morning",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "feeling of pressure or tightness in the chest",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "fatigue associated with breathing difficulties",
      description: "Lorem ipsum dolor sit amet."
    }
  ]
)

hypothyroidism = PredefinedDisease.find_by(name: "hypothyroidism")
hypothyroidism.predefined_symptoms.create(
  [
    {
      name: "general fatigue and weakness",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "slower pace of work and mental reactions",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "weight gain",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "increased sensitivity to cold",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "dry skin and hair loss",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "reduced hair on eyebrows and eyelashes",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "slowing of heart rate (bradycardia)",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "memory and concentration problems",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "constipation",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "excessive fatigue",
      description: "Lorem ipsum dolor sit amet."
    }
  ]
)

puts "Seeding predefined symptoms done."
