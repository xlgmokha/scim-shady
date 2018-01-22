module Scim
  module Shady
    class PhoneNumber
      def initialize(hash)
        @hash = hash
      end

      def value
        to_h['value']
      end

      def type
        to_h['type']
      end

      def work?
        type == 'work'
      end

      def mobile?
        type == 'mobile'
      end

      def to_h
        @hash
      end
    end
  end
end
