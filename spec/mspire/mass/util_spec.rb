require 'spec_helper'

require 'mspire/mass/util'

describe Mspire::Mass::Util do
  subject do
    { :C => 3, :E => 5 }
  end
  it 'can prepare hashes' do
    new_hash = Mspire::Mass::Util.prepare_hash(subject) 
    new_hash.should == {:C=>3, :E=>5}
  end

  it 'can prepare hashes with downcase keys' do
    new_hash = Mspire::Mass::Util.prepare_hash(subject, case: :down) 
    new_hash.should == {:c=>3, :e=>5}
  end

  it 'can prepare hashes with upcase keys' do
    new_hash = Mspire::Mass::Util.prepare_hash(subject, case: :up) 
    new_hash.should == {:C=>3, :E=>5}
  end

  it 'can prepare hashes with either case keys' do
    new_hash = Mspire::Mass::Util.prepare_hash(subject, case: :both) 
    new_hash.sort.should == {:c=>3, :e=>5, :C=>3, :E=>5}.sort
  end

  it 'can prepare hashes with symbol keys' do
    new_hash = Mspire::Mass::Util.prepare_hash(subject, by: :symbol) 
    new_hash.should == {:C=>3, :E=>5}
  end

  it 'can prepare hashes with symbol keys even if string keys were used' do
    yikes = subject.map {|k,v| [k.to_s, v]}.to_h
    yikes.should == {"C"=>3, "E"=>5}
    new_hash = Mspire::Mass::Util.prepare_hash(yikes, by: :symbol) 
    new_hash.should == {:C=>3, :E=>5}
  end

  it 'can prepare hashes with string keys' do
    new_hash = Mspire::Mass::Util.prepare_hash(subject, by: :string) 
    new_hash.should == {'C'=>3, 'E'=>5}
  end

  it 'can prepare hashes with both string and symbol keys' do
    new_hash = Mspire::Mass::Util.prepare_hash(subject, by: :both) 
    # could fail if sort order is done differently
    new_hash.should == {:C=>3, :E=>5, 'C'=>3, 'E'=>5}
  end

  it 'can prepare hashes with both string and symbol keys and upper and lower case' do
    new_hash = Mspire::Mass::Util.prepare_hash(subject, by: :both, case: :both) 
    # could fail if sort order is done differently
    new_hash.should == {:C=>3, :c=>3, "C"=>3, "c"=>3, :E=>5, :e=>5, "E"=>5, "e"=>5}
  end
end
