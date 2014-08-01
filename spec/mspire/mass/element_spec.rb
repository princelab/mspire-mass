require 'spec_helper'

require 'mspire/mass/element'

describe Mspire::Mass::Element do

  it 'provides string and symbol access to element masses' do
    mono = Mspire::Mass::Element::MONO_STRING
    mono['Se'].should == 79.9165213

    Mspire::Mass::Element.masses(type: :symbol)
    ...

    mono[:Se].should == mono['Se']
    Mspire::Mass::Element[:Se].should == mono[:Se]

    avg = Mspire::Mass::Element::AVG
    avg['Se'].should == 78.96
    avg[:Se].should == avg['Se']
  end
end
