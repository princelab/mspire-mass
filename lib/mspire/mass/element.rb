require 'mspire/isotope'
require 'mspire/mass/util'

module Mspire
  module Mass
    module Element

      AVG_STRING = {}
      MONO_STRING = {}
      Mspire::Isotope::BY_ELEMENT.each do |el, isotopes|
        AVG_STRING[el.to_s] = isotopes.first.average_mass
        MONO_STRING[el.to_s] = isotopes.find(&:mono).atomic_mass
      end

      MONO_STRING['D'] = Mspire::Isotope::BY_ELEMENT[:H].find {|iso| iso.element == :H && iso.mass_number == 2 }.atomic_mass

      def masses(opts={})
        opt = Mspire::Mass::DEFAULTS.merge(opts)
        Mspire::Mass::Util.prepare_hash(Mspire::Mass::Element.const_get(opt[:type].upcase << "_STRING"), opt)
      end
    end
  end
end
