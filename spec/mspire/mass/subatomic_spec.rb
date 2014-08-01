require 'spec_helper'

require 'mspire/mass/subatomic'

describe Mspire::Mass::Subatomic do

  specify 'Mspire::Mass::Subatomic::MONO_STRING provides direct access to subatomic masses' do
    masses = Mspire::Mass::Subatomic::MONO_STRING
    masses['NEUTRON'].should == 1.0086649156
  end

  specify 'Mspire::Mass::Subatomic::AVG_STRING provides direct access to subatomic masses (same values as mono for subatomic)' do
    masses = Mspire::Mass::Subatomic::AVG_STRING
    masses['NEUTRON'].should == 1.0086649156
  end

  specify 'gives mass of :ELECTRON (and :E), :NEUTRON, :PROTON (:H+ and :H_PLUS)' do
    masses = Mspire::Mass::Subatomic.masses
    masses[:ELECTRON].should == 0.0005486
    masses[:E].should == 0.0005486
    masses[:NEUTRON].should == 1.0086649156
    masses[:PROTON].should == 1.00727643207
    masses['H+'.to_sym].should == 1.00727643207
    masses[:H_PLUS].should == 1.00727643207
  end

  specify '#masses can return hash of mono|avg, symbols|strings|both, up|down|both' do
    masses = Mspire::Mass::Subatomic.masses
    masses[:ELECTRON].should == 0.0005486

    masses = Mspire::Mass::Subatomic.masses(type: :mono)
    masses[:ELECTRON].should == 0.0005486

    masses = Mspire::Mass::Subatomic.masses(by: :symbol)
    masses[:ELECTRON].should == 0.0005486

    masses = Mspire::Mass::Subatomic.masses(by: :symbol, case: :down)
    masses[:electron].should == 0.0005486

    masses = Mspire::Mass::Subatomic.masses(type: :avg, by: :string)
    masses['ELECTRON'].should == 0.0005486

    masses = Mspire::Mass::Subatomic.masses(type: :avg, by: :string, case: :down)
    masses['electron'].should == 0.0005486

    masses = Mspire::Mass::Subatomic.masses(type: :avg, by: :symbol, case: :down)
    masses[:electron].should == 0.0005486
  end

  specify 'can pass in own lookup hash' do
    masses = Mspire::Mass::Subatomic.masses(hash: {ELECTRON: 8.77})
    masses[:ELECTRON].should == 8.77
  end

end


