require "pagy/extras/headers"
require "pagy/extras/overflow"
require "pagy/extras/items"
require "pagy/extras/i18n"
require "pagy/extras/countless"

Pagy::DEFAULT[:items] = 25
Pagy::DEFAULT[:max_items] = 50
Pagy::DEFAULT[:overflow] = :last_page
Pagy::DEFAULT.freeze
