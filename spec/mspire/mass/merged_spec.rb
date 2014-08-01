require 'spec_helper'
require 'mspire/mass/merged'

describe Mspire::Mass::Merged do
  it 'accesses elements by lower case and amino acids by upper case' do
    {
      'c' => 12.0,  # carbon
      'C' => 103.00918,  # cysteine
      'br' => 78.9183361,  # bromine
      'd' => 2.014101779,  # deuterium
      'D' => 115.0269430,  # aspartic acid
      'h+' => 1.00727646677, # proton
      'h' => 1.007825035,  # hydrogen
      'h2o' => 18.0105647, # water
      'oh' => 17.002739665, # oh
      'e' => 0.0005486, # electron
    }.each do |el, mass|
      Mspire::Mass::Merged::MONO_STRING[el].should_not be_nil
      Mspire::Mass::Merged::MONO_STRING[el].should be_within(0.00001).of(mass) 
    end

    { 'h' => 1.00794, 'he' => 4.002602, 'ni' => 58.6934, 'H' => 137.13928 }.each do |el, mass|
      Mspire::Mass::Merged::AVG_STRING[el].should_not be_nil
      Mspire::Mass::Merged::AVG_STRING[el].should be_within(0.00001).of(mass) 
    end
  end

  specify '#masses can return hash of mono|avg, symbols|strings|both' do
    masses = Mspire::Mass::Merged.masses
    masses[:D].should == 115.026943032
    masses[:d].should == 2.0141017778

    masses = Mspire::Mass::Merged.masses(type: :mono)
    masses[:D].should == 115.026943032
    masses[:d].should == 2.0141017778

    masses = Mspire::Mass::Merged.masses(by: :symbol)
    masses[:D].should == 115.026943032
    masses[:d].should == 2.0141017778

    masses = Mspire::Mass::Merged.masses(type: :avg, by: :string)
    masses['D'].should == 115.0874
    masses['d'].should be_nil  # there is no deuterium as an average mass!
    masses['c'].should == 12.0107
  end

  specify ':case => :up and => :down are meaningless' do
    masses = Mspire::Mass::Merged.masses(type: :avg, by: :string, case: :down)
    #masses = Mspire::Mass::Merged.masses(type: :avg, by: :string)
    masses['D'].should == 115.0874
    masses['c'].should == 12.0107
  end

end
