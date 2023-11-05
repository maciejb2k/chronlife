Rails.logger.debug "Seeding specialists and articles ..."

FIELDS_OF_EXPERTISE = [
  "Alergologia",
  "Angiologia",
  "Audiologia",
  "Balneologia",
  "Chirurgia",
  "Choroby płuc",
  "Choroby wewnętrzne",
  "Choroby zakaźne",
  "Dermatologia",
  "Diabetologia",
  "Endokrynologia",
  "Epidemiologia",
  "Farmakologia",
  "Gastroenterologia",
  "Geriatria",
  "Ginekologia",
  "Hematologia",
  "Hipertensjologia",
  "Immunologia",
  "Kardiochirurgia",
  "Kardiologia",
  "Medycyna sportowa",
  "Mikrobiologia",
  "Nefrologia",
  "Neonatologia",
  "Neurochirurgia",
  "Neurologia",
  "Neuropatologia",
  "Okulistyka",
  "Onkologia",
  "Ortopedia",
  "Otorynolaryngologia",
  "Patomorfologia",
  "Pediatria",
  "Perinatologia",
  "Położnictwo",
  "Psychiatria",
  "Radiologia",
  "Radioterapia",
  "Reumatologia",
  "Toksykologia",
  "Transfuzjologia",
  "Transplantologia",
  "Urologia"
].freeze

SPECIALIZATIONS = {
  Alergologia: ["Alergolog"],
  Angiologia: ["Angiolog"],
  Audiologia: %w[Audiolog Foniatria],
  Balneologia: ["Balneolog", "Medycyna fizykalna"],
  Chirurgia: [
    "Chirurg dziecięcy",
    "Chirurg klatki piersiowej",
    "Chirurg naczyniowy",
    "Chirurg ogólny",
    "Chirurg onkologiczny",
    "Chirurg plastyczny",
    "Chirurg szczękowo-twarzowy"
  ],
  "Choroby płuc": ["Pulmonolog"],
  "Choroby wewnętrzne": ["Internista"],
  "Choroby zakaźne": %w[Zakaźnik Epidemiolog],
  Dermatologia: %w[Dermatolog Wenerolog],
  Diabetologia: ["Diabetolog dziecięcy"],
  Endokrynologia: ["Endokrynolog dziecięcy"],
  Epidemiologia: ["Epidemiolog dziecięcy"],
  Farmakologia: ["Farmakolog kliniczny"],
  Gastroenterologia: ["Gastroenterolog dziecięcy"],
  Geriatria: ["Geriatria", "Geriatria kliniczna"],
  Ginekologia: ["Ginekolog", "Położnik dziecięcy"],
  Hematologia: ["Hematolog", "Hematolog dziecięcy"],
  Hipertensjologia: ["Hipertensjolog", "Hipertensjolog dziecięcy"],
  Immunologia: ["Immunolog kliniczny"],
  Kardiochirurgia: ["Kardiochirurg kliniczny", "Kardiochirurg dziecięcy", "Kardiochirurg ogólny"],
  Kardiologia: ["Kardiolog", "Kardiolog dziecięcy"],
  "Medycyna sportowa": ["Medycyna sportowa"],
  Mikrobiologia: ["Mikrobiolog lekarski"],
  Nefrologia: ["Nefrolog kliniczny"],
  Neonatologia: ["Neonatolog kliniczny"],
  Neurochirurgia: ["Neurochirurg kliniczny"],
  Neurologia: ["Neurolog dziecięcy"],
  Neuropatologia: ["Neuropatolog kliniczny"],
  Okulistyka: ["Okulista dziecięcy", "Okulista kliniczny"],
  Onkologia: [
    "Onkolog",
    "Hematolog-onkolog dziecięcy",
    "Onkolog kliniczny"
  ],
  Ortopedia: ["Ortopeda", "Traumatolog narządu ruchu"],
  Otorynolaryngologia: ["Laryngolog", "Otorynolaryngolog dziecięcy"],
  Patomorfologia: ["Patomorfolog dziecięcy"],
  Pediatria: ["Pediatra dziecięcy"],
  Perinatologia: ["Perinatolog dziecięcy"],
  Położnictwo: ["Położnik dziecięcy"],
  Psychiatria: ["Psychiatra dziecięcy"],
  Radiologia: ["Radiolog", "Diagnosta obrazowy"],
  Radioterapia: ["Radioterapeuta onkologiczny"],
  Reumatologia: ["Reumatolog dziecięcy"],
  Toksykologia: ["Toksykolog kliniczny"],
  Transfuzjologia: ["Transfuzjolog kliniczny"],
  Transplantologia: ["Transplantolog kliniczny"],
  Urologia: ["Urolog"]
}.freeze

