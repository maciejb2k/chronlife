puts "Seeding predefined symptoms ..."

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

obesity = PredefinedDisease.find_by(name: "nadwaga")
obesity.predefined_symptoms.create(
  [
    {
      name: "zwiększona masa ciała",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "trudność w utrzymaniu aktywności fizycznej",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "problemy z oddychaniem",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "zmęczenie i brak energii",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "problemy z trawieniem",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "bóle stawów",
      description: "Lorem ipsum dolor sit amet."
    }
  ]
)

diabetes = PredefinedDisease.find_by(name: "cukrzyca")
diabetes.predefined_symptoms.create(
  [
    {
      name: "nadmierne pragnienie (polidypsja)",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "nadmierna ilość oddawanej moczu (poliuria)",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "nadmierny apetyt, głód (polifagia)",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "nagły spadek masy ciała",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "przemęczenie i osłabienie",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "częste infekcje, trudności w gojeniu się ran",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "zaburzenia widzenia",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "zgrubienie, swędzenie lub suchość skóry",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "drżenie rąk",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "zaburzenia czucia w rękach i stopach",
      description: "Lorem ipsum dolor sit amet."
    }
  ]
)

asthma = PredefinedDisease.find_by(name: "astma")
asthma.predefined_symptoms.create(
  [
    {
      name: "skrócenie oddechu lub duszność",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "świszczący oddech",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "świsty w klatce piersiowej",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "nocny kaszel",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "zwężenie oskrzeli",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "utrudnione wydalenie śluzu",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "zwiększona reaktywność oskrzeli na bodźce",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "nadmierna produkcja śluzu",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "wzmożona aktywność kaszlu rano",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "uczucie ucisku lub ściskania w klatce piersiowej",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "zmęczenie związane z trudnościami w oddychaniu",
      description: "Lorem ipsum dolor sit amet."
    }
  ]
)

hypothyroidism = PredefinedDisease.find_by(name: "niedoczynność tarczycy")
hypothyroidism.predefined_symptoms.create(
  [
    {
      name: "ogólne zmęczenie i osłabienie",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "wolniejszy tempa pracy i reakcji umysłowych",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "przyrost masy ciała",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "zwiększona wrażliwość na zimno",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "suchość skóry i wypadanie włosów",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "zmniejszona ilość włosów na brwiach i rzęsach",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "zwolnienie rytmu serca (bradykardia)",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "problemy z pamięcią i koncentracją",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "zaparcia",
      description: "Lorem ipsum dolor sit amet."
    },
    {
      name: "nadmierne uczucie zmęczenia",
      description: "Lorem ipsum dolor sit amet."
    }
  ]
)

puts "Seeding predefined symptoms done."
