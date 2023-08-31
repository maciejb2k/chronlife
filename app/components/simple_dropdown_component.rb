class SimpleDropdownComponent < ViewComponent::Base
  def initialize(button_class:, icon: "ri-more-fill")
    @icon = icon
    @button_class = button_class
  end
end