8.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = "#{first_name}#{last_name}".downcase

  user = User.new(
    email: "#{first_name}.#{last_name}@gov.pl",
    password: "password",
    password_confirmation: "password"
  )
  user.skip_confirmation!

  field_of_expertise = FIELDS_OF_EXPERTISE.sample
  specialization = SPECIALIZATIONS[field_of_expertise.to_sym].sample

  user.build_specialist(
    field_of_expertise:,
    specialization:,
    specialization_description: "-"
  )

  user.set_specialist_role!
  user.save!

  account = user.build_account(
    first_name:,
    last_name:,
    username:
  )

  account.save!
end

Article.create!(
  title: "Zdrowe nawyki snu",
  description: "Wprowadzenie do dobrych praktyk snu i ich wpływu na zdrowie ogólne.",
  body: "<p>Sen odgrywa kluczową rolę w naszym zdrowiu ogólnym. To podczas snu nasze ciało regeneruje się i przeprowadza niezbędne procesy naprawcze. Warto więc zadbać o zdrowe nawyki snu, które pomogą nam cieszyć się lepszym zdrowiem i samopoczuciem.</p><p><br></p><p>Oto kilka prostych zasad, które warto wdrożyć:</p><p><br></p><p>1. Regularność: Staraj się iść spać i budzić o stałych porach, nawet w weekendy. To pomoże w dostosowaniu rytmu snu.</p><p>2. Komfortowa przestrzeń: Upewnij się, że twoje miejsce do spania jest wygodne i pozbawione czynników zakłócających sen, takich jak zbyt jasne światło czy hałas.</p><p>3. Unikanie kofeiny i alkoholu przed snem: Ogranicz spożycie kawy i alkoholu, zwłaszcza wieczorem, aby nie zakłócić procesu zasypiania.</p><p>4. Aktywność fizyczna: Regularna aktywność fizyczna poprawia jakość snu. Staraj się regularnie ćwiczyć, ale nie bezpośrednio przed snem.</p><p>5. Zdrowa dieta: Unikaj ciężkich posiłków tuż przed snem, ale jedz lekko i zdrowo.</p><p>6. Relaksacja: Wprowadź wieczorną rutynę relaksacyjną, na przykład ciepłą kąpiel, czytanie książki lub medytację, aby przygotować się do snu.</p><p><br></p><p>Zdrowe nawyki snu są kluczowe dla naszego ogólnego samopoczucia. Postaraj się wprowadzić je do swojego życia i ciesz się głębokim, regenerującym snem.</p>",
  created_at: Faker::Time.backward(days: 30),
  account: Specialist.all.sample.user.account
)

Article.create!(
  title: "Zdrowie oczy: ochrona wzroku",
  description: "Jak dbać o wzrok i unikać problemów z oczami.",
  body: "<p>Twoje oczy to cenny skarb, który warto chronić. Oto kilka prostych zasad, które pomogą zadbać o zdrowie oczu:</p><p><br></p><p>1. Regularne badania okulistyczne: Regularne wizyty u okulisty pozwalają wykryć problemy ze wzrokiem na wczesnym etapie i uniknąć poważniejszych schorzeń.</p><p>2. Odpowiednie oświetlenie: Dobrze doświetlone pomieszczenie pomaga uniknąć nadmiernego zmęczenia oczu. Unikaj odbłysków ekranów i jasnego światła.</p><p>3. Odpoczynek od pracy przy komputerze: Co godzinę zrób krótką przerwę od patrzenia na ekran, skupiając wzrok na dalekim obiekcie, aby zmniejszyć napięcie oczu.</p><p>4. Odpowiednia dieta: Spożywaj żywność bogatą w antyoksydanty, takie jak marchewki, szpinak i ryby, które wspierają zdrowie oczu.</p><p>5. Ochrona przed słońcem: Noszenie okularów przeciwsłonecznych z filtrem UV chroni oczy przed promieniowaniem szkodliwym dla siatkówki.</p><p>6. Unikanie palenia: Palenie tytoniu zwiększa ryzyko wystąpienia chorób oczu. Jeśli palisz, rozważ rzucenie nałogu.</p><p><br></p><p>Zadbaj o swoje oczy, stosując te proste zasady. Warto inwestować w długoterminowe zdrowie wzroku.</p>",
  created_at: Faker::Time.backward(days: 30),
  account: Specialist.all.sample.user.account
)

