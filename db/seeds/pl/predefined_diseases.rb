Rails.logger.debug "Seeding predefined diseases ..."

PredefinedDisease.create(
  [
    {
      name: "atopowe zapalenie skóry",
      description: "Choroba skóry charakteryzująca się wysypkami i świądem."
    },
    {
      name: "stwardnienie rozsiane",
      description: "Choroba układu nerwowego powodująca uszkodzenie osłonki mielinowej nerwów."
    },
    {
      name: "nadwaga",
      description: "Stan związany z nadmierną ilością tkanki tłuszczowej w organizmie."
    },
    {
      name: "cukrzyca",
      description: "Choroba metaboliczna, która wpływa na poziom cukru we krwi."
    },
    {
      name: "niewydolność serca",
      description: "Stan, w którym serce nie jest w stanie pompować krwi wystarczająco skutecznie."
    },
    {
      name: "osteoporoza",
      description: "Choroba układu kostnego charakteryzująca się utratą masy kostnej."
    },
    {
      name: "nadciśnienie tętnicze",
      description: "Wysokie ciśnienie krwi, które zwiększa ryzyko chorób serca."
    },
    {
      name: "niedoczynność tarczycy",
      description: "Stan, w którym tarczyca nie produkuje wystarczającej ilości hormonów."
    },
    {
      name: "astma",
      description: "Choroba układu oddechowego, która powoduje skurcze oskrzeli."
    },
    {
      name: "celiakia",
      description: "Choroba trzewna, która utrudnia trawienie glutenu."
    },
    {
      name: "łuszczyca",
      description: "Choroba skóry charakteryzująca się plackami i łuskami."
    },
    {
      name: "choroba leśniowskiego-crohna",
      description: "Przewlekła choroba zapalna jelit."
    },
    {
      name: "choroba parkinsona",
      description: "Choroba neurodegeneracyjna, która wpływa na kontrolę ruchów."
    },
    {
      name: "endometrioza",
      description: "Choroba ginekologiczna, w której tkanka macicy rośnie poza nią."
    }
  ]
)

Rails.logger.debug "Seeding predefined diseases done."
