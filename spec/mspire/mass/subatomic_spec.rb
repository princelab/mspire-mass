require 'spec_helper'

require 'mspire/mass/subatomic'

describe Mspire::Mass::Subatomic do
  it 'provides all kinds of access to subatomic masses' do
    masses = Mspire::Mass::Subatomic.masses
    masses[:NEUTRON].should be_a(Float)
  end
end
