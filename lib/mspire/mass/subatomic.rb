require 'mspire/mass/mass_provider'
require 'mspire/mass/element'

module Mspire
  module Mass
    module Subatomic
      extend MassProvider

      MONO_STRING = {
        'ELECTRON' => 0.0005486,   # www.mikeblaber.org/oldwine/chm1045/notes/Atoms/.../Atoms03.htm
        'NEUTRON' => 1.0086649156,
      }
      # 'h+' => 1.00727646677,
      MONO_STRING['PROTON'] = MONO_STRING['H_PLUS'] = MONO_STRING['H+'] = Mspire::Mass::Element::MONO_STRING['H'] - MONO_STRING['ELECTRON']
      MONO_STRING['E'] = MONO_STRING['ELECTRON']

      AVG_STRING = MONO_STRING.dup
    end
  end
end
