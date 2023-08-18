puts "Seeding users with the data ..."

# User & Account

user = User.new(
  email: "tomasz.nowak@gmail.com",
  password: "password",
  password_confirmation: "password"
)
user.skip_confirmation!
user.save!

account = user.build_account(
  first_name: "Tomasz",
  last_name: "Nowak",
  username: "tomasznowak"
)
account.save!

# Diseases

eczema = PredefinedDisease.find_by(name: "atopowe zapalenie skóry")
obesity = PredefinedDisease.find_by(name: "nadwaga")
diabetes = PredefinedDisease.find_by(name: "cukrzyca")
asthma = PredefinedDisease.find_by(name: "astma")
hypothyroidism = PredefinedDisease.find_by(name: "niedoczynność tarczycy")

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
      predefined_symptom: PredefinedSymptom.find_by(name: "swędzenie"),
      description: "Lorem ipsum dolor sit amet.",
      first_noticed_at: Date.new(2023, 5, 15)
    },
    {
      predefined_symptom: PredefinedSymptom.find_by(name: "zaczerwienienie"),
      description: "Lorem ipsum dolor sit amet.",
      first_noticed_at: Date.new(2022, 5, 15)
    },
    {
      predefined_symptom: PredefinedSymptom.find_by(name: "suchość skóry"),
      description: "Lorem ipsum dolor sit amet.",
      first_noticed_at: Date.new(2021, 5, 15)
    },
    {
      name: "pękanie skóry",
      description: "Lorem ipsum dolor sit amet.",
      first_noticed_at: Date.new(2021, 5, 15)
    },
    {
      name: "łuszczenie się skóry",
      description: "Lorem ipsum dolor sit amet.",
      first_noticed_at: Date.new(2021, 5, 15)
    },
    {
      name: "nadmierne rozdrażnienie",
      description: "Lorem ipsum dolor sit amet.",
      first_noticed_at: Date.new(2021, 5, 15)
    },
    {
      name: "potliwość dłoni",
      description: "Lorem ipsum dolor sit amet.",
      first_noticed_at: Date.new(2021, 5, 15)
    }
  ]
)

diseases_eczema.risk_factors.create!(
  [
    {
      name: "alergia na kurz",
      description: "Lorem ipsum dolor sit amet.",
      severity: rand(1..5)
    },
    {
      name: "alergia na sierść zwierząt",
      description: "Lorem ipsum dolor sit amet.",
      severity: rand(1..5)
    },
    {
      name: "alergia na pyłki roślin",
      description: "Lorem ipsum dolor sit amet.",
      severity: rand(1..5)
    },
    {
      name: "orzechy ziemne",
      description: "Lorem ipsum dolor sit amet.",
      severity: rand(1..5)
    },
    {
      name: "niska wilgotność powietrza",
      description: "Lorem ipsum dolor sit amet.",
      severity: rand(1..5)
    },
    {
      name: "nadmierna higiena",
      description: "Lorem ipsum dolor sit amet.",
      severity: rand(1..5)
    },
    {
      name: "stres",
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
      title: "Dieta ketogeniczna",
      description: "Lorem ipsum dolor sit amet.",
      start_date: Date.new(2023, 5, 15),
      effectiveness: rand(1..5)
    },
    {
      title: "Inhalacja z soli morskiej",
      description: "Lorem ipsum dolor sit amet.",
      start_date: Date.new(2023, 5, 15),
      effectiveness: rand(1..5)
    },
    {
      title: "Medytacja",
      description: "Lorem ipsum dolor sit amet.",
      start_date: Date.new(2023, 5, 15),
      effectiveness: rand(1..5)
    },
    {
      title: "Suplementacja Ashwagandhą",
      description: "Lorem ipsum dolor sit amet.",
      start_date: Date.new(2023, 5, 15),
      effectiveness: rand(1..5)
    },
    {
      title: "Terapia olejkiem CBD",
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
      name: "-5kg w dół",
      description: "Widzę pierwsze efekty diety. Schudłem już 5kg!",
      status: "improvement",
      update_date: Date.new(2023, 5, 17)
    },
    {
      name: "Co dziś ugotowałem",
      description: "Dzisiaj ugotowałem sobie jajka sadzone na maśle klarowanym. Były pyszne!",
      status: "no_change",
      update_date: Date.new(2023, 5, 16)
    },
    {
      name: "Rozpoczęcie diety",
      description: "Dzisiaj rozpocząłem dietę ketogeniczną. Mam nadzieję, że pomoże mi ona w walce z otyłością.",
      status: "no_change",
      update_date: Date.new(2023, 5, 15)
    }
  ]
)

treatments[1].diseases << diseases_asthma
treatments[1].updates.create!(
  [
    {
      name: "Ostatnio jest stabilnie",
      description: "Widzę pierwsze efekty diety. Schudłem już 5kg!",
      status: "no_change",
      update_date: Date.new(2023, 5, 17)
    },
    {
      name: "Dziś trochę lepiej",
      description: "Dzisiaj czuję się trochę lepiej. Mam nadzieję, że to nie tylko chwilowa poprawa.",
      status: "improvement",
      update_date: Date.new(2023, 5, 16)
    },
    {
      name: "Znaczne pogorszenie",
      description: "Dzisiaj czuję się bardzo źle. Mam problemy z oddychaniem. Nie wiem, co się dzieje.",
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
      name: "Duży relaks",
      description: "Czuję się o wiele lepiej po 30 minutach medytacji. Miałem dzięki temu głęboki sen.",
      status: "improvement",
      update_date: Date.new(2023, 5, 17)
    },
    {
      name: "Jest stabilnie",
      description: "Dzisiaj czuję się stabilnie. Mam nadzieję, że z czasem będzie coraz lepiej.",
      status: "no_change",
      update_date: Date.new(2023, 5, 16)
    },
    {
      name: "Duży strach",
      description: "Po dzisiejszej sesji medytacji czuję się bardzo źle. Byłem dosłownie przerażony w trakcie medytacji.",
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
      name: "Głębszy sen",
      description: "Dzięki Ashwagandzie miałem głębszy sen. Czuję się wypoczęty.",
      status: "improvement",
      update_date: Date.new(2023, 5, 17)
    },
    {
      name: "Mdłości",
      description: "Dziś czuję się bardzo źle. Mam mdłości i bóle brzucha. Nie wiem, co się dzieje.",
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
      name: "Zmiany po tygodniu",
      description: "Po tygodniu stosowania olejku CBD czuję się lepiej. Mam nadzieję, że to nie tylko chwilowa poprawa.",
      status: "no_change",
      update_date: Date.new(2023, 5, 17)
    },
    {
      name: "Polepszenie snu",
      description: "Dzięki Ashwagandzie miałem głębszy sen. Czuję się wypoczęty.",
      status: "improvement",
      update_date: Date.new(2023, 5, 17)
    },
    {
      name: "Polepszenie skóry",
      description: "Dziś czuję się lepiej. Moja skóra jest mniej sucha i mniej swędzi.",
      status: "improvement",
      update_date: Date.new(2023, 5, 16)
    }
  ]
)

puts "Seeding users with the data done."
