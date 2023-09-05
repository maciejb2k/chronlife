Rails.logger.debug "Seeding measurement types ..."

MeasurementType.create(
  [
    {
      name: "weight",
      unit_id: Unit.find_by(symbol: "kg").id
    },
    {
      name: "sugar",
      unit_id: Unit.find_by(symbol: "mg/dL").id,
      lower_limit: "70",
      upper_limit: "99"
    },
    {
      name: "heart_beat",
      unit_id: Unit.find_by(symbol: "bpm").id,
      lower_limit: "60",
      upper_limit: "100"
    },
    {
      name: "blood_pressure",
      unit_id: Unit.find_by(symbol: "mmHg").id,
      lower_limit: "100/60",
      upper_limit: "139/89"
    },
    {
      name: "spo2",
      unit_id: Unit.find_by(symbol: "%").id,
      lower_limit: "90",
      upper_limit: "100"
    }
  ]
)

Rails.logger.debug "Seeding measurement types done."
