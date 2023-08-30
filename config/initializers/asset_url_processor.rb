# Workaround for `image-url` in scss files

class AssetUrlProcessor
  def self.call(input)
    context = input[:environment].context_class.new(input)
    data = input[:data].gsub(/(\w*)-url\(\s*["']?(?!(?:\#|data|http))([^"'\s)]+)\s*["']?\)/) do |_match|
      "url(#{context.asset_path(::Regexp.last_match(2), type: ::Regexp.last_match(1))})"
    end
    { data: }
  end
end

Sprockets.register_postprocessor "text/css", AssetUrlProcessor
