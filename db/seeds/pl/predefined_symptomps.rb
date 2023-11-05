Rails.logger.debug "Seeding predefined symptoms ..."

azs = PredefinedDisease.find_by(name: "atopowe zapalenie skóry")
azs.predefined_symptoms.create(
  [
    {
      name: "swędzenie",
      description: "Odczuwanie nieprzyjemnego swędzenia skóry."
    },
    {
      name: "zaczerwienienie",
      description: "Wyraźne zaczerwienienie skóry."
    },
    {
      name: "suchość skóry",
      description: "Skóra jest nadmiernie sucha i szorstka."
    }
  ]
)

ms = PredefinedDisease.find_by(name: "stwardnienie rozsiane")
ms.predefined_symptoms.create(
  [
    {
      name: "Zmęczenie",
      description: "Nadmierne uczucie zmęczenia jest powszechnym objawem stwardnienia rozsianego."
    },
    {
      name: "Zaburzenia widzenia",
      description: "Zaburzenia widzenia, takie jak podwójne widzenie, mogą występować u pacjentów z MS."
    },
    {
      name: "Problemy z równowagą",
      description: "Zaburzenia równowagi mogą być objawem stwardnienia rozsianego."
    },
    {
      name: "Problemy z mową",
      description: "Zaburzenia mowy mogą występować u niektórych pacjentów z MS."
    },
    {
      name: "Drętwienie lub mrowienie",
      description: "Drętwienie lub mrowienie w różnych częściach ciała może być objawem stwardnienia rozsianego."
    },
    {
      name: "Bóle mięśni i stawów",
      description: "Bóle mięśni i stawów mogą występować u pacjentów z MS."
    },
    {
      name: "Problemy z pamięcią i koncentracją",
      description: "Zaburzenia pamięci i koncentracji mogą być objawem stwardnienia rozsianego."
    },
    {
      name: "Zaburzenia mikcji",
      description: "Zaburzenia mikcji, takie jak nietrzymanie moczu, mogą występować u pacjentów z MS."
    }
  ]
)

obesity = PredefinedDisease.find_by(name: "nadwaga")
obesity.predefined_symptoms.create(
  [
    {
      name: "zwiększona masa ciała",
      description: "Nadmierne gromadzenie tkanki tłuszczowej w organizmie."
    },
    {
      name: "trudność w utrzymaniu aktywności fizycznej",
      description: "Odczuwanie trudności w wykonywaniu aktywności fizycznej z powodu nadmiernego obciążenia ciała."
    },
    {
      name: "problemy z oddychaniem",
      description: "Trudności z oddychaniem, szczególnie podczas wykonywania wysiłku fizycznego."
    },
    {
      name: "zmęczenie i brak energii",
      description: "Odczuwanie przewlekłego zmęczenia i braku energii związanych z otyłością."
    },
    {
      name: "problemy z trawieniem",
      description: "Zaburzenia trawienne i problemy z przyswajaniem składników odżywczych."
    },
    {
      name: "bóle stawów",
      description: "Bóle i dyskomfort w stawach, często związane z nadmiernym obciążeniem."
    }
  ]
)

