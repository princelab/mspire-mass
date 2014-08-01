require 'mspire/mass/mass_provider'
require 'mspire/mass/element'

module Mspire
  module Mass
    module Common
      extend MassProvider

      MONO_STRING = {
        'H2O' => %w(H H O).map {|el| Element::MONO_STRING[el] }.reduce(:+),
        'OH' => %w(O H).map {|el| Element::MONO_STRING[el] }.reduce(:+),
      }

      AVG_STRING = {
        'H2O' => %w(H H O).map {|el| Element::AVG_STRING[el] }.reduce(:+),
        'OH' => %w(O H).map {|el| Element::AVG_STRING[el] }.reduce(:+),
      }

    end
  end
end
