# frozen_string_literal: true

class TinkoffRates
  TINKOFF_API = 'https://www.tinkoff.ru/api/v1/currency_rates/'

  def initialize
    @data = JSON.parse(api_response)['payload']['rates']
  end

  def create_rates
    ActiveRecord::Base.transaction do
      Rate::CURRENCIES.each { |currency| create_rate(currency) }
    end
  end

  private

  def create_rate(currency)
    Rate.create!(
      sell: deposit_payments(currency)['sell'],
      buy: deposit_payments(currency)['buy'],
      currency: currency
    )
  end

  def api_response
    HTTParty.get(TINKOFF_API).body
  end

  def deposit_payments(currency)
    @data.find do |rate|
      rate['category'] == 'DepositPayments' &&
        rate['fromCurrency']['name'] == currency &&
        rate['toCurrency']['name'] == 'RUB'
    end
  end
end