Article.create!(
  title: "Rola witamin i minerałów w diecie",
  description: "Znaczenie mikroelementów w codziennej diecie i zdrowiu.",
  body: "<p>Witaminy i minerały odgrywają kluczową rolę w utrzymaniu zdrowia i prawidłowego funkcjonowania organizmu. Oto, dlaczego są one ważne i jak można zadbać o odpowiednią ich podaż w diecie:</p><p><br></p><p>1. Witaminy wspomagające funkcje organizmu: Witaminy, takie jak witamina C, D, E i K, pomagają w przyswajaniu składników odżywczych, wspierają odporność i utrzymanie zdrowych kości.</p><p>2. Minerały dla utrzymania równowagi: Minerały, takie jak wapń, magnez, żelazo i potas, są niezbędne dla prawidłowego funkcjonowania mięśni, kości, układu krwionośnego i nerwowego.</p><p>3. Antyoksydanty chroniące przed uszkodzeniem komórek: Witaminy A, C i E, a także minerały takie jak selen, działają jako antyoksydanty, chroniąc komórki przed uszkodzeniem oksydacyjnym.</p><p>4. Wartościowe źródła witamin i minerałów: Świeże owoce, warzywa, orzechy, ryby i produkty mleczne to bogate źródła witamin i minerałów.</p><p>5. Zrównoważona dieta: Konsumowanie różnorodnych produktów spożywczych zapewnia dostęp do różnych witamin i minerałów, które organizm potrzebuje.</p><p><br></p><p>Zrozumienie roli witamin i minerałów w diecie jest kluczowe dla utrzymania zdrowego stylu życia. Upewnij się, że Twoja dieta jest zrównoważona i zawiera niezbędne składniki odżywcze.</p>",
  created_at: Faker::Time.backward(days: 30),
  account: Specialist.all.sample.user.account
)

Article.create!(
  title: "Zdrowa skóra i pielęgnacja ciała",
  description: "Porady dotyczące utrzymania zdrowej skóry i ciała.",
  body: "<p>Pielęgnacja skóry to ważna część dbania o zdrowie ogólne. Zdrowa skóra nie tylko wpływa na wygląd, ale także pełni kluczową rolę w ochronie organizmu. Oto kilka zasad pielęgnacji, które warto wdrożyć:</p><p><br></p><p>1. Nawilżanie: Regularne nawilżanie skóry pomaga zachować jej elastyczność i chroni przed wysuszeniem.</p><p>2. Ochrona przed słońcem: Stosowanie kremów z filtrem UV pomaga zapobiec szkodliwym promieniom słonecznym, które mogą przyspieszyć procesy starzenia skóry.</p><p>3. Zrównoważona dieta: Spożywanie owoców, warzyw, orzechów i ryb bogatych w składniki odżywcze wspiera zdrową skórę.</p><p>4. Unikanie palenia i nadmiernego alkoholu: Palenie tytoniu i nadmierna konsumpcja alkoholu mogą negatywnie wpływać na stan skóry.</p><p>5. Higiena: Regularne mycie skóry i unikanie nadmiernego stosowania kosmetyków mogą pomóc w zapobieganiu infekcjom i trądzikowi.</p><p>6. Sen i redukcja stresu: Dobre nawyki snu i redukcja stresu mają pozytywny wpływ na wygląd skóry.</p><p><br></p><p>Dbając o zdrową skórę, chronisz ją przed wpływem czynników zewnętrznych i pomagasz zachować młody wygląd. Zadbaj o swoją skórę, stosując te proste zasady pielęgnacji.</p>",
  created_at: Faker::Time.backward(days: 30),
  account: Specialist.all.sample.user.account
)

