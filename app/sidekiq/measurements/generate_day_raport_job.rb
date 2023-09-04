class Measurements::GenerateDayRaportJob
  include Sidekiq::Job

  def perform(day, account_id)
    account = Account.find(account_id)

    begin
      date = Date.parse(day)
    rescue TypeError, Date::Error
      return
    end

    Measurements::GenerateDayRaportService.new(date, account).call
  end
end
