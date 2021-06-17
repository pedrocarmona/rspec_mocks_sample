require 'rails_helper'

RSpec.describe "Checks", type: :request do
  let(:database_checks) { instance_double(CheckDatabase) }
  let(:database_checks_result) { { transactional: true, kv_store: true } }

  before do
    allow(CheckDatabase).to receive(:new).and_return(database_checks)
    allow(database_checks).to receive(:call).and_return(database_checks_result)
  end

  describe "GET /new" do
    it "returns http success" do
      get "/checks/new"
      expect(response).to have_http_status(:success)
    end

    it "checks the database" do
      get "/checks/new"

      expect(CheckDatabase).to have_received(:new).with(
        kv_store: true,
        transactional: true
      )
      expect(database_checks).to have_received(:call)
    end
  end
end
