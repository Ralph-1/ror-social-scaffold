require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }

    it { is_expected.to validate_length_of(:content).is_at_most(1000).with_message('1000 characters in post is the maximum allowed.') } # rubocop:disable Layout/LineLength
  end
end
