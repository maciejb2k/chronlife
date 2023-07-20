module ApplicationHelper
  include Pagy::Frontend

  def user_full_name
    return unless current_user

    "#{current_user.account.first_name} #{current_user.account.last_name}"
  end

  def user_username
    return unless current_user

    "@#{current_user.account.username}"
  end

  def severity_to_string(severity)
    case severity
    when 1
      "Ładogne"
    when 2
      "Umiarkowane"
    when 3
      "Dotkliwe"
    when 4
      "Utrudniające życie"
    when 5
      "Rujnujące życie"
    else
      "Uciążliwe"
    end
  end

  def intensity_to_emoji(intensity)
    case intensity
    when 1
      "🙂"
    when 2
      "😐"
    when 3
      "🙁"
    when 4
      "😢"
    when 5
      "😫"
    else
      "😡"
    end
  end

  def effectiveness_to_emoji(intensity)
    case intensity
    when 1
      "😫 Nie działa"
    when 2
      "🙁 Nie pomaga"
    when 3
      "😐 Średnio pomaga"
    when 4
      "🙂 Pomaga"
    when 5
      "😀 Bardzo pomaga"
    else
      "😡"
    end
  end
end
