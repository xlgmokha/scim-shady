module Scim
  module Shady
    class InstantMessenger
      def initialize(hash)
        @hash = hash
      end

      def value
        to_h['value']
      end

      def type
        to_h['type']
      end

      def to_h
        @hash
      end
    end
  end
end
