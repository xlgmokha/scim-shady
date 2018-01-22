module Scim
  module Shady
    class User < Resource
      include Buildable

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

      def self.builder_class
        Scim::Shady::Builders::User
      end
    end
  end
end
