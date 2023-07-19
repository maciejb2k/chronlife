module DiseaseSymptomsHelper
  def intensity_to_text(intensity)
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
end
