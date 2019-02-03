module Scim
  module Shady
    class User < ::Scim::Kit::V2::Resource
      def initialize(attributes = {})
        super(schemas: [self.class.schema], attributes: attributes)
      end

      def self.schema(location: "/v2/Schemas/#{::Scim::Kit::V2::Schemas::USER}")
        schema = ::Scim::Kit::V2::Schema.new(id: ::Scim::Kit::V2::Schemas::USER, name: 'User', location: location)
        schema.add_attribute(name: :user_name) do |x|
          x.multi_valued = false
          x.description = "Unique identifier for the User, typically used by the user to directly authenticate to the service provider.  Each User MUST include a non-empty userName value.  This identifier MUST be unique across the service provider's entire set of Users.  REQUIRED."
          x.required = true
          x.case_exact = false
          x.mutability = :read_write
          x.returned = :default
          x.uniqueness = :server
        end
        schema.add_attribute(name: :name, type: :complex) do |x|
          x.multi_valued = false
          x.description = "The components of the user's real name.  Providers MAY return just the full name as a single string in the formatted sub-attribute, or they MAY return just the individual component attributes using the other sub-attributes, or they MAY return both.  If both variants are returned, they SHOULD be describing the same name, with the formatted name indicating how the component attributes should be combined."
          x.required = false
          x.mutability = :read_write
          x.returned = :default
          x.uniqueness = :none
          x.add_attribute(name: :formatted) do |y|
            y.multi_valued = false
            y.description = "The full name, including all middle names, titles, and suffixes as appropriate, formatted for display (e.g., 'Ms. Barbara J Jensen, III')."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :family_name) do |y|
            y.multi_valued = false
            y.description = "The family name of the User, or last name in most Western languages (e.g., 'Jensen' given the full name 'Ms. Barbara J Jensen, III')."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :given_name) do |y|
            y.multi_valued = false
            y.description = "The given name of the User, or first name in most Western languages (e.g., 'Barbara' given the full name 'Ms. Barbara J Jensen, III')."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :middle_name) do |y|
            y.multi_valued = false
            y.description = "The middle name(s) of the User (e.g., 'Jane' given the full name 'Ms. Barbara J Jensen, III')."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :honorific_prefix) do |y|
            y.multi_valued = false
            y.description = "The honorific prefix(es) of the User, or title in most Western languages (e.g., 'Ms.' given the full name 'Ms. Barbara J Jensen, III')."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :honorific_suffix) do |y|
            y.multi_valued = false
            y.description = "The honorific suffix(es) of the User, or suffix in most Western languages (e.g., 'III' given the full name 'Ms. Barbara J Jensen, III')."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
        end
        schema.add_attribute(name: :display_name, type: :string) do |x|
          x.multi_valued = false
          x.description = "The name of the User, suitable for display to end-users.  The name SHOULD be the full name of the User being described, if known."
          x.required = false
          x.case_exact = false
          x.mutability = :read_write
          x.returned = :default
          x.uniqueness = :none
        end
        schema.add_attribute(name: :nick_name, type: :string) do |x|
          x.multi_valued = false
          x.description = "The casual way to address the user in real life, e.g., 'Bob' or 'Bobby' instead of 'Robert'.  This attribute SHOULD NOT be used to represent a User's username (e.g., 'bjensen' or 'mpepperidge')."
          x.required = false
          x.case_exact = false
          x.mutability = :read_write
          x.returned = :default
          x.uniqueness = :none
        end
        schema.add_attribute(name: :preferred_language, type: :string) do |x|
          x.multi_valued = false
          x.description = "Indicates the User's preferred written or spoken language.  Generally used for selecting a localized user interface; e.g., 'en_US' specifies the language English and country US."
          x.required = false
          x.case_exact = false
          x.mutability = :read_write
          x.returned = :default
          x.uniqueness = :none
        end
        schema.add_attribute(name: :locale, type: :string) do |x|
          x.multi_valued = false
          x.description = "Used to indicate the User's default location for purposes of localizing items such as currency, date time format, or numerical representations."
          x.required = false
          x.case_exact = false
          x.mutability = :read_write
          x.returned = :default
          x.uniqueness = :none
        end
        schema.add_attribute(name: :timezone, type: :string) do |x|
          x.multi_valued = false
          x.description = "The User's time zone in the 'Olson' time zone database format, e.g., 'America/Los_Angeles'."
          x.required = false
          x.case_exact = false
          x.mutability = :read_write
          x.returned = :default
          x.uniqueness = :none
        end
        schema.add_attribute(name: :active, type: :boolean) do |x|
          x.multi_valued = false
          x.description = "A Boolean value indicating the User's administrative status."
          x.required = false
          x.mutability = :read_write
          x.returned = :default
        end
        schema.add_attribute(name: :password, type: :string) do |x|
          x.multi_valued = false
          x.description = "The User's cleartext password.  This attribute is intended to be used as a means to specify an initial password when creating a new User or to reset an existing User's password."
          x.required = false
          x.case_exact = false
          x.mutability = :write_only
          x.returned = :never
          x.uniqueness = :none
        end
        schema.add_attribute(name: :emails, type: :complex) do |x|
          x.multi_valued = true
          x.description = "Email addresses for the user.  The value SHOULD be canonicalized by the service provider, e.g., 'bjensen@example.com' instead of 'bjensen@EXAMPLE.COM'.  Canonical type values of 'work', 'home', and 'other'."
          x.required = false
          x.case_exact = false
          x.mutability = :read_write
          x.returned = :default
          x.uniqueness = :none
          x.add_attribute(name: :value, type: :string) do |y|
            y.multi_valued = false
            y.description = "Email addresses for the user.  The value SHOULD be canonicalized by the service provider, e.g., 'bjensen@example.com' instead of 'bjensen@EXAMPLE.COM'.  Canonical type values of 'work', 'home', and 'other'."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :display, type: :string) do |y|
            y.multi_valued = false
            y.description = "A human-readable name, primarily used for display purposes.  READ-ONLY."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :type, type: :string) do |y|
            y.multi_valued = false
            y.description = "A label indicating the attribute's function, e.g., 'work' or 'home'."
            y.required = false
            y.case_exact = false
            y.canonical_values = ['work', 'home', 'other']
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :primary, type: :boolean) do |y|
            y.multi_valued = false
            y.description = "A Boolean value indicating the 'primary' or preferred attribute value for this attribute, e.g., the preferred mailing address or primary email address.  The primary attribute value 'true' MUST appear no more than once."
            y.required = false
            y.mutability = :read_write
            y.returned = :default
          end
        end
        schema.add_attribute(name: :phone_numbers, type: :complex) do |x|
          x.multi_valued = true
          x.description = "Phone numbers for the User.  The value SHOULD be canonicalized by the service provider according to the format specified in RFC 3966, e.g., 'tel:+1-201-555-0123'.  Canonical type values of 'work', 'home', 'mobile', 'fax', 'pager', and 'other'."
          x.required = false
          x.mutability = :read_write
          x.returned = :default
          x.add_attribute(name: :value, type: :string) do |y|
            y.multi_valued = false
            y.description = "Phone number of the User."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :display, type: :string) do |y|
            y.multi_valued = false
            y.description = "A human-readable name, primarily used for display purposes.  READ-ONLY."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :type, type: :string) do |y|
            y.multi_valued = false
            y.description = "A label indicating the attribute's function, e.g., 'work', 'home', 'mobile'."
            y.required = false
            y.case_exact = false
            y.canonical_values = ['work', 'home', 'mobile', 'fax', 'pager', 'other']
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :primary, type: :boolean) do |y|
            y.multi_valued = false
            y.description = "A Boolean value indicating the 'primary' or preferred attribute value for this attribute, e.g., the preferred phone number or primary phone number.  The primary attribute value 'true' MUST appear no more than once."
            y.required = false
            y.mutability = :read_write
            y.returned = :default
          end
        end
        schema.add_attribute(name: :ims, type: :complex) do |x|
          x.multi_valued = true
          x.description = "Instant messaging addresses for the User."
          x.required = false
          x.mutability = :read_write
          x.returned = :default
          x.add_attribute(name: :value, type: :string) do |y|
            y.multi_valued = false
            y.description = "Instant messaging address for the User."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :display, type: :string) do |y|
            y.multi_valued = false
            y.description = "A human-readable name, primarily used for display purposes.  READ-ONLY."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :type, type: :string) do |y|
            y.multi_valued = false
            y.description = "A label indicating the attribute's function, e.g., 'aim', 'gtalk', 'xmpp'."
            y.required = false
            y.case_exact = false
            y.canonical_values = ['aim', 'gtalk', 'icq', 'xmpp', 'msn', 'skype', 'qq', 'yahoo']
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :primary, type: :boolean) do |y|
            y.multi_valued = false
            y.description = "A Boolean value indicating the 'primary' or preferred attribute value for this attribute, e.g., the preferred messenger or primary messenger.  The primary attribute value 'true' MUST appear no more than once."
            y.required = false
            y.mutability = :read_write
            y.returned = :default
          end
        end
        schema.add_attribute(name: :photos, type: :complex) do |x|
          x.multi_valued = true
          x.description = "URLs of photos of the User."
          x.required = false
          x.mutability = :read_write
          x.returned = :default
          x.add_attribute(name: :value, type: :reference) do |y|
            y.reference_types = ['external']
            y.multi_valued = false
            y.description = "URL of a photo of the User."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :display, type: :string) do |y|
            y.multi_valued = false
            y.description = "A human-readable name, primarily used for display purposes.  READ-ONLY."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :type, type: :string) do |y|
            y.multi_valued = false
            y.description = "A label indicating the attribute's function, i.e., 'photo' or 'thumbnail'."
            y.required = false
            y.case_exact = false
            y.canonical_values = ['photo', 'thumbnail']
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :primary, type: :boolean) do |y|
            y.multi_valued = false
            y.description = "A Boolean value indicating the 'primary' or preferred attribute value for this attribute, e.g., the preferred photo or thumbnail.  The primary attribute value 'true' MUST appear no more than once."
            y.required = false
            y.mutability = :read_write
            y.returned = :default
          end
        end
        schema.add_attribute(name: :addresses, type: :complex) do |x|
          x.multi_valued = true
          x.description = "A physical mailing address for this User.  Canonical type values of 'work', 'home', and 'other'.  This attribute is a complex type with the following sub-attributes."
          x.required = false
          x.mutability = :read_write
          x.returned = :default
          x.uniqueness = :none
          x.add_attribute(name: :formatted, type: :string) do |y|
            y.multi_valued = false
            y.description = "The full mailing address, formatted for display or use with a mailing label.  This attribute MAY contain newlines."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :street_address, type: :string) do |y|
            y.multi_valued = false
            y.description = "The full street address component, which may include house number, street name, P.O. box, and multi-line extended street address information.  This attribute MAY contain newlines."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :locality, type: :string) do |y|
            y.multi_valued = false
            y.description = "The city or locality component."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :region, type: :string) do |y|
            y.multi_valued = false
            y.description = "The state or region component."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :postal_code, type: :string) do |y|
            y.multi_valued = false
            y.description = "The zip code or postal code component."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :country, type: :string) do |y|
            y.multi_valued = false
            y.description = "The country name component."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :type, type: :string) do |y|
            y.multi_valued = false
            y.description = "A label indicating the attribute's function, e.g., 'work' or 'home'."
            y.required = false
            y.case_exact = false
            y.canonical_values = ['work', 'home', 'other']
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
        end
        schema.add_attribute(name: :groups, type: :complex) do |x|
          x.multi_valued = true
          x.description = "A list of groups to which the user belongs, either through direct membership, through nested groups, or dynamically calculated."
          x.required = false
          x.mutability = :read_only
          x.returned = :default
          x.add_attribute(name: :value, type: :string) do |y|
            y.multi_valued = false
            y.description = "The identifier of the User's group."
            y.required = false
            y.case_exact = false
            y.mutability = :read_only
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: '$ref', type: :reference) do |y|
            y.multi_valued = false
            y.description = "The URI of the corresponding 'Group' resource to which the user belongs."
            y.required = false
            y.case_exact = false
            y.mutability = :read_only
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :display, type: :string) do |y|
            y.multi_valued = false
            y.description = "A human-readable name, primarily used for display purposes.  READ-ONLY."
            y.required = false
            y.case_exact = false
            y.mutability = :read_only
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :type, type: :string) do |y|
            y.multi_valued = false
            y.description = "A label indicating the attribute's function, e.g., 'direct' or 'indirect'."
            y.required = false
            y.case_exact = false
            y.canonical_values = ['direct', 'indirect']
            y.mutability = :read_only
            y.returned = :default
            y.uniqueness = :none
          end
        end
        schema.add_attribute(name: :entitlements, type: :complex) do |x|
          x.multi_valued = true
          x.description = "A list of entitlements for the User that represent a thing the User has."
          x.required = false
          x.mutability = :read_write
          x.returned = :default
          x.add_attribute(name: :value, type: :string) do |y|
            y.multi_valued = false
            y.description = "The value of an entitlement."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :display, type: :string) do |y|
            y.multi_valued = false
            y.description = "A human-readable name, primarily used for display purposes.  READ-ONLY."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :type, type: :string) do |y|
            y.multi_valued = false
            y.description = "A label indicating the attribute's function."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :primary, type: :boolean) do |y|
            y.multi_valued = false
            y.description = "A Boolean value indicating the 'primary' or preferred attribute value for this attribute.  The primary attribute value 'true' MUST appear no more than once."
            y.required = false
            y.mutability = :read_write
            y.returned = :default
          end
        end
        schema.add_attribute(name: :roles, type: :complex) do |x|
          x.multi_valued = true
          x.description = "A list of roles for the User that collectively represent who the User is, e.g., 'Student', 'Faculty'."
          x.required = false
          x.mutability = :read_write
          x.returned = :default
          x.add_attribute(name: :value, type: :string) do |y|
            y.multi_valued = false
            y.description = "The value of a role."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :display, type: :string) do |y|
            y.multi_valued = false
            y.description = "A human-readable name, primarily used for display purposes.  READ-ONLY."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :type, type: :string) do |y|
            y.multi_valued = false
            y.description = "A label indicating the attribute's function."
            y.required = false
            y.case_exact = false
            y.canonical_values = []
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :primary, type: :boolean) do |y|
            y.multi_valued = false
            y.description = "A Boolean value indicating the 'primary' or preferred attribute value for this attribute.  The primary attribute value 'true' MUST appear no more than once."
            y.required = false
            y.mutability = :read_write
            y.returned = :default
          end
        end
        schema.add_attribute(name: :x509_certificates, type: :complex) do |x|
          x.multi_valued = true
          x.description = "A list of certificates issued to the User."
          x.required = false
          x.case_exact = false
          x.mutability = :read_write
          x.returned = :default
          x.add_attribute(name: :value, type: :binary) do |y|
            y.multi_valued = false
            y.description = "The value of an X.509 certificate."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :display, type: :string) do |y|
            y.multi_valued = false
            y.description = "A human-readable name, primarily used for display purposes.  READ-ONLY."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :type, type: :string) do |y|
            y.multi_valued = false
            y.description = "A label indicating the attribute's function."
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :primary, type: :boolean) do |y|
            y.multi_valued = false
            y.description = "A Boolean value indicating the 'primary' or preferred attribute value for this attribute.  The primary attribute value 'true' MUST appear no more than once."
            y.required = false
            y.mutability = :read_write
            y.returned = :default
          end
        end
        schema
      end
    end
  end
end
