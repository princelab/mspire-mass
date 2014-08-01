require 'mspire/mass/util'
require 'mspire/mass/element'

module Mspire
  module Mass
    module Subatomic
      MONO_SYMBOL = {
        ELECTRON: 0.0005486,   # www.mikeblaber.org/oldwine/chm1045/notes/Atoms/.../Atoms03.htm
        NEUTRON: 1.0086649156,
      }
      # 'h+' => 1.00727646677,
      MONO_SYMBOL[:PROTON] = MONO_SYMBOL['H+'.to_sym] = Mspire::Mass::Element[:H] - MONO_SYMBOL[:electron]
      MONO_SYMBOL[:E] = MONO_SYMBOL[:ELECTRON]

      # accepts same arguments as Mspire::Masses::Element.masses but note that
      # both :mono and :avg will give the same values for subatomic entitities
      class << self
        def masses(opts={})
          Mspire::Mass::Util.prepare_hash(MONO_SYMBOL, opts)
        end
      end

    end
  end
end
