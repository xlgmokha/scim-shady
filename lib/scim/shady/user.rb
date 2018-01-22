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

    class User < Resource
      def username
        to_h['userName']
      end

      def external_id
        to_h['externalId']
      end

      def name
        Name.new(to_h)
      end

      def addresses
        to_h['addresses'].map { |x| Address.new(x) }
      end

      class << self
        def build
          builder do |builder|
            yield builder if block_given?
          end.build
        end

        def builder
          builder = builder_class.new
          yield builder if block_given?
          builder
        end

        def builder_class
          Scim::Shady::Builders::User
        end
      end
    end
  end
end
