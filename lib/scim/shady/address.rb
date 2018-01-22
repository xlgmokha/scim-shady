module Scim
  module Shady
    class Address
      def initialize(hash)
        @hash = hash
      end

      def street_address
        to_h['streetAddress']
      end

      def locality
        to_h['locality']
      end

      def region
        to_h['region']
      end

      def postal_code
        to_h['postalCode']
      end

      def country
        to_h['country']
      end

      def formatted
        "#{street_address}\n#{locality}, #{region} #{postal_code} #{country}"
      end

      def primary?
        to_h['primary']
      end

      def to_h
        @hash
      end
    end
  end
end
