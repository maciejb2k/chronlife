Rails.logger.debug "Seeding users with the data ..."

# User & Account

user = User.new(
  email: "john.doe@gmail.com",
  password: "password",
  password_confirmation: "password",
  tos_agreement: true
)
user.skip_confirmation!
user.save!

account = user.build_account(
  first_name: "John",
  last_name: "Doe",
  username: "john.doe"
)
account.save!

# Diseases

eczema = PredefinedDisease.find_by(name: "atopic dermatitis")
obesity = PredefinedDisease.find_by(name: "overweight")
diabetes = PredefinedDisease.find_by(name: "diabetes")
asthma = PredefinedDisease.find_by(name: "asthma")
hypothyroidism = PredefinedDisease.find_by(name: "hypothyroidism")

diseases_eczema = Disease.create!(
  account:,
  predefined_disease: eczema,
  diagnosed_at: Date.new(2023, 5, 15),
  diagnosed_by_hp: false,
  severity: 3,
  color: "#FF0000"
)

diseases_obesity = Disease.create!(
  account:,
  predefined_disease: obesity,
  diagnosed_at: Date.new(2022, 3, 3),
  diagnosed_by_hp: false,
  severity: 2,
  color: "#FF0000"
)

diseases_diabetes = Disease.create!(
  account:,
  predefined_disease: diabetes,
  diagnosed_at: Date.new(2023, 6, 11),
  diagnosed_by_hp: true,
  severity: 4,
  color: "#FF0000"
)

diseases_asthma = Disease.create!(
  account:,
  predefined_disease: asthma,
  diagnosed_at: Date.new(2021, 2, 18),
  diagnosed_by_hp: true,
  severity: 5,
  color: "#FF0000"
)

diseases_hypothyroidism = Disease.create!(
  account:,
  predefined_disease: hypothyroidism,
  diagnosed_at: Date.new(2018, 5, 9),
  diagnosed_by_hp: true,
  severity: 1,
  color: "#FF0000"
)

# Eczema

diseases_eczema.symptoms.create!(
  [
    {
      predefined_symptom: PredefinedSymptom.find_by(name: "itchiness"),
      description: "Lorem ipsum dolor sit amet.",
      first_noticed_at: Date.new(2023, 5, 15)
    },
    {
      predefined_symptom: PredefinedSymptom.find_by(name: "redness"),
      description: "Lorem ipsum dolor sit amet.",
      first_noticed_at: Date.new(2022, 5, 15)
    },
    {
      predefined_symptom: PredefinedSymptom.find_by(name: "skin dryness"),
      description: "Lorem ipsum dolor sit amet.",
      first_noticed_at: Date.new(2021, 5, 15)
    },
    {
      name: "skin cracking",
      description: "Lorem ipsum dolor sit amet.",
      first_noticed_at: Date.new(2021, 5, 15)
    },
    {
      name: "skin flaking",
      description: "Lorem ipsum dolor sit amet.",
      first_noticed_at: Date.new(2021, 5, 15)
    },
    {
      name: "excessive irritation",
      description: "Lorem ipsum dolor sit amet.",
      first_noticed_at: Date.new(2021, 5, 15)
    },
    {
      name: "hand sweating",
      description: "Lorem ipsum dolor sit amet.",
      first_noticed_at: Date.new(2021, 5, 15)
    }
  ]
)

diseases_eczema.risk_factors.create!(
  [
    {
      name: "dust allergy",
      description: "Lorem ipsum dolor sit amet.",
      severity: rand(1..5)
    },
    {
      name: "animal dander allergy",
      description: "Lorem ipsum dolor sit amet.",
      severity: rand(1..5)
    },
    {
      name: "plant pollen allergy",
      description: "Lorem ipsum dolor sit amet.",
      severity: rand(1..5)
    },
    {
      name: "peanut allergy",
      description: "Lorem ipsum dolor sit amet.",
      severity: rand(1..5)
    },
    {
      name: "low air humidity",
      description: "Lorem ipsum dolor sit amet.",
      severity: rand(1..5)
    },
    {
      name: "excessive hygiene",
      description: "Lorem ipsum dolor sit amet.",
      severity: rand(1..5)
    },
    {
      name: "stress",
      description: "Lorem ipsum dolor sit amet.",
      severity: rand(1..5)
    }
  ]
)

diseases_eczema.statuses.create!(
  [
    {
      content: "Lorem ipsum dolor sit amet.",
      mood: rand(1..3),
      status: "diagnosed"
    },
    {
      content: "Lorem ipsum dolor sit amet.",
      mood: rand(1..3),
      status: "diagnosed"
    },
    {
      content: "Lorem ipsum dolor sit amet.",
      mood: rand(1..3),
      status: "diagnosed"
    }
  ]
)

