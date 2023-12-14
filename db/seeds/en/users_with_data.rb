Rails.logger.debug "Seeding users with the data ..."

EXAMPLE_STATUSES = [
  "Today I'm in a great mood, feeling healthy and full of energy.",
  "Unfortunately, today I'm a bit tired, but I hope it will pass quickly.",
  "I've started a new diet and I feel great!",
  "I'm grateful for my health and the ability to be physically active.",
  "Today I'm full of vigor, ready for new challenges.",
  "The sun is shining, which improves both mood and health.",
  "My body signals that it needs some rest.",
  "It's worth taking care of health, it's our greatest treasure.",
  "Today passed without any health problems.",
  "Health is the most important, let's remember it every day.",
  "I feel relaxed after a long walk in the fresh air.",
  "Regular physical activity has a beneficial impact on health.",
  "It's good to understand your body and respond to its signals.",
  "Mental health is as important as physical health, let's take care of both.",
  "Today is a day without stress and nerves - mental health is worth its weight in gold.",
  "Eating full of vitamins and minerals is key to good condition.",
  "Time for a moment of relaxation and body regeneration.",
  "I'm glad I can enjoy health and physical activity.",
  "I feel comfortable in my own skin - healthy body, healthy mind.",
  "It's never too late to take care of a healthy lifestyle.",
  "Every day is an opportunity to improve health and well-being.",
  "Today I'm full of gratitude for my health.",
  "Health is wealth that money can't buy.",
  "Rest and sleep are key to maintaining good condition.",
  "I'm ready for a new day, full of energy and health.",
  "Health is the foundation on which we build our lives.",
  "Feeling good is the most important.",
  "A healthy mind is the key to happiness and a good quality of life.",
  "Today I have enough energy to achieve my goals."
].freeze

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

# Account Friends with sample posts to show on the account dashboard

account_friends = Account.where.not(id: account.id).sample(5)

account_friends.each do |friend|
  account.friends << friend

  friend.diseases.all.sample.statuses.create!(
    [
      {
        content: EXAMPLE_STATUSES.sample,
        mood: rand(1..3),
        status: "diagnosed"
      },
      {
        content: EXAMPLE_STATUSES.sample,
        mood: rand(1..3),
        status: "diagnosed"
      }
    ]
  )
end

# Account Diseases

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
      description: "Itching is a common symptom of eczema, which can be very bothersome."
    },
    {
      predefined_symptom: PredefinedSymptom.find_by(name: "redness"),
      description: "Skin redness is one of the symptoms of eczema, occurring in areas with skin changes."
    },
    {
      predefined_symptom: PredefinedSymptom.find_by(name: "skin dryness"),
      description: "Dry skin is a common symptom of eczema, leading to skin flaking."
    },
    {
      name: "skin cracking",
      description: "Skin cracking can occur as a result of eczema, especially in areas affected by skin changes."
    },
    {
      name: "skin flaking",
      description: "Skin flaking is a characteristic symptom of eczema, causing the appearance of silvery scales."
    },
    {
      name: "excessive irritation",
      description: "Excessive skin irritation is the effect of inflammation caused by eczema."
    },
    {
      name: "sweaty palms",
      description: "Palmar sweating may be increased in patients with eczema, especially in stressful situations."
    }
  ]
)

single_symptom = diseases_eczema.symptoms.find_by(predefined_symptom: PredefinedSymptom.find_by(name: "itching"))

7.times do |n|
  single_symptom.updates.create!(
    {
      intensity: rand(1..5),
      update_date: DateTime.now - n.days
    }
  )
end

diseases_eczema.risk_factors.create!(
  [
    {
      name: "dust allergy",
      description: "Dust allergy is one of the risk factors for developing eczema."
    },
    {
      name: "pet dander allergy",
      description: "Pet dander allergy may increase the risk of developing eczema in susceptible individuals."
    },
    {
      name: "plant pollen allergy",
      description: "Plant pollen allergy may be associated with the development of eczema in some patients."
    },
    {
      name: "peanut allergy",
      description: "Peanut allergy may be related to the occurrence of eczema in some individuals."
    },
    {
      name: "low air humidity",
      description: "Low air humidity can affect the exacerbation of eczema symptoms."
    },
    {
      name: "excessive hygiene",
      description: "Excessive skin hygiene can lead to exacerbation of eczema."
    },
    {
      name: "stress",
      description: "Stress can be a triggering factor for eczema symptoms or exacerbate its course."
    }
  ]
)

