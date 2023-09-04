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
    begin
      pdf_file = Prawn::Document.new do |pdf|
        measurements.each do |measurement|
          pdf.text "#{measurement.measurement_type.name}: #{measurement.value} #{measurement.measurement_type.unit.name} - #{measurement.measurement_date}"
        end
      end
      pdf_string = StringIO.new(pdf_file.render)
    rescue StandardError
      raise PDFGenerationError
    end

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