account.treatments.create!(
  [
    {
      title: "Ketogenic Diet",
      description: "Lorem ipsum dolor sit amet.",
      start_date: Date.new(2023, 5, 15),
      effectiveness: rand(1..5)
    },
    {
      title: "Sea Salt Inhalation",
      description: "Lorem ipsum dolor sit amet.",
      start_date: Date.new(2023, 5, 15),
      effectiveness: rand(1..5)
    },
    {
      title: "Meditation",
      description: "Lorem ipsum dolor sit amet.",
      start_date: Date.new(2023, 5, 15),
      effectiveness: rand(1..5)
    },
    {
      title: "Ashwagandha Supplementation",
      description: "Lorem ipsum dolor sit amet.",
      start_date: Date.new(2023, 5, 15),
      effectiveness: rand(1..5)
    },
    {
      title: "CBD Oil Therapy",
      description: "Lorem ipsum dolor sit amet.",
      start_date: Date.new(2023, 5, 15),
      effectiveness: rand(1..5)
    }
  ]
)

treatments = account.treatments

treatments[0].diseases << diseases_obesity
treatments[0].diseases << diseases_diabetes
treatments[0].diseases << diseases_hypothyroidism
treatments[0].updates.create!(
  [
    {
      name: "-5kg Down",
      description: "I see the first effects of the diet. I've already lost 5kg!",
      status: "improvement",
      update_date: Date.new(2023, 5, 17)
    },
    {
      name: "Today's Cooking",
      description: "Today I cooked scrambled eggs with clarified butter. They were delicious!",
      status: "no_change",
      update_date: Date.new(2023, 5, 16)
    },
    {
      name: "Diet Initiation",
      description: "Today I started the ketogenic diet. I hope it will help me in the fight against obesity.",
      status: "no_change",
      update_date: Date.new(2023, 5, 15)
    }
  ]
)

treatments[1].diseases << diseases_asthma
treatments[1].updates.create!(
  [
    {
      name: "Stable Lately",
      description: "I see the first effects of the diet. I've already lost 5kg!",
      status: "no_change",
      update_date: Date.new(2023, 5, 17)
    },
    {
      name: "Feeling Better Today",
      description: "Today I'm feeling a bit better. I hope it's not just a temporary improvement.",
      status: "improvement",
      update_date: Date.new(2023, 5, 16)
    },
    {
      name: "Significant Worsening",
      description: "Today I feel really bad. I'm having trouble breathing. I don't know what's happening.",
      status: "worsening",
      update_date: Date.new(2023, 5, 15)
    }
  ]
)

treatments[2].diseases << diseases_hypothyroidism
treatments[2].diseases << diseases_asthma
treatments[2].updates.create!(
  [
    {
      name: "Deep Relaxation",
      description: "I feel much better after a 30-minute meditation session. I had a deep sleep because of it.",
      status: "improvement",
      update_date: Date.new(2023, 5, 17)
    },
    {
      name: "Stable Condition",
      description: "Today I'm feeling stable. I hope things will get better over time.",
      status: "no_change",
      update_date: Date.new(2023, 5, 16)
    },
    {
      name: "Strong Anxiety",
      description: "After today's meditation session, I feel really bad. I was literally terrified during the meditation.",
      status: "worsening",
      update_date: Date.new(2023, 5, 15)
    }
  ]
)

treatments[3].diseases << diseases_hypothyroidism
treatments[3].diseases << diseases_eczema
treatments[3].updates.create!(
  [
    {
      name: "Deeper Sleep",
      description: "Thanks to Ashwagandha, I had a deeper sleep. I feel well-rested.",
      status: "improvement",
      update_date: Date.new(2023, 5, 17)
    },
    {
      name: "Nausea",
      description: "Today I'm feeling really bad. I have nausea and abdominal pain. I don't know what's going on.",
      status: "worsening",
      update_date: Date.new(2023, 5, 17)
    }
  ]
)

treatments[4].diseases << diseases_hypothyroidism
treatments[4].diseases << diseases_diabetes
treatments[4].diseases << diseases_eczema
treatments[4].updates.create!(
  [
    {
      name: "Changes After a Week",
      description: "After a week of using CBD oil, I feel better. I hope it's not just a temporary improvement.",
      status: "no_change",
      update_date: Date.new(2023, 5, 17)
    },
    {
      name: "Improved Sleep",
      description: "Thanks to Ashwagandha, I had a deeper sleep. I feel well-rested.",
      status: "improvement",
      update_date: Date.new(2023, 5, 17)
    },
    {
      name: "Skin Improvement",
      description: "Today I'm feeling better. My skin is less dry and less itchy.",
      status: "improvement",
      update_date: Date.new(2023, 5, 16)
    }
  ]
)

Rails.logger.debug "Seeding users with the data done."
