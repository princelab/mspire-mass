require 'spec_helper'

require 'mspire/mass/common'

describe Mspire::Mass::Common do
  specify 'Mspire::Mass::Common::MONO_STRING provides string direct access to a few common masses' do
    masses = Mspire::Mass::Common::MONO_STRING
    masses['OH'].should be_within(0.0000001).of( 17.002739651629998 )
  end

  specify 'Mspire::Mass::Common::AVG_STRING provides string direct access to a few common avg masses' do
    avg = Mspire::Mass::Common::AVG_STRING
    avg['OH'].should == 17.00734
  end 
  
  specify 'gives mass of H2O and OH' do
    masses = Mspire::Mass::Common.masses
    masses[:H2O].should == 18.0105646837
    masses[:OH].should == 17.002739651629998
  end

  specify '#masses can return hash of mono|avg, symbols|strings|both, up|down|both' do
    masses = Mspire::Mass::Common.masses
    masses[:H2O].should == 18.0105646837

    masses = Mspire::Mass::Common.masses(type: :mono)
    masses[:H2O].should == 18.0105646837

    masses = Mspire::Mass::Common.masses(by: :symbol)
    masses[:H2O].should == 18.0105646837

    masses = Mspire::Mass::Common.masses(by: :symbol, case: :down)
    masses[:h2o].should == 18.0105646837

    masses = Mspire::Mass::Common.masses(type: :avg, by: :string)
    masses['H2O'].should == 18.01528

    masses = Mspire::Mass::Common.masses(type: :avg, by: :string, case: :down)
    masses['h2o'].should == 18.01528

    masses = Mspire::Mass::Common.masses(type: :avg, by: :symbol, case: :down)
    masses[:h2o].should == 18.01528
  end

end
