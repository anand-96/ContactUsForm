require 'rails_helper'
require 'faker'

RSpec.describe Contact, type: :model do
  let(:contact) { Fabricate(:contact) }

  describe 'schema' do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_column(:phone).of_type(:string) }
    it { should have_db_column(:message).of_type(:string) }
    it { should have_db_index(:email) }
  end

  describe '#create' do
    it { expect { contact.save }.to change(Contact, :count).by(1) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:message) }
    it { is_expected.to validate_length_of(:message) }
  end

  describe 'callbacks' do
    it 'should call callback after create' do
      expect(contact).to callback(:send_message).after(:create)
    end
  end
end
