require 'rails_helper'
require 'faker'

RSpec.describe ContactsController, type: :controller do

  describe 'GET #new' do
    subject { get :new }

    it 'should render template' do
      expect(subject).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:params) { { contact: Fabricate.build(:contact).as_json } }

    context 'with valid parameters' do
      subject { post :create, params: params }

      it { expect { subject }.to change(Contact, :count).by(1) }

      it 'should create contact' do
        expect(subject).to redirect_to(new_contact_path)
        expect(flash[:success]).to eq('Message sent successfully')
      end

      it 'should enqueue sidekiq job' do
        subject
        expect(EmailWorker).to have_enqueued_sidekiq_job("send_message", params.values[0]["email"], params.values[0]["message"], "deliver_later")
      end
    end

    context 'with invalid parameters' do
      it 'should not take invalid email' do
        invalid_params = params
        invalid_params[:contact]["email"] = 'invalidEmail'
        expect { post :create, params: invalid_params }.to change { Contact.count }.by(0)

        expect(response).to render_template(:new)
      end

      it 'should not take invalid length for message' do
        invalid_params = params
        invalid_params[:contact]["message"] = Faker::Lorem.characters(number: 251)
        expect { post :create, params: invalid_params }.to change { Contact.count }.by(0)

        expect(response).to render_template(:new)
      end
    end
  end
end