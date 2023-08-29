module DiseaseStatusesHelper
  def liked?(statuses, status)
    statuses.to_a.include?(status)
  end
end
