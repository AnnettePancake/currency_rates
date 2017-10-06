# frozen_string_literal: true

class RatesController < ApplicationController
  before_action :fetch_rates, only: :index

  def index; end

  private

  def fetch_rates
    Rate::CURRENCIES.each do |currency|
      buy_data = { name: currency, data: Rate.buy_values(currency) }
      sell_data = { name: currency, data: Rate.sell_values(currency) }

      gon.push("#{currency.downcase}_buy_rates" => buy_data)
      gon.push("#{currency.downcase}_sell_rates" => sell_data)
    end
  end
end
