require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:posts) }

    it { is_expected.to have_many(:comments) }

    it { is_expected.to have_many(:likes) }

    it { is_expected.to have_many(:friendships) }

    it { is_expected.to have_many(:inverse_friendships).class_name('Friendship') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_length_of(:name).is_at_most(20) }
  end
end
