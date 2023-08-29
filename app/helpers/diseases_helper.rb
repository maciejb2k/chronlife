module DiseasesHelper
  def severity_to_string(severity)
    case severity
    when 1
      t("diseases.severity.one")
    when 2
      t("diseases.severity.two")
    when 3
      t("diseases.severity.three")
    when 4
      t("diseases.severity.four")
    when 5
      t("diseases.severity.five")
    else
      t("diseases.severity.unknown")
    end
  end
end
