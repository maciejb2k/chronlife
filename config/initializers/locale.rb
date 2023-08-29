require "i18n/backend/pluralization"

I18n.available_locales = %i[pl en]
I18n.default_locale = :pl

I18n::Backend::Simple.include I18n::Backend::Pluralization
