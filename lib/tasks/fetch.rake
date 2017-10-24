# frozen_string_literal: true

namespace :fetch do
  desc 'Fetch rates'
  task rates: :environment do
    next if (11..19).exclude?(Time.zone.now.hour)
    rates = TinkoffRates.new
    rates.create_rates
  end
end
