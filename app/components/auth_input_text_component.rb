class AuthInputTextComponent < ViewComponent::Base
  def initialize(form:, model:, type:, field:, label: nil, options: {})
    @form = form
    @model = model
    @type = type
    @field = field
    @label = label
    @options = options

    set_default_options
  end

  def set_default_options
    error_class = @model.errors[@field].present? ? "auth-form__input--error" : ""
    @options[:class] = "auth-form__input #{error_class}"
  end
end
