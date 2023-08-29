require "i18n/backend/pluralization"

# Permitted locales available for the application
I18n.available_locales = %i[pl en]

# Set default locale to something other than :en
I18n.default_locale = :pl

I18n::Backend::Simple.include I18n::Backend::Pluralization
