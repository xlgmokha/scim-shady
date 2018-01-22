module Scim
  module Shady
    class Name
      def initialize(hash)
        @hash = hash
      end

      def formatted
        to_h['formatted']
      end

      def to_h
        @hash['name']
      end
    end
  end
end