Article.create!(
  title: "Medytacja i techniki relaksacyjne",
  description: "Relaks umysłu i ciała dzięki medytacji i technikom relaksacyjnym.",
  body: "<p>Medytacja i techniki relaksacyjne są skutecznymi narzędziami do redukcji stresu, poprawy samopoczucia i ogólnego zdrowia. Oto, dlaczego warto włączyć je do codziennego życia:</p><p><br></p><p>1. Zmniejszenie stresu: Medytacja i techniki relaksacyjne pomagają obniżyć poziom kortyzolu, hormonu stresu, co ma korzystny wpływ na zdrowie psychiczne i fizyczne.</p><p>2. Poprawa koncentracji: Regularna praktyka medytacji poprawia zdolność skupienia uwagi, co może pomóc w rozwiązywaniu problemów i podejmowaniu decyzji.</p><p>3. Lepszy sen: Relaksacja przed snem może poprawić jakość snu i pomóc w walce z bezsennością.</p><p>4. Regulacja emocji: Medytacja uczy kontrolowania emocji i reakcji na stresujące sytuacje.</p><p>5. Zwiększenie świadomości ciała: Poprzez medytację możemy bardziej świadomie odczuwać własne ciało, co pomaga w rozpoznawaniu sygnałów, które wysyła nam organizm.</p><p>6. Prosta praktyka: Medytacja i techniki relaksacyjne są łatwe do wdrożenia w codzienne życie i nie wymagają specjalnego sprzętu.</p><p><br></p><p>Medytacja i techniki relaksacyjne są dostępne dla każdego i mogą znacząco poprawić jakość życia. Rozważ włączenie ich do swojej codziennej rutyny dla lepszego zdrowia psychicznego i fizycznego.</p>",
  created_at: Faker::Time.backward(days: 30),
  account: Specialist.all.sample.user.account
)

Article.create!(
  title: "Zdrowa żywność organiczna i GMO",
  description: "Omówienie żywności organicznej i jej związku z GMO.",
  body: "<p>Zrozumienie różnicy między żywnością organiczną a produktami zawierającymi GMO jest kluczowe dla podejmowania informowanych decyzji dotyczących diety. Oto, co powinieneś wiedzieć:</p><p><br></p><p>1. Żywność organiczna: Produkty organiczne są uprawiane i produkowane zgodnie z surowymi normami, wykluczając sztuczne pestycydy i nawozy. Są wolne od syntetycznych dodatków chemicznych.</p><p>2. GMO (organizmy genetycznie modyfikowane): Produkty zawierające GMO zostały zmodyfikowane genetycznie, aby wykazywać określone cechy. To może dotyczyć roślin i zwierząt.</p><p>3. Bezpieczeństwo i zdrowie: Obecnie nie ma jednoznacznych dowodów na szkodliwość produktów GMO dla zdrowia, ale wielu ludzi wybiera żywność organiczną z obaw o skutki długoterminowe.</p><p>4. Wybór: Wybór między żywnością organiczną a produktami GMO zależy od indywidualnych preferencji i przekonań. Warto dokładnie czytać etykiety i świadomie wybierać produkty spożywcze.</p><p>5. Ekologia: Żywność organiczna często promuje praktyki przyjazne dla środowiska, eliminując nadmierne zanieczyszczenie gleby i wody.</p><p>6. Koszty: Produkty organiczne często są droższe niż te zawierające GMO, co może być czynnikiem wpływającym na wybór.</p><p><br></p><p>Rozważ swoje wybory żywieniowe, kierując się własnymi potrzebami i wartościami. Warto być świadomym, co wkładasz w swoje ciało, aby zadbać o zdrową dietę.</p>",
  created_at: Faker::Time.backward(days: 30),
  account: Specialist.all.sample.user.account
)

Rails.logger.debug "Seeding specialists and articles completed."
