module Scim
  module Shady
    class Group < ::Scim::Kit::V2::Resource
      def initialize(attributes = {})
        super(schemas: [self.class.schema], attributes: attributes)
      end

      def template_name
        'resource.json.jbuilder'
      end

      def self.schema(location: "/v2/Schemas/#{::Scim::Kit::V2::Schemas::GROUP}")
        schema = ::Scim::Kit::V2::Schema.new(id: ::Scim::Kit::V2::Schemas::GROUP, name: 'Group', location: location)
        schema.add_attribute(name: :display_name, type: :string) do |x|
          x.multi_valued = false
          x.description = "A human-readable name for the Group.  REQUIRED."
          x.required = false
          x.case_exact = false
          x.mutability = :read_write
          x.returned = :default
          x.uniqueness = :none
        end
        schema.add_attribute(name: :members, type: :complex) do |x|
          x.multi_valued = true
          x.description = "A list of members of the Group."
          x.required = false
          x.add_attribute(name: :value, type: :string) do |y|
            y.multi_valued = false
            y.description = "Identifier of the member of this Group."
            y.required = false
            y.case_exact = false
            y.mutability = :immutable
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: '$ref', type: :reference) do |y|
            y.reference_types = ['User', 'Group']
            y.multi_valued = false
            y.description = "The URI corresponding to a SCIM resource that is a member of this Group."
            y.required = false
            y.case_exact = false
            y.mutability = :immutable
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :type, type: :string) do |y|
            y.multi_valued = false
            y.description = "A label indicating the type of resource, e.g., 'User' or 'Group'."
            y.required = false
            y.case_exact = false
            y.canonical_values = ['User', 'Group']
            y.mutability = :immutable
            y.returned = :default
            y.uniqueness = :none
          end
        end
        schema
      end
    end
  end
end
