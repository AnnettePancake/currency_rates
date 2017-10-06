
# frozen_string_literal: true

namespace :fetch do
  desc 'Fetch rates'
  task rates: :environment do
    rates = TinkoffRates.new
    rates.create_rates
  end
end
