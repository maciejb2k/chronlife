class Measurements::GenerateDayRaportService
  def initialize(date, account)
    @date = date
    @account = account
  end

  class PDFGenerationError < StandardError; end

  def call
    # Find all measurements for the given day
    measurements =
      @account
      .measurements
      .includes(measurement_type: :unit)
      .where(measurement_date: @date.all_day)
      .order(measurement_date: :asc)

    # Generate PDF file with measurements
    pdf_file = Prawn::Document.new do |pdf|
      pdf.font Rails.root.join("app/assets/fonts/Roboto-Regular.ttf"), style: :normal

      pdf.text "#{@account.full_name} (#{@account.user.email})"
      pdf.move_down 20

      pdf.text "Raport pomiarów z dnia: #{I18n.l(@date, format: '%d %B %Y')}"
      pdf.text "Wygenerowano: #{I18n.l(Time.zone.now, format: '%H:%M, %d %B %Y')}"
      pdf.move_down 20

      table_data = [["Typ pomiaru", "Wartość", "Jednostka", "Godzina"]]

      measurements.each do |measurement|
        type = I18n.t("activerecord.attributes.measurement_types.#{measurement.measurement_type.name}")
        value = measurement.value
        unit = measurement.measurement_type.unit.symbol
        date = I18n.l(measurement.measurement_date, format: "%H:%M")

        table_data << [type, value, unit, date]
      end

      pdf.table(table_data, header: true) do
        columns(1..3).align = :right
      end
    end

    pdf_string = StringIO.new(pdf_file.render)

    # Build a new measurement raport with the generated PDF file
    raport_name = I18n.t(
      "services.measurements.generate_day_raport_service.raport_name",
      date: I18n.l(@date, format: "%d %B %Y")
    )
    measurement_raport = @account.measurement_raports.build(
      name: raport_name, raport_type: "day", attachment: pdf_string
    )

    # Set the filename of the PDF file
    pdf_filename = "measurements_day_#{Time.zone.now.to_i}.pdf"
    measurement_raport.attachment.metadata["filename"] = pdf_filename

    # Save the measurement raport
    measurement_raport.save!
  end
end
