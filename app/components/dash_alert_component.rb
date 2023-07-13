class DashAlertComponent < ViewComponent::Base
  def initialize(type: :info)
    @type = type.to_s
  end
end
