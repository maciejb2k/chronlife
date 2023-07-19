class DashFormErrorComponent < ViewComponent::Base
  def initialize(model:, field:)
    @model = model
    @field = field
  end
end
