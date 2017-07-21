require "spec_helper"
require "qarnot"

describe Qarnot::Collection::Disks do
  context "as an authenticated user" do
    subject(:collection) { Qarnot::Auth.new(api_token: "token").disks }

    it "can list disks" do
      stub_request(:get, "https://api.qarnot.com/disks").to_return(body: [
        {
          uuid: "1"
        },
        {
          uuid: "2"
        }
      ].to_json)

      disks = collection.all

      expect(disks.count).to eq(2)
      expect(disks.map(&:uuid)).to eq(["1", "2"])
    end

    it "can find disk" do
      stub_request(:get, "https://api.qarnot.com/disks/1").to_return(body:
        {
          uuid: "1"
        }.to_json)

      disk = collection.find("1")

      expect(disk.uuid).to eq("1")
    end
  end
end