diseases_eczema.statuses.create!(
  [
    {
      content: "Itching and redness of the skin are bothersome, but the diagnosis of eczema has been confirmed by a dermatologist.",
      mood: rand(1..3),
      status: "diagnosed"
    },
    {
      content: "I am currently using a steroid cream prescribed by the doctor to reduce the symptoms.",
      mood: rand(1..3),
      status: "diagnosed"
    },
    {
      content: "Eczema is a chronic condition, but I am trying to keep it under control through proper skin care and avoiding risk factors.",
      mood: rand(1..3),
      status: "diagnosed"
    }
  ]
)

account.treatments.create!(
  [
    {
      title: "Ketogenic Diet",
      description: "A ketogenic diet may help reduce skin inflammation in patients with psoriasis.",
      start_date: DateTime.now - rand(1..10).days,
      effectiveness: rand(1..5)
    },
    {
      title: "Sea Salt Inhalation",
      description: "Inhalation with sea salt may provide relief in alleviating symptoms of psoriasis, especially in the respiratory tract.",
      start_date: DateTime.now - rand(1..10).days,
      effectiveness: rand(1..5)
    },
    {
      title: "Meditation",
      description: "Meditation can help reduce stress, which may impact the reduction of psoriasis symptoms.",
      start_date: DateTime.now - rand(1..10).days,
      effectiveness: rand(1..5)
    },
    {
      title: "Ashwagandha Supplementation",
      description: "Ashwagandha is an herb that may have anti-inflammatory properties and help alleviate psoriasis symptoms.",
      start_date: DateTime.now - rand(1..10).days,
      effectiveness: rand(1..5)
    },
    {
      title: "CBD Oil Therapy",
      description: "CBD oil may assist in reducing skin inflammation and itching in patients with psoriasis.",
      start_date: DateTime.now - rand(1..10).days,
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
      name: "-5kg down",
      description: "I see the first effects of the diet. I've already lost 5kg!",
      status: "improvement",
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "What I cooked today",
      description: "Today I cooked myself fried eggs in clarified butter. They were delicious!",
      status: "no_change",
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Starting the diet",
      description: "Today I started a ketogenic diet. I hope it will help me in fighting obesity.",
      status: "no_change",
      update_date: DateTime.now - rand(1..10).days
    }
  ]
)

treatments[1].diseases << diseases_asthma
treatments[1].updates.create!(
  [
    {
      name: "Stable recently",
      description: "I see the first effects of the diet. I've already lost 5kg!",
      status: "no_change",
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Feeling slightly better today",
      description: "Today I feel a bit better. I hope it's not just a temporary improvement.",
      status: "improvement",
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Significant deterioration",
      description: "Today I feel very bad. I'm having trouble breathing. I don't know what's happening.",
      status: "worsening",
      update_date: DateTime.now - rand
    }
  ]
)

treatments[2].diseases << diseases_hypothyroidism
treatments[2].diseases << diseases_asthma
treatments[2].updates.create!(
  [
    {
      name: "Deep relaxation",
      description: "I feel much better after 30 minutes of meditation. I had a deep sleep because of it.",
      status: "improvement",
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Stable condition",
      description: "Today I feel stable. I hope that over time it will get better.",
      status: "no_change",
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Great fear",
      description: "After today's meditation session, I feel very bad. I was literally terrified during meditation.",
      status: "worsening",
      update_date: DateTime.now - rand(1..10).days
    }
  ]
)

treatments[3].diseases << diseases_hypothyroidism
treatments[3].diseases << diseases_eczema
treatments[3].updates.create!(
  [
    {
      name: "Deeper sleep",
      description: "Thanks to Ashwagandha, I had a deeper sleep. I feel rested.",
      status: "improvement",
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Nausea",
      description: "Today I feel very bad. I have nausea and stomach pains. I don't know what's happening.",
      status: "worsening",
      update_date: DateTime.now - rand(1..10).days
    }
  ]
)

