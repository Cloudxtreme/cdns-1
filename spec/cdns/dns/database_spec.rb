require "spec_helper"

module CDNS::DNS
  describe Database do
    let(:store) { double("Redis").as_null_object }
    subject { Database.new(store) }

    describe "#zone" do
      it "retrive for store" do
        store.should_receive(:hget).with("zones", 123456)
        subject.zone(123456)
      end

      it "return a instance of CDNS::DNS::Zone" do
        store.stub(:hget).and_return({})
        expect(subject.zone(123456)).to be_instance_of(CDNS::DNS::Zone)
      end
    end

    describe "#soa" do
      it "if no params are informed return all SOA DNS details" do
        store.should_receive(:hgetall).with("settings.soa")
        subject.soa
      end

      it "if a key is informed, return value for the key" do
        store.should_receive(:hget).with("settings.soa", "noc")
        subject.soa("noc")
      end

      it "if a key and value are informed, update the value in store" do
        store.should_receive(:hset).with("settings.soa", "noc", "test")
        subject.soa("noc", "test")
      end
    end
  end
end
