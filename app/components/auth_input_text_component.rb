class AuthInputTextComponent < ViewComponent::Base
  def initialize(options = {})
    @form = options[:form]
    @model = options[:model]
    @type = options[:type]
    @field = options[:field]
    @label = options[:label]
    @options = options[:options] || {}

    set_default_options
  end

  def set_default_options
    error_class = @model.errors[@field].present? ? "auth-form__input--error" : ""
    @options[:class] = "auth-form__input #{error_class}"
  end
end