diabetes = PredefinedDisease.find_by(name: "cukrzyca")
diabetes.predefined_symptoms.create(
  [
    {
      name: "nadmierne pragnienie (polidypsja)",
      description: "Intensywne uczucie pragnienia, które występuje często w cukrzycy."
    },
    {
      name: "nadmierna ilość oddawanej moczu (poliuria)",
      description: "Częste oddawanie dużej ilości moczu, charakterystyczne dla cukrzycy."
    },
    {
      name: "nadmierny apetyt, głód (polifagia)",
      description: "Silne uczucie głodu i nadmierny apetyt, zwłaszcza w cukrzycy typu 1."
    },
    {
      name: "nagły spadek masy ciała",
      description: "Niespodziewany i niekontrolowany spadek masy ciała, szczególnie w cukrzycy typu 1."
    },
    {
      name: "przemęczenie i osłabienie",
      description: "Nadmierne zmęczenie i osłabienie organizmu związane z zaburzeniami gospodarki cukrowej."
    },
    {
      name: "częste infekcje, trudności w gojeniu się ran",
      description: "Zwiększona podatność na infekcje i opóźnione gojenie się ran to objawy cukrzycy."
    },
    {
      name: "zaburzenia widzenia",
      description: "Zmiany w zdolności widzenia, takie jak mgła, podwójne widzenie, charakterystyczne w cukrzycy."
    },
    {
      name: "zgrubienie, swędzenie lub suchość skóry",
      description: "Skórne objawy cukrzycy, takie jak zgrubienie, swędzenie i suchość skóry."
    },
    {
      name: "drżenie rąk",
      description: "Drżenie rąk może być związane z niestabilnym poziomem cukru we krwi."
    },
    {
      name: "zaburzenia czucia w rękach i stopach",
      description: "Utrata czucia, drętwienie lub mrowienie w rękach i stopach, często związane z cukrzycą."
    }
  ]
)

heart_failure = PredefinedDisease.find_by(name: "niewydolność serca")
heart_failure.predefined_symptoms.create(
  [
    {
      name: "duszność",
      description: "Trudności w oddychaniu, uczucie duszności."
    },
    {
      name: "zmęczenie",
      description: "Odczuwanie przewlekłego zmęczenia i osłabienia organizmu."
    },
    {
      name: "obrzęk",
      description: "Nadmierne gromadzenie płynów w organizmie, powodujące obrzęki."
    },
    {
      name: "nadmierne pocenie się",
      description: "Nadmierne pocenie się, szczególnie w nocy."
    },
    {
      name: "zwiększona ilość oddawanego moczu",
      description: "Częste oddawanie dużej ilości moczu."
    },
    {
      name: "nadmierne zmęczenie",
      description: "Odczuwanie przewlekłego zmęczenia i osłabienia organizmu."
    }
  ]
)

osteoporosis = PredefinedDisease.find_by(name: "osteoporoza")
osteoporosis.predefined_symptoms.create(
  [
    {
      name: "Złamania kości",
      description: "Osteoporoza zwiększa ryzyko złamań kości, zwłaszcza biodra, kręgosłupa i nadgarstka."
    },
    {
      name: "Skurcze i bóle mięśni",
      description: "Osoby z osteoporozą mogą doświadczać skurczów i bólu mięśni."
    },
    {
      name: "Ubóstwo wzrostu",
      description: "Osteoporoza może prowadzić do utraty wzrostu w wyniku złamań kręgów."
    },
    {
      name: "Zgarbienie kręgosłupa",
      description: "Zgarbienie kręgosłupa, zwane kifozą, jest częstym objawem osteoporozy."
    },
    {
      name: "Zmniejszona ruchomość",
      description: "Osteoporoza może ograniczać ruchomość i sprawność fizyczną."
    },
    {
      name: "Ból pleców",
      description: "Bóle pleców, szczególnie w okolicy kręgosłupa, mogą być objawem osteoporozy."
    },
    {
      name: "Słabe paznokcie",
      description: "Osteoporoza może wpływać na stan paznokci, sprawiając, że stają się słabe i łamliwe."
    },
    {
      name: "Wysoki ryzyko złamań",
      description: "Osteoporoza zwiększa ogólne ryzyko złamań kości."
    }
  ]
)

