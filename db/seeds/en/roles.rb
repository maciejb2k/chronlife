Rails.logger.debug "Seeding roles ..."

Role.create(name: "patient")
Role.create(name: "specialist")

Rails.logger.debug "Seeding roles completed."
