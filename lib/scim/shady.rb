require "scim/shady/version"
require 'json'
require 'scim-kit'

module Scim
  module Shady
    class User < ::Scim::Kit::V2::Resource
      def initialize
        schema = ::Scim::Kit::V2::Schema.new(id: ::Scim::Kit::V2::Schemas::USER, name: 'User', location: "/scim/v2/Schemas/#{::Scim::Kit::V2::Schemas::USER}")
        schema.add_attribute(name: :user_name) do |x|
          x.required = true
        end
        super(schemas: [schema])
      end

      def template_name
        'resource.json.jbuilder'
      end
    end
  end
end
