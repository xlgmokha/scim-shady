module Scim
  module Shady
    module Builders
      class User < Resource
        attr_accessor :external_id
        attr_accessor :username
        attr_accessor :display_name
        attr_accessor :nick_name
        attr_accessor :profile_url
        attr_accessor :user_type
        attr_accessor :title
        attr_accessor :preferred_language
        attr_accessor :locale
        attr_accessor :timezone
        attr_accessor :active

        def initialize
          @name = Name.new
          @emails = Emails.new
          @addresses = Addresses.new
          @phone_numbers = PhoneNumbers.new
          @instant_messengers = InstantMessengers.new
          @photos = Photos.new
          @groups = Groups.new
          @x509_certificates = X509Certificates.new
          @meta = Metadata.new
        end

        def name
          yield @name
        end

        def emails
          yield @emails
        end

        def addresses
          yield @addresses
        end

        def phone_numbers
          yield @phone_numbers
        end

        def instant_messengers
          yield @instant_messengers
        end

        def photos
          yield @photos
        end

        def groups
          yield @groups
        end

        def x509_certificates
          yield @x509_certificates
        end

        def meta
          yield @meta
        end

        def build
          Scim::Shady::User.new(to_json)
        end

        def to_json
          JSON.generate(to_h)
        end

        def to_h
          super.merge({
            'schemas' => [Schemas::USER],
            'externalId' => external_id,
            'userName' => username,
            'name' => @name.to_h,
            'displayName' => display_name,
            'nickName' => nick_name,
            'profile_url' => profile_url,
            'emails' => @emails.to_h,
            'addresses' => @addresses.to_h,
            'phoneNumbers' => @phone_numbers.to_h,
            'ims' => @instant_messengers.to_h,
            'photos' => @photos.to_h,
            'userType' => user_type,
            'title' => title,
            'preferredLanguage' => preferred_language,
            'locale' => locale,
            'timezone' => timezone,
            'active' => active,
            'groups' => @groups.to_h,
            'x509Certificates' => @x509_certificates.to_h,
          }).merge(@meta.to_h)
        end
      end

      class Name
        attr_accessor :family_name
        attr_accessor :given_name
        attr_accessor :middle_name
        attr_accessor :honorific_prefix
        attr_accessor :honorific_suffix

        def formatted
        end

        def to_h
          {
            'formatted' => formatted,
            'familyName' => family_name,
            'givenName' => given_name,
            'middleName' => middle_name,
            'honorificPrefix' => honorific_prefix,
            'honorificSuffix' => honorific_suffix,
          }
        end
      end

      class Emails
        def add(email, type:, primary: false)
          @items ||= []
          @items.push(value: email, type: type, primary: primary)
        end

        def to_h
          @items
        end
      end

      class Addresses
        def add(type:, street_address:, locality:, region:, postal_code:, country:, primary: false)
          @items ||= []
          @items.push(
            type: type,
            street_address: street_address,
            locality: locality,
            region: region,
            postal_code: postal_code,
            country: country,
            primary: primary,
          )
        end

        def to_h
          @items
        end
      end

      class PhoneNumbers
        def add(phone_number, type: :work)
          @items ||= []
          @items.push(value: phone_number, type: type)
        end

        def to_h
          @items
        end
      end

      class InstantMessengers
        def add(handle, type:)
          @items ||= []
          @items.push(value: handle, type: type)
        end

        def to_h
          @items
        end
      end

      class Photos
        def add(url, type: :photo)
          @items ||= []
          @items.push(value: url, type: type)
        end

        def to_h
          @items
        end
      end

      class Groups
        def add(id, url, display_name)
          @items ||= []
          @items.push(value: id, '$ref' => url, display: display_name)
        end

        def to_h
          @items
        end
      end

      class X509Certificates
        def add(certificate)
          @items ||= []
          @items.push(value: certificate.to_pem.gsub(/-----BEGIN CERTIFICATE-----/, '').gsub(/-----END CERTIFICATE-----/, ''))
        end

        def to_h
          @items
        end
      end
    end
  end
end
