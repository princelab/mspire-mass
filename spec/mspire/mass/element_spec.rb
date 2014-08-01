require 'spec_helper'

require 'mspire/mass/element'

describe Mspire::Mass::Element do

  specify 'Mspire::Mass::Element::MONO_STRING provides direct access to element masses' do
    mono_str = Mspire::Mass::Element::MONO_STRING
    mono_str['Se'].should == 79.9165213
  end

  specify 'Mspire::Mass::Element::AVG_STRING provides direct access to avg element masses' do
    avg = Mspire::Mass::Element::AVG_STRING
    avg['Se'].should == 78.96
  end

  specify '#masses can return hash of mono|avg, symbols|strings|both, up|down|both' do
    masses = Mspire::Mass::Element.masses
    masses[:Se].should == 79.9165213

    masses = Mspire::Mass::Element.masses(type: :mono)
    masses[:Se].should == 79.9165213

    masses = Mspire::Mass::Element.masses(by: :symbol)
    masses[:Se].should == 79.9165213

    masses = Mspire::Mass::Element.masses(by: :symbol, case: :down)
    masses[:se].should == 79.9165213

    masses = Mspire::Mass::Element.masses(type: :avg, by: :string)
    masses['Se'].should == 78.96

    masses = Mspire::Mass::Element.masses(type: :avg, by: :string, case: :down)
    masses['se'].should == 78.96

    masses = Mspire::Mass::Element.masses(type: :avg, by: :symbol, case: :down)
    masses[:se].should == 78.96
  end
end
