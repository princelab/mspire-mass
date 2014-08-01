require 'spec_helper'

require 'mspire/mass/aa'

describe Mspire::Mass::AA do
  specify 'Mspire::Mass::AA::MONO_STRING provides direct access to amino acid masses (precalculated)' do
    mono = Mspire::Mass::AA::MONO_STRING
    mono['C'].should == 103.0091844778
  end

  specify 'Mspire::Mass::AA::AVG_STRING provides direct access to avg amino acid masses (precalculated)' do
    avg = Mspire::Mass::AA::AVG_STRING
    avg['C'].should == 103.1429
  end

  specify 'also gives access to: "*", "B", "O", "U", "X" (averagine), and "Z"' do
    mono = Mspire::Mass::AA::MONO_STRING
    avg = Mspire::Mass::AA::AVG_STRING
    [mono, avg].each do |hash|
      ["*", "B", "O", "U", "X", "Z"].each do |key|
        hash.key?(key).should be_true
      end
    end
  end

  specify '#masses can return hash of mono|avg, symbols|strings|both, up|down|both' do
    masses = Mspire::Mass::AA.masses
    masses[:C].should == 103.0091844778

    masses = Mspire::Mass::AA.masses(type: :mono)
    masses[:C].should ==103.0091844778

    masses = Mspire::Mass::AA.masses(by: :symbol)
    masses[:C].should ==103.0091844778

    masses = Mspire::Mass::AA.masses(by: :symbol, case: :down)
    masses[:c].should ==103.0091844778

    masses = Mspire::Mass::AA.masses(type: :avg, by: :string)
    masses['C'].should == 103.1429 

    masses = Mspire::Mass::AA.masses(type: :avg, by: :string, case: :down)
    masses['c'].should == 103.1429 

    masses = Mspire::Mass::AA.masses(type: :avg, by: :symbol, case: :down)
    masses[:c].should == 103.1429 
  end

  specify 'can pass in own lookup hash' do
    masses = Mspire::Mass::AA.masses(hash: {C: 66}, case: :down)
    masses[:c].should == 66
  end
end
