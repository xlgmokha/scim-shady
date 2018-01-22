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
    class Photo
      def initialize(hash)
        @hash = hash
      end

      def value
        to_h['value']
      end

      def type
        to_h['type']
      end

      def photo?
        type == 'photo'
      end

      def thumbnail?
        type == 'thumbnail'
      end

      def to_h
        @hash
      end
    end
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

      def phone_numbers
        to_h['phoneNumbers'].map { |x| PhoneNumber.new(x) }
      end

      def instant_messengers
        to_h['ims'].map { |x| InstantMessenger.new(x) }
      end

      def photos
        to_h['photos'].map { |x| Photo.new(x) }
      end

      def user_type
        to_h['userType']
      end

      def title
        to_h['title']
      end

      def preferred_language
        to_h['preferredLanguage']
      end

      def locale
        to_h['locale']
      end

      def timezone
        to_h['timezone']
      end

      def active?
        to_h['active']
      end

      def groups
        to_h['groups'].map { |x| Group.new(x) }
      end

      def x509_certificates
        to_h['x509Certificates'].map { |x| X509Certificate.new(x) }
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
