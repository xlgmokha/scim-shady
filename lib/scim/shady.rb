require "scim/shady/version"
require 'json'
require 'scim-kit'

module Scim
  module Shady
    class User < ::Scim::Kit::V2::Resource
      def initialize
        schema = ::Scim::Kit::V2::Schema.new(id: ::Scim::Kit::V2::Schemas::USER, name: 'User', location: "/scim/v2/Schemas/#{::Scim::Kit::V2::Schemas::USER}")
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
        super(schemas: [schema])
      end

      def template_name
        'resource.json.jbuilder'
      end
    end
  end
end
