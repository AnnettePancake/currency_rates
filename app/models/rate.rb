# frozen_string_literal: true

class Rate < ApplicationRecord
  CURRENCIES = %w[USD EUR].freeze

  validates :sell, :buy, :currency, presence: true

  scope :by_currency, ->(currency) { where(currency: currency) }
  scope :last_week, -> { where('created_at > ?', 1.week.ago).ordered }
  scope :ordered, -> { order(created_at: :asc) }

  class << self
    def last_rates(currency)
      by_currency(currency).last_week
    end

    def sell_values(currency)
      last_rates(currency).map { |rate| [rate.created_at.strftime('%d/%m/%Y'), rate.sell] }
    end

    def buy_values(currency)
      last_rates(currency).map { |rate| [rate.created_at.strftime('%d/%m/%Y'), rate.buy] }
    end

    def month_average(currency, type)
      rates = last_rates(currency)
      return ' - ' if rates.empty?
      (rates.pluck(type).sum / rates.size).round(2)
    end
  end
end
