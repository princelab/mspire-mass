require 'mspire/isotope'
require 'mspire/mass/mass_provider'

module Mspire
  module Mass
    module Element
      extend MassProvider

      AVG_STRING = {}
      MONO_STRING = {}
      Mspire::Isotope::BY_ELEMENT.each do |el, isotopes|
        AVG_STRING[el.to_s] = isotopes.first.average_mass
        MONO_STRING[el.to_s] = isotopes.find(&:mono).atomic_mass
      end

      MONO_STRING['D'] = Mspire::Isotope::BY_ELEMENT[:H].find {|iso| iso.element == :H && iso.mass_number == 2 }.atomic_mass

    end
  end
end
