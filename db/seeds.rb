puts "Seeding ..."

locale = I18n.locale.to_s

if locale == "pl"
  puts "Seeding Polish version"
elsif locale == "en"
  puts "Seeding English version"
else
  raise "Unknown locale: #{locale}"
end

# Order is important
load Rails.root.join("db", "seeds", locale, "roles.rb")
load Rails.root.join("db", "seeds", locale, "predefined_diseases.rb")
load Rails.root.join("db", "seeds", locale, "predefined_symptomps.rb")
load Rails.root.join("db", "seeds", locale, "units.rb")
load Rails.root.join("db", "seeds", locale, "measurement_types.rb")
load Rails.root.join("db", "seeds", locale, "article_tags.rb")

# Seeds for local development
if Rails.env.development?
  load Rails.root.join("db", "seeds", locale, "users_with_data.rb")
  load Rails.root.join("db", "seeds", locale, "random_users.rb")
end

puts "Seeding done."
