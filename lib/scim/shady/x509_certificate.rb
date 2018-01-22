module Scim
  module Shady
    class X509Certificate
      def initialize(hash)
        @hash = hash
      end

      def value
        to_h['value']
      end

      def to_h
        @hash
      end
    end
  end
end
