# frozen_string_literal: true

namespace :convert do
  desc 'Fetch rates'
  task rates_to_week: :environment do
    Rate::CURRENCIES.each do |currency|
      Rate.by_currency(currency)
          .group_by { |rate| rate.created_at.strftime('%Y-%m-%d') }
          .each { |_day, rates| rates[1..rates.size - 1].map(&:destroy) }
    end
  end
end