hypertension = PredefinedDisease.find_by(name: "nadciśnienie tętnicze")
hypertension.predefined_symptoms.create(
  [
    {
      name: "Ból głowy",
      description: "Częste bóle głowy, zwłaszcza w okolicy skroni i czoła, mogą być objawem nadciśnienia tętniczego."
    },
    {
      name: "Zawroty głowy",
      description: "Zawroty głowy i uczucie niestabilności mogą występować przy wysokim ciśnieniu krwi."
    },
    {
      name: "Nudności",
      description: "Nudności i wymioty mogą być spowodowane nadciśnieniem tętniczym."
    },
    {
      name: "Problemy z widzeniem",
      description: "Nadciśnienie tętnicze może prowadzić do zaburzeń widzenia, takich jak rozmyte widzenie."
    },
    {
      name: "Zmęczenie",
      description: "Osoby z nadciśnieniem tętniczym mogą odczuwać chroniczne zmęczenie."
    },
    {
      name: "Bóle w klatce piersiowej",
      description: "Bóle w klatce piersiowej lub duszności mogą występować przy nadciśnieniu tętniczym."
    },
    {
      name: "Problemy z oddychaniem",
      description: "Trudności w oddychaniu i duszność są częstym objawem nadciśnienia tętniczego."
    },
    {
      name: "Mrowienie w rękach i stopach",
      description: "Mrowienie, drętwienie lub utrata czucia w rękach i stopach mogą być związane z nadciśnieniem tętniczym."
    }
  ]
)

hypothyroidism = PredefinedDisease.find_by(name: "niedoczynność tarczycy")
hypothyroidism.predefined_symptoms.create(
  [
    {
      name: "ogólne zmęczenie i osłabienie",
      description: "Uczucie chronicznego zmęczenia i osłabienia organizmu."
    },
    {
      name: "wolniejszy tempa pracy i reakcji umysłowych",
      description: "Spowolnienie procesów myślowych i reakcji umysłowych."
    },
    {
      name: "przyrost masy ciała",
      description: "Niezamierzony przyrost masy ciała, pomimo diety i aktywności fizycznej."
    },
    {
      name: "zwiększona wrażliwość na zimno",
      description: "Zwiększona wrażliwość na niskie temperatury i uczucie zimna."
    },
    {
      name: "suchość skóry i wypadanie włosów",
      description: "Skóra staje się sucha, a włosy wypadają w większej ilości."
    },
    {
      name: "zmniejszona ilość włosów na brwiach i rzęsach",
      description: "Rzadsze włosy na brwiach i rzęsach, charakterystyczne dla niedoczynności tarczycy."
    },
    {
      name: "zwolnienie rytmu serca (bradykardia)",
      description: "Spowolniony rytm serca, nazywany bradykardią."
    },
    {
      name: "problemy z pamięcią i koncentracją",
      description: "Trudności z pamięcią i koncentracją związane z niedoczynnością tarczycy."
    },
    {
      name: "zaparcia",
      description: "Częste zaparcia i problemy z perystaltyką jelit."
    },
    {
      name: "nadmierne uczucie zmęczenia",
      description: "Odczuwanie silnego zmęczenia, nawet po wypoczynku."
    }
  ]
)

asthma = PredefinedDisease.find_by(name: "astma")
asthma.predefined_symptoms.create(
  [
    {
      name: "skrócenie oddechu lub duszność",
      description: "Trudności w oddychaniu, uczucie duszności."
    },
    {
      name: "świszczący oddech",
      description: "Charakterystyczny dźwięk świszczącego oddechu podczas ataku astmy."
    },
    {
      name: "świsty w klatce piersiowej",
      description: "Słyszalne świsty w klatce piersiowej podczas ataku astmy."
    },
    {
      name: "nocny kaszel",
      description: "Kaszel, który nasila się w nocy, często jest objawem astmy."
    },
    {
      name: "zwężenie oskrzeli",
      description: "Zwężenie oskrzeli utrudniające przepływ powietrza."
    },
    {
      name: "utrudnione wydalenie śluzu",
      description: "Trudności w wydaleniu śluzu z dróg oddechowych."
    },
    {
      name: "zwiększona reaktywność oskrzeli na bodźce",
      description: "Wzmożona reakcja oskrzeli na różne bodźce, prowadząca do skurczu."
    },
    {
      name: "nadmierna produkcja śluzu",
      description: "Wzmożona produkcja śluzu w drogach oddechowych."
    },
    {
      name: "wzmożona aktywność kaszlu rano",
      description: "Wzmożona aktywność kaszlu zwłaszcza rano."
    },
    {
      name: "uczucie ucisku lub ściskania w klatce piersiowej",
      description: "Uczucie ucisku lub ściskania w okolicach klatki piersiowej podczas ataku astmy."
    },
    {
      name: "zmęczenie związane z trudnościami w oddychaniu",
      description: "Odczuwanie zmęczenia związanego z trudnościami w oddychaniu w wyniku astmy."
    }
  ]
)

