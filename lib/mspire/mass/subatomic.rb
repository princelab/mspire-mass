require 'mspire/mass/util'
require 'mspire/mass/element'

module Mspire
  module Mass
    module Subatomic
      MONO_STRING = {
        'ELECTRON' => 0.0005486,   # www.mikeblaber.org/oldwine/chm1045/notes/Atoms/.../Atoms03.htm
        'NEUTRON' => 1.0086649156,
      }
      # 'h+' => 1.00727646677,
      MONO_STRING['PROTON'] = MONO_STRING['H+'] = Mspire::Mass::Element::MONO_STRING['H'] - MONO_STRING['ELECTRON']
      MONO_STRING['E'] = MONO_STRING['ELECTRON']

      # accepts same arguments as Mspire::Masses::Element.masses but note that
      # both :mono and :avg will give the same values for subatomic entitities
      class << self
        def masses(opts={})
          Mspire::Mass::Util.prepare_hash(MONO_STRING, opts)
        end
      end

    end
  end
end
