# frozen_string_literal: true

class Rate < ApplicationRecord
  CURRENCIES = %w[USD EUR].freeze

  validates :sell, :buy, :currency, presence: true

  scope :by_currency, ->(currency) { where(currency: currency) }
  scope :last_day, -> { where('created_at > ?', 1.day.ago) }

  class << self
    def last_rates(currency)
      by_currency(currency).last_day
    end

    def sell_values(currency)
      last_rates(currency).map { |rate| [rate.created_at.strftime('%H:00'), rate.sell] }
    end

    def buy_values(currency)
      last_rates(currency).map { |rate| [rate.created_at.strftime('%H:00'), rate.buy] }
    end
  end
end
