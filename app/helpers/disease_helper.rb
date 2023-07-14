module DiseaseHelper
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
end
