require 'mspire/mass/mass_provider'
require 'mspire/mass/element'
require 'mspire/mass/common'
require 'mspire/mass/aa'
require 'mspire/mass/subatomic'
require 'mspire/mass'

module Mspire
  module Mass
    # provides hashes with both Amino Acids (uppercase letters) and elements
    # (lowercased) along with common abbreviations
    module Merged
      extend MassProvider

      class << self
        def downcase_keys(hash)
          Hash[ hash.map {|key,val| [key.to_s.downcase, val] } ]
        end

        def masses(opts={})
          # force upper case (which merely respects the case given)
          super(opts.merge(case: :up))
        end
      end

      MONO_STRING = downcase_keys( Element::MONO_STRING )
        .merge( downcase_keys( Common::MONO_STRING ) )
        .merge( AA::MONO_STRING )
        .merge( downcase_keys( Subatomic::MONO_STRING ) )

      AVG_STRING = downcase_keys( Element::AVG_STRING )
        .merge( downcase_keys( Common::AVG_STRING ) )
        .merge( AA::AVG_STRING )
        .merge( downcase_keys( Subatomic::AVG_STRING ) )  

    end
  end
end
