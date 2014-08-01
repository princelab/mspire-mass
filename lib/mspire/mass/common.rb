require 'mspire/mass/util'
require 'mspire/mass/element'

module Mspire
  module Mass
    module Common
      mono_string = Mspire::Mass::Element::MONO_STRING
      avg_string = Mspire::Mass::Element::AVG_STRING

      MONO_STRING = {
        'H2O' => %w(H H O).map {|el| mono_string[el] }.reduce(:+),
        'OH' => %w(O H).map {|el| mono_string[el] }.reduce(:+),
      }

      AVG_STRING = {
        'H2O' => %w(H H O).map {|el| avg_string[el] }.reduce(:+),
        'OH' => %w(O H).map {|el| avg_string[el] }.reduce(:+),
      }

      class << self
        def masses(opts={})
          opt = Mspire::Mass::DEFAULTS.merge(opts)
          Mspire::Mass::Util.prepare_hash(Mspire::Mass::Common.const_get(opt[:type].to_s.upcase << "_STRING"), opt)
        end
      end
    end
  end
end
