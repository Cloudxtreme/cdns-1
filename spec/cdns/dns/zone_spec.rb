require 'spec_helper'

module CDNS::DNS
  describe Zone do
    let(:node_group) { mock(CDNS::CDN::NodeGroup).as_null_object }
    let(:zone_raw) { '{ "nodes": ["US", "NA"], "source": "127.0.0.1", "source_type": "A" }' }
    subject { described_class.new(zone_raw) }

    before do
      CDNS::CDN::NodeGroup.stub(:load).and_return(node_group)
    end

    context "initialization" do
      let(:json) { '{ "key": "value" }' }

      it "decode json data" do
        MultiJson.should_receive(:load).with(json, anything())
        Zone.new(json)
      end
    end

    describe "#nodes" do
      it "return all node groups" do
        CDNS::CDN::NodeGroup.should_receive(:load).exactly(2).times
        subject.nodes
      end
    end

    describe "#source" do
      it "return original source" do
        expect( subject.source ).to be_eql("127.0.0.1")
      end
    end

    describe "#source_type" do
      it "return source type" do
        expect( subject.source_type ).to be_eql("A")
      end
    end

    describe "#servers" do
      it "return source data if any node match with country and state" do
        node_group.stub(:match?).and_return(false)
        expect( subject.servers("foo", "bar") ).to be_eql(["A", "127.0.0.1"])
      end

      it "return servers address if a node match" do
        node_group.stub(:match?).and_return(true)
        node_group.stub(:addresses).and_return(['A', '127.0.0.2'])
        expect( subject.servers("foo", "bar") ).to be_eql(["A", "127.0.0.2"])
      end
    end
  end
end
