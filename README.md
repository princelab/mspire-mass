# Mspire::Mass

mspire library holding constants for mass lookup.  Uses NIST masses (where applicable) upstream from [mspire-isotope](https://github.com/princelab/mspire-isotope).  See [mspire-molecular_formula](https://github.com/princelab/mspire-molecular_formula) for mass or m/z methods for larger molecular formulas.

## Installation

    gem install mspire-mass

## Examples

### MONO\_STRING and AVG\_STRING

A simple hash may be accessed directly from the various modules:

```ruby
require 'mspire/mass'

Mspire::Mass::Element::MONO_STRING['C']         # => 12.0
Mspire::Mass::AA::MONO_STRING['C']              # => 103.0091844778 (residue)
Mspire::Mass::Subatomic::MONO_STRING['NEUTRON'] # => 1.0086649156
Mspire::Mass::Common::MONO_STRING['H2O']        # => 18.0105646837

# similar for average masses
Mspire::Mass::Element::AVG_STRING['C']          # => 12.0107

# note that elements are accessed in mixed case by default
Mspire::Mass::Element::MONO_STRING['Se']        # => 79.9165213
```

A hash where everything but the amino acids is downcased can also be accessed

```ruby
require 'mspire/mass/merged'  # <- must be required explicitly
Mspire::Mass::Merged::MONO_STRING['C']   # (cysteine) => 103.0091844778
Mspire::Mass::Merged::MONO_STRING['c']   # (carbon)   => 12.0
Mspire::Mass::Merged::MONO_STRING['h2o'] # (water)    => 18.0105646837
Mspire::Mass::Merged::MONO_STRING['e']   # (or 'electron') => 0.0005486 
```

### <Module>.masses

A mass hash can be created in a variety of forms depending on your
needs/preferences.

    ---------------------------------
          <default>
    ---------------------------------
    type = :mono   | :avg
    by   = :symbol | :string | :both
    case = :up     | :down   | :both

```ruby
el_masses = Mspire::Mass::Element.masses
# which defaults to this
el_masses = Mspire::Mass::Element.masses(type: :mono, by: :symbol, case: :up)
el_masses[:C]  # (carbon) => 12.0

aas = Mspire::Mass::AA.masses(type: :avg, by: :string)
aas['C'] # (cysteine) => 103.1429

subatomic = Mspire::Mass::Subatomic.masses
subatomic[:PROTON]   # (same as subatomic[:'H+'] or subatomic[:H_PLUS]) # => 1.00727643207

### Subatomic constants on Mspire::Mass

The strings that play nice are defined as constants on Mspire::Mass so you can
do this:

```ruby
Mspire::Mass::ELECTRON #=> 0.0005486
Mspire::Mass::PROTON   #=> 1.00727643207
Mspire::Mass::NEUTRON  #=> 1.0086649156
```