celiac_disease = PredefinedDisease.find_by(name: "celiakia")
celiac_disease.predefined_symptoms.create(
  [
    {
      name: "Biegunka",
      description: "Częsta biegunka jest jednym z głównych objawów celiakii."
    },
    {
      name: "Bóle brzucha",
      description: "Bóle brzucha i skurcze mogą występować u osób z celiakią."
    },
    {
      name: "Wzdęcia",
      description: "Wzdęcia i dyskomfort w jamie brzusznej są częstym objawem celiakii."
    },
    {
      name: "Nudności",
      description: "Nudności i wymioty mogą być spowodowane celiakią."
    },
    {
      name: "Utrata masy ciała",
      description: "Niezamierzona utrata masy ciała jest częstym objawem celiakii."
    },
    {
      name: "Zmęczenie",
      description: "Osoby z celiakią mogą doświadczać chronicznego zmęczenia."
    },
    {
      name: "Bóle stawów",
      description: "Bóle stawów i zapalenie stawów są objawami celiakii."
    },
    {
      name: "Problemy z koncentracją",
      description: "Zaburzenia koncentracji i problemy z pamięcią mogą występować u osób z celiakią."
    }
  ]
)

psoriasis = PredefinedDisease.find_by(name: "łuszczyca")
psoriasis.predefined_symptoms.create(
  [
    {
      name: "Czerwone plamy na skórze",
      description: "Łuszczyca objawia się czerwonymi plamami na skórze, które są zazwyczaj podwyższone i pokryte srebrzystymi łuskami."
    },
    {
      name: "Świąd skóry",
      description: "Świąd jest powszechnym objawem łuszczycy, który może być bardzo dokuczliwy."
    },
    {
      name: "Grubienie paznokci",
      description: "Łuszczyca może wpływać na paznokcie, powodując ich pogrubienie i zmiany w kształcie."
    },
    {
      name: "Zmiany w kształcie stawów",
      description: "Niektórzy pacjenci z łuszczycą mogą doświadczać zmian w kształcie stawów, zwłaszcza w postaci łuszczycowego zapalenia stawów."
    },
    {
      name: "Czerwone i opuchnięte stawy",
      description: "Zapalenie stawów to inny objaw łuszczycy, który może prowadzić do czerwieni i obrzęku stawów."
    },
    {
      name: "Złuszczanie skóry",
      description: "Skóra łuszcząca się jest charakterystycznym objawem łuszczycy."
    },
    {
      name: "Ból i pieczenie skóry",
      description: "Ból i pieczenie skóry mogą towarzyszyć łuszczycy, szczególnie w okolicach zmian skórnych."
    },
    {
      name: "Zmiany w kolorze paznokci",
      description: "Paznokcie mogą zmieniać kolor w wyniku łuszczycy, stając się żółte, brązowe lub białe."
    }
  ]
)

