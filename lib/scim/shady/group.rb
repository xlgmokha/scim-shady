module Scim
  module Shady
    class Group
      def initialize(hash)
        @hash = hash
      end

      def value
        to_h['value']
      end

      def reference
        to_h['$ref']
      end

      def display
        to_h['display']
      end

      def to_h
        @hash
      end
    end
  end
end
