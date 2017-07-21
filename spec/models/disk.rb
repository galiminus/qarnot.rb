require "spec_helper"
require "qarnot"

describe Qarnot::Model::Disk do
  context "as an authenticated user" do
    subject(:record) { Qarnot::Model::Disk.new(auth: Qarnot::Auth.new(api_token: "token"), uuid: "1", description: "description") }

    it "can update disk directly" do
      stub_request(:put, "https://api.qarnot.com/disks/1")

      record.update(description: "new description")
      expect(WebMock).to have_requested(:put, "https://api.qarnot.com/disks/1").with(body: JSON.generate(description: "new description"))
    end
  end
end
