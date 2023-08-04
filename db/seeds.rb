Rails.logger.info "[ChronLife] Seeding..."

load Rails.root.join("db", "seeds", "predefined_diseases.rb")
load Rails.root.join("db", "seeds", "predefined_symptomps.rb")
load Rails.root.join("db", "seeds", "units.rb")
load Rails.root.join("db", "seeds", "measurement_types.rb")

Rails.logger.info "[ChronLife] Seeding done."
