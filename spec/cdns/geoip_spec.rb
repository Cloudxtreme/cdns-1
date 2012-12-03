# encoding: utf-8
require "spec_helper"

module CDNS
  describe GeoIP do
    context "initialization" do
      it "receive database file path as params" do
        GeoIP.should_receive(:new).with(an_instance_of(String))
        GeoIP.new("database.bin")
      end

      it "load database in memory" do
        File.stub(:exists?).and_return(true)
        ::GeoIP::City.should_receive(:new).with("database.bin", :memory)
        GeoIP.new("database.bin")
      end

      it "raise expection if database file not exist" do
        File.stub(:exists?).and_return(false)
        expect { GeoIP.new("database.bin") }.to raise_error("GeoIP Database not found.")
      end
    end

    describe "#match" do
      subject { GeoIP.new("./spec/support/GeoLiteCity.dat") }

      [
        ["177.42.217.20", "BR", "Bahia"],
        ["76.73.7.210", "US", "Colorado"],
        ["50.115.118.19", "US", "Utah"],
        ["201.16.225.66", "BR", "Sao Paulo"],
        ["201.82.73.4", "BR", "Sao Paulo"],
        ["187.49.15.100", "BR", "Sao Paulo"],
        ["189.45.10.128", "BR", "Rio de Janeiro"],
        ["200.196.48.44", "BR", "Rio de Janeiro"],
        ["189.1.31.197", "BR", "Pernambuco"],
        ["201.62.35.18", "BR", "Espirito Santo"],
        ["187.86.96.143", "BR", "Minas Gerais"],
        ["200.198.128.104", "BR", "Rio Grande do Sul"],
        ["189.124.128.62", "BR", "Rio Grande do Norte"],
        ["200.155.32.41", "BR", "Parana"],
        # ["189.38.32.7", "BR", "Goias"],
        ["189.90.16.36", "BR", "Ceara"],
        ["189.90.48.7", "BR", "Santa Catarina"],
        # ["187.62.144.1", "BR", "Paraiba"],
        ["201.54.48.1", "BR", "Distrito Federal"],
        # ["177.66.104.1", "BR", "Para"],
      ].each do |ip, country, region|
        it "#{ip} match with #{region}, #{country}" do
          subject.match(ip).should == [country, region]
        end
      end
    end
  end
end
