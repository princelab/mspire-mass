# Mspire::Mass

mspire library holding constants for mass lookup.  See [mspire-molecular_formula](https://github.com/princelab/mspire-molecular_formula) for mass or m/z methods.

## Installation

    gem install mspire-mass

## Examples

### Basic usage

```ruby
require 'mspire/mass'

#       <default>
# by   = :symbol | :string | :both
# type = :mono   | :avg
# case = :up     | :down

lookup = Mspire::Mass::Element.masses
# which defaults to this
lookup = Mspire::Mass::Element.masses(type: :mono, by: :symbol, case: :up)
lookup[:C]  # (carbon) => 

aas = Mspire::Mass::AA.masses(type: :mono, by: :symbol)
aas[:C] # (cysteine) => 

subatomic = Mspire::Mass::Subatomic.masses
subatomic[:ELECTRON]
subatomic[:NEUTRON]
subatomic[:PROTON]   # (same as subatomic[:H+])

# very common molecules (see Mspire::MolecularFormula to get mass from any mol formula)
Mspire::Mass::Common[:H2O] # (water) => 
```

For those who want to be able to access *everything* in one lookup table, we
downcase everything but amino acids and allow access by symbol or string

all = Mspire::Mass::All.masses(type: :mono)   # downcase everything but amino acids
all[:C]  # (cysteine) => 
all[:c]  # (carbon) => 
