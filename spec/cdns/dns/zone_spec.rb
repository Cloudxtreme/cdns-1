require 'spec_helper'

module CDNS::DNS
  describe Zone, focus: true do
    context "initialization" do

      it "receive a hash with zone details" do
        Zone.should_receive(:new).with(instance_of(Hash))
        Zone.new({})
      end
    end
  end
end