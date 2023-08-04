MeasurementType.create(
  [
    {
      name: "weight",
      unit_id: Unit.find_by(symbol: "kg").id
    },
    {
      name: "sugar",
      unit_id: Unit.find_by(symbol: "mg/dL").id
    },
    {
      name: "heart_beat",
      unit_id: Unit.find_by(symbol: "bpm").id
    },
    {
      name: "blood_pressure",
      unit_id: Unit.find_by(symbol: "mmHg").id
    },
    {
      name: "spo2",
      unit_id: Unit.find_by(symbol: "%").id
    }
  ]
)
