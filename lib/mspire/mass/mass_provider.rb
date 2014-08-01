module Mspire
  module Mass
    module MassProvider
      DEFAULTS = {
        type: :mono,
        by: :symbol,
        case: :up,
      }

      def prepare_hash(hash, opts={})
        opt = Mspire::Mass::MassProvider::DEFAULTS.merge(opts)
        newhash = {}

        (upcase, downcase, symbol, string) = 
          ['case'.to_sym, :up, 'case'.to_sym, :down, :by, :symbol, :by, :string].each_slice(2).map do |opt_key, unique|
          [:both, unique].include?(opt[opt_key])
          end

        hash.each do |k,v| 
          keys = []
          if upcase
            keys << k.to_s  # <= assumes they start in proper up or mixed case
          end
          if downcase
            keys << k.to_s.downcase
          end
          if symbol
            final_keys = keys.map(&:to_sym)
          end
          if string
            string_keys = keys.map(&:to_s)
            final_keys ||= []
            final_keys.push(*string_keys)
          end
          final_keys.each {|key| newhash[key] = v }
        end
        newhash
      end

      # options:
      #
      #          <default>
      #     type: :mono   | :avg
      #     case: :up     | :down   | :both
      #     by:   :symbol | :string | :both
      #
      # accepts a hash with symbol or string keys.  The keys should be in
      # uppercase or mixed case to begin with.  the :up merely respects the
      # given case, while :down actively downcases.
      def masses(opts={})
        opt = DEFAULTS.merge(opts)
        prepare_hash(opt[:hash] || self.const_get(opt[:type].to_s.upcase << "_STRING"), opt)
      end
    end
  end
end