crohn_disease = PredefinedDisease.find_by(name: "choroba leśniowskiego-crohna")
crohn_disease.predefined_symptoms.create(
  [
    {
      name: "Biegunka",
      description: "Biegunka jest powszechnym objawem choroby Leśniowskiego-Crohna."
    },
    {
      name: "Bóle brzucha",
      description: "Bóle brzucha i skurcze mogą występować u pacjentów z chorobą Leśniowskiego-Crohna."
    },
    {
      name: "Utrata masy ciała",
      description: "Niezamierzona utrata masy ciała jest częstym objawem choroby Leśniowskiego-Crohna."
    },
    {
      name: "Krew w stolcu",
      description: "Obecność krwi w stolcu może występować u pacjentów z chorobą Leśniowskiego-Crohna."
    },
    {
      name: "Gorączka",
      description: "Wzrost temperatury ciała i gorączka są objawami choroby Leśniowskiego-Crohna w przypadku wystąpienia zapalenia."
    },
    {
      name: "Wzdęcia",
      description: "Wzdęcia i dyskomfort w jamie brzusznej są powszechnym objawem choroby Leśniowskiego-Crohna."
    },
    {
      name: "Nudności",
      description: "Nudności i wymioty mogą być spowodowane chorobą Leśniowskiego-Crohna."
    },
    {
      name: "Zmęczenie",
      description: "Osoby z chorobą Leśniowskiego-Crohna mogą odczuwać chroniczne zmęczenie."
    }
  ]
)

parkinson_disease = PredefinedDisease.find_by(name: "choroba parkinsona")
parkinson_disease.predefined_symptoms.create(
  [
    {
      name: "Drgawki rąk",
      description: "Drgawki rąk, zwłaszcza spoczynkowe drżenie między kciukiem i palcem wskazującym, to charakterystyczny objaw choroby Parkinsona."
    },
    {
      name: "Sztywność mięśni",
      description: "Sztywność mięśni i opór ruchowy to częste objawy choroby Parkinsona."
    },
    {
      name: "Zwolnienie ruchów",
      description: "Zwolnienie ruchów i trudności w rozpoczęciu ruchu to inny objaw choroby Parkinsona."
    },
    {
      name: "Niestabilność postawy",
      description: "Niestabilność postawy i trudności w utrzymaniu równowagi są charakterystyczne dla choroby Parkinsona."
    },
    {
      name: "Mikrografia",
      description: "Mikrografia, czyli drobniejszy charakter pisma, jest objawem choroby Parkinsona."
    },
    {
      name: "Zaburzenia snu",
      description: "Choroba Parkinsona może prowadzić do zaburzeń snu, takich jak bezsenność."
    },
    {
      name: "Depresja",
      description: "Depresja jest często współwystępującym objawem choroby Parkinsona."
    },
    {
      name: "Zmiany mowy",
      description: "Zmiany w mowie, takie jak niewyraźna lub cichsza mowa, mogą występować u pacjentów z chorobą Parkinsona."
    }
  ]
)

endometriosis = PredefinedDisease.find_by(name: "endometrioza")
endometriosis.predefined_symptoms.create(
  [
    {
      name: "Bóle menstruacyjne",
      description: "Silne bóle menstruacyjne, zwane dysmenorrhea, to jeden z głównych objawów endometriozy."
    },
    {
      name: "Bóle podczas stosunku",
      description: "Bóle podczas stosunku, zwane dyspareunią, mogą występować u kobiet z endometriozą."
    },
    {
      name: "Bóle brzucha",
      description: "Bóle brzucha i miednicy są częstym objawem endometriozy."
    },
    {
      name: "Zaburzenia cyklu menstruacyjnego",
      description: "Endometrioza może prowadzić do nieregularności w cyklu menstruacyjnym i krwawienia międzymiesiączkowego."
    },
    {
      name: "Bóle podczas oddawania moczu lub kału",
      description: "Bóle podczas oddawania moczu lub kału mogą być związane z endometriozą w okolicy narządów miednicy mniejszej."
    },
    {
      name: "Zmęczenie",
      description: "Zmęczenie i ogólne osłabienie organizmu mogą towarzyszyć endometriozie."
    },
    {
      name: "Infertylność",
      description: "Endometrioza jest jednym z głównych czynników ryzyka infertylności u kobiet."
    },
    {
      name: "Inne objawy",
      description: "Inne objawy mogą obejmować bóle pleców, nudności, biegunkę lub zaparcia."
    }
  ]
)

Rails.logger.debug "Seeding predefined symptoms done."
