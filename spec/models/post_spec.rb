require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:category) { create(:category) }

  it 'has a valid factory' do
    expect(build(:post)).to be_valid
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to belong_to(:category) }
  end
end
