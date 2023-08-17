module SpecialistRequestsHelper
  def pending_request?
    current_account.specialist_requests.where(status: :pending).any?
  end
end
