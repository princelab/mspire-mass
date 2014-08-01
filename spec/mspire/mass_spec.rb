require 'spec_helper'

require 'mspire/mass'

describe Mspire::Mass do
  specify 'require "mspire/mass" => requires Element, Subatomic, Common, and AA, but not "merged"' do
    %w(Element Subatomic Common AA).each do |mod|
      Mspire::Mass.const_get(mod).class.should == Module
    end
    expect { Mspire::Mass.const_get(Merged) }.to raise_error(NameError)
  end
end
