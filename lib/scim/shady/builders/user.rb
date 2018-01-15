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
          super
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
            'displayName' => display_name,
            'nickName' => nick_name,
            'profile_url' => profile_url,
            'userType' => user_type,
            'title' => title,
            'preferredLanguage' => preferred_language,
            'locale' => locale,
            'timezone' => timezone,
            'active' => active,
          })
            .merge(@name.to_h)
            .merge(@emails.to_h)
            .merge(@addresses.to_h)
            .merge(@phone_numbers.to_h)
            .merge(@instant_messengers.to_h)
            .merge(@photos.to_h)
            .merge(@groups.to_h)
            .merge(@x509_certificates.to_h)
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
            'name' => {
              'formatted' => formatted,
              'familyName' => family_name,
              'givenName' => given_name,
              'middleName' => middle_name,
              'honorificPrefix' => honorific_prefix,
              'honorificSuffix' => honorific_suffix,
            }
          }
        end
      end

      class Emails
        def add(email, type:, primary: false)
          @items ||= []
          @items.push(value: email, type: type, primary: primary)
        end

        def to_h
          { 'emails' => @items }
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
          { 'addresses' => @items }
        end
      end

      class PhoneNumbers
        def add(phone_number, type: :work)
          @items ||= []
          @items.push(value: phone_number, type: type)
        end

        def to_h
          { 'phoneNumbers' => @items }
        end
      end

      class InstantMessengers
        def add(handle, type:)
          @items ||= []
          @items.push(value: handle, type: type)
        end

        def to_h
          { 'ims' => @items }
        end
      end

      class Photos
        def add(url, type: :photo)
          @items ||= []
          @items.push(value: url, type: type)
        end

        def to_h
          { 'photos' => @items }
        end
      end

      class Groups
        def add(id, url, display_name)
          @items ||= []
          @items.push(value: id, '$ref' => url, display: display_name)
        end

        def to_h
          { 'groups' => @items }
        end
      end

      class X509Certificates
        def add(certificate)
          @items ||= []
          @items.push(value: certificate.to_pem.gsub(/-----BEGIN CERTIFICATE-----/, '').gsub(/-----END CERTIFICATE-----/, ''))
        end

        def to_h
          { 'x509Certificates' => @items }
        end
      end
    end
  end
end