treatments[4].diseases << diseases_hypothyroidism
treatments[4].diseases << diseases_diabetes
treatments[4].diseases << diseases_eczema
treatments[4].updates.create!(
  [
    {
      name: "Changes after a week",
      description: "After a week of using CBD oil, I feel better. I hope it's not just a temporary improvement.",
      status: "no_change",
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Improved sleep",
      description: "Thanks to the oil, I had a deeper sleep. I feel rested.",
      status: "improvement",
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Skin improvement",
      description: "Today I feel better. My skin is less dry and less itchy.",
      status: "improvement",
      update_date: DateTime.now - rand(1..10).days
    }
  ]
)

# Measurements

measurement_weight = MeasurementType.find_by(name: "weight")
measurement_sugar = MeasurementType.find_by(name: "sugar")
measurement_heart_beat = MeasurementType.find_by(name: "heart_beat")
measurement_blood_pressure = MeasurementType.find_by(name: "blood_pressure")
measurement_spo2 = MeasurementType.find_by(name: "spo2")

40.times do
  account.measurements.create!(
    [
      {
        measurement_type: measurement_weight,
        value: rand(60..120),
        measurement_date: Faker::Time.backward(days: 30)
      },
      {
        measurement_type: measurement_sugar,
        value: rand(70..99),
        measurement_date: Faker::Time.backward(days: 30)
      },
      {
        measurement_type: measurement_heart_beat,
        value: rand(60..100),
        measurement_date: Faker::Time.backward(days: 30)
      },
      {
        measurement_type: measurement_blood_pressure,
        value: "#{rand(100..139)}/#{rand(60..89)}",
        measurement_date: Faker::Time.backward(days: 30)
      },
      {
        measurement_type: measurement_spo2,
        value: rand(90..100),
        measurement_date: Faker::Time.backward(days: 30)
      }
    ]
  )
end

# Notes

account.note_tags.create!(
  [
    {
      name: "Treatment"
    },
    {
      name: "Diet"
    },
    {
      name: "Others"
    }
  ]
)

account.notes.create!(
  [
    {
      title: "Herbs",
      content: "Herbs are extremely versatile plants that can be used both to improve the taste of food and for medicinal purposes. Often used in herbal medicine, they can help relieve ailments such as stomach aches and insomnia. Examples of herbs include mint, lemon balm, or marjoram.",
      is_pinned: true
    },
    {
      title: "Advice from a Nutritionist",
      content: "Consulting with a nutritionist can help you achieve a healthier diet and maintain a healthy weight. A dietitian can customize an eating plan to meet individual needs, help control caloric intake, and provide guidance on the right combination of nutrients.",
      is_pinned: true
    },
    {
      title: "Gluten-free bread",
      content: "Gluten-free bread is ideal for those suffering from gluten intolerance or celiac disease. It can be prepared from rice flour, potato flour, corn flour or other alternative flours. It is worth paying attention to product labels to make sure they are suitable for people with gluten intolerance."
    },
    {
      title: "Dreams",
      content: "Dreams are a fascinating aspect of human life, full of mystery and meaning. Interpreting dreams can help you understand your own emotions, fears and desires. Different symbols in dreams can have different meanings, so it's a good idea to keep a dream journal to track changes and recurring themes."
    },
    {
      title: "Test interpretation",
      content: "Interpretation of medical test results is crucial to understanding your condition. It is a good idea to consult a doctor or specialist to thoroughly understand the test results, their implications and possible next steps. Failure to understand the results can lead to unnecessary anxiety or neglect of important aspects of health."
    }
  ]
)

# Associate notes with tags

first_tag = account.note_tags.find_by(name: "Treatment")
second_tag = account.note_tags.find_by(name: "Diet")
third_tag = account.note_tags.find_by(name: "Others")

first_note = account.notes.find_by(title: "Herbs")
first_note.tags << first_tag

second_note = account.notes.find_by(title: "Advice from a Nutritionist")
second_note.tags << second_tag

third_note = account.notes.find_by(title: "Gluten-free bread")
third_note.tags << second_tag

fourth_note = account.notes.find_by(title: "Dreams")
fourth_note.tags << third_tag

fifth_note = account.notes.find_by(title: "Test interpretation")
fifth_note.tags << third_tag

Rails.logger.debug "Seeding users with the data done."
