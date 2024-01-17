module AccountsHelper
  def current_account?(account)
    account == current_account
  end

  def friend?(friends, account)
    friends.include?(account.id)
  end

  def education_to_string(education)
    case education
    when "none"
      "Brak"
    when "primary"
      "Podstawowe"
    when "secondary"
      "Średnie"
    when "bachelor"
      "Licencjat"
    when "master"
      "Magister"
    when "doctorate"
      "Doktorat"
    else
      "Nieznane wykształcenie"
    end
  end
end
