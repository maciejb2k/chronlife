Rails.logger.debug "Seeding users with the data ..."

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
      description: "Swędzenie to częsty objaw łuszczycy, które może być bardzo dokuczliwe."
    },
    {
      predefined_symptom: PredefinedSymptom.find_by(name: "zaczerwienienie"),
      description: "Zaczerwienienie skóry to jeden z objawów łuszczycy, który występuje w obszarze zmian skórnych."
    },
    {
      predefined_symptom: PredefinedSymptom.find_by(name: "suchość skóry"),
      description: "Suchość skóry jest częstym objawem łuszczycy, co prowadzi do łuszczenia się skóry."
    },
    {
      name: "pękanie skóry",
      description: "Pękanie skóry może wystąpić jako skutek łuszczycy, zwłaszcza w obszarach dotkniętych zmianami skórnymi."
    },
    {
      name: "łuszczenie się skóry",
      description: "Łuszczenie się skóry jest charakterystycznym objawem łuszczycy, powodując występowanie srebrzystych łusek."
    },
    {
      name: "nadmierne rozdrażnienie",
      description: "Nadmierne rozdrażnienie skóry to efekt stanu zapalnego spowodowanego łuszczycą."
    },
    {
      name: "potliwość dłoni",
      description: "Potliwość dłoni może być zwiększona u pacjentów z łuszczycą, zwłaszcza w stresujących sytuacjach."
    }
  ]
)

diseases_eczema.risk_factors.create!(
  [
    {
      name: "alergia na kurz",
      description: "Alergia na kurz jest jednym z czynników ryzyka dla rozwoju łuszczycy."
    },
    {
      name: "alergia na sierść zwierząt",
      description: "Alergia na sierść zwierząt może zwiększać ryzyko wystąpienia łuszczycy u podatnych osób."
    },
    {
      name: "alergia na pyłki roślin",
      description: "Alergia na pyłki roślin może być związana z rozwojem łuszczycy u niektórych pacjentów."
    },
    {
      name: "orzechy ziemne",
      description: "Alergia na orzechy ziemne może mieć związek z wystąpieniem łuszczycy u niektórych osób."
    },
    {
      name: "niska wilgotność powietrza",
      description: "Niska wilgotność powietrza może wpływać na nasilenie objawów łuszczycy."
    },
    {
      name: "nadmierna higiena",
      description: "Nadmierna higiena skóry może prowadzić do zaostrzenia łuszczycy."
    },
    {
      name: "stres",
      description: "Stres może być czynnikiem wyzwalającym objawy łuszczycy lub zaostrzającym jej przebieg."
    }
  ]
)

diseases_eczema.statuses.create!(
  [
    {
      content: "Swędzenie i zaczerwienienie skóry są uciążliwe, ale diagnoza egzemy została potwierdzona przez dermatologa.",
      mood: rand(1..3),
      status: "diagnosed"
    },
    {
      content: "Obecnie stosuję leczenie maścią sterydową zaleconą przez lekarza, aby zmniejszyć objawy.",
      mood: rand(1..3),
      status: "diagnosed"
    },
    {
      content: "Egzema jest przewlekłą chorobą, ale staram się utrzymać ją pod kontrolą poprzez odpowiednią pielęgnację skóry i unikanie czynników ryzyka.",
      mood: rand(1..3),
      status: "diagnosed"
    }
  ]
)

account.treatments.create!(
  [
    {
      title: "Dieta ketogeniczna",
      description: "Dieta ketogeniczna może pomóc w zmniejszeniu stanu zapalnego skóry u pacjentów z łuszczycą.",
      start_date: DateTime.now - rand(1..10).days,
      effectiveness: rand(1..5)
    },
    {
      title: "Inhalacja z soli morskiej",
      description: "Inhalacje solą morską mogą przynieść ulgę w łagodzeniu objawów łuszczycy, zwłaszcza w okolicach dróg oddechowych.",
      start_date: DateTime.now - rand(1..10).days,
      effectiveness: rand(1..5)
    },
    {
      title: "Medytacja",
      description: "Medytacja może pomóc w redukcji stresu, co może wpłynąć na zmniejszenie nasilenia objawów łuszczycy.",
      start_date: DateTime.now - rand(1..10).days,
      effectiveness: rand(1..5)
    },
    {
      title: "Suplementacja Ashwagandhą",
      description: "Ashwagandha to zioło, które może mieć właściwości przeciwzapalne i pomóc w łagodzeniu objawów łuszczycy.",
      start_date: DateTime.now - rand(1..10).days,
      effectiveness: rand(1..5)
    },
    {
      title: "Terapia olejkiem CBD",
      description: "Olejek CBD może pomóc w redukcji stanu zapalnego skóry i swędzenia u pacjentów z łuszczycą.",
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
      name: "-5kg w dół",
      description: "Widzę pierwsze efekty diety. Schudłem już 5kg!",
      status: "improvement",
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Co dziś ugotowałem",
      description: "Dzisiaj ugotowałem sobie jajka sadzone na maśle klarowanym. Były pyszne!",
      status: "no_change",
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Rozpoczęcie diety",
      description: "Dzisiaj rozpocząłem dietę ketogeniczną. Mam nadzieję, że pomoże mi ona w walce z otyłością.",
      status: "no_change",
      update_date: DateTime.now - rand(1..10).days
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
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Dziś trochę lepiej",
      description: "Dzisiaj czuję się trochę lepiej. Mam nadzieję, że to nie tylko chwilowa poprawa.",
      status: "improvement",
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Znaczne pogorszenie",
      description: "Dzisiaj czuję się bardzo źle. Mam problemy z oddychaniem. Nie wiem, co się dzieje.",
      status: "worsening",
      update_date: DateTime.now - rand(1..10).days
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
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Jest stabilnie",
      description: "Dzisiaj czuję się stabilnie. Mam nadzieję, że z czasem będzie coraz lepiej.",
      status: "no_change",
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Duży strach",
      description: "Po dzisiejszej sesji medytacji czuję się bardzo źle. Byłem dosłownie przerażony w trakcie medytacji.",
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
      name: "Głębszy sen",
      description: "Dzięki Ashwagandzie miałem głębszy sen. Czuję się wypoczęty.",
      status: "improvement",
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Mdłości",
      description: "Dziś czuję się bardzo źle. Mam mdłości i bóle brzucha. Nie wiem, co się dzieje.",
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
      name: "Zmiany po tygodniu",
      description: "Po tygodniu stosowania olejku CBD czuję się lepiej. Mam nadzieję, że to nie tylko chwilowa poprawa.",
      status: "no_change",
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Polepszenie snu",
      description: "Dzięki olejkowi miałem głębszy sen. Czuję się wypoczęty.",
      status: "improvement",
      update_date: DateTime.now - rand(1..10).days
    },
    {
      name: "Polepszenie skóry",
      description: "Dziś czuję się lepiej. Moja skóra jest mniej sucha i mniej swędzi.",
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

Rails.logger.debug "Seeding users with the data done."
