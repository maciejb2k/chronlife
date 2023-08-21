module DashboardLayout
  extend ActiveSupport::Concern

  included do
    layout "dashboard"
  end
end
