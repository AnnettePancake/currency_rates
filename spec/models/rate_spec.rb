# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rate, type: :model do
  it { should validate_presence_of :sell }
  it { should validate_presence_of :buy }
  it { should validate_presence_of :currency }
end
