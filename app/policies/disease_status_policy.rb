class DiseaseStatusPolicy < ApplicationPolicy
  def update?
    owner?
  end

  def destroy?
    owner?
  end

  def like?
    friend? || group_member?
  end

  def unlike?
    friend? || group_member?
  end

  def owner?
    record.disease.account.user == user
  end

  def friend?
    record.disease.account.friends.exists?(user.account.id)
  end

  def group_member?
    user.account.groups.exists?(predefined_disease: record.disease.predefined_disease)
  end
end
