module Scim
  module Shady
    class EnterpriseUser < ::Scim::Kit::V2::Resource
      def initialize(attributes = {})
        super(schemas: [User.schema, self.class.schema], attributes: attributes)
      end

      def template_name
        'resource.json.jbuilder'
      end

      def self.schema(location: "/v2/Schemas/urn:ietf:params:scim:schemas:extension:enterprise:2.0:User")
        schema = ::Scim::Kit::V2::Schema.new(id: "urn:ietf:params:scim:schemas:extension:enterprise:2.0:User", name: 'EnterpriseUser', location: location)
        schema.add_attribute(name: :employee_number, type: :string) do |x|
          x.multi_valued = false
          x.description = "Numeric or alphanumeric identifier assigned to a person, typically based on order of hire or association with an organization."
          x.required = false
          x.case_exact = false
          x.mutability = :read_write
          x.returned = :default
          x.uniqueness = :none
        end
        schema.add_attribute(name: :cost_center, type: :string) do |x|
          x.multi_valued = false
          x.description = "Identifies the name of a cost center."
          x.required = false
          x.case_exact = false
          x.mutability = :read_write
          x.returned = :default
          x.uniqueness = :none
        end
        schema.add_attribute(name: :organization, type: :string) do |x|
          x.multi_valued = false
          x.description = "Identifies the name of an organization."
          x.required = false
          x.case_exact = false
          x.mutability = :read_write
          x.returned = :default
          x.uniqueness = :none
        end
        schema.add_attribute(name: :division, type: :string) do |x|
          x.multi_valued = false
          x.description = "Identifies the name of a division."
          x.required = false
          x.case_exact = false
          x.mutability = :read_write
          x.returned = :default
          x.uniqueness = :none
        end
        schema.add_attribute(name: :department, type: :string) do |x|
          x.multi_valued = false
          x.description = "Identifies the name of a department."
          x.required = false
          x.case_exact = false
          x.mutability = :read_write
          x.returned = :default
          x.uniqueness = :none
        end
        schema.add_attribute(name: :manager, type: :complex) do |x|
          x.multi_valued = false
          x.description = ""
          x.required = false
          x.mutability = :read_write
          x.returned = :default
          x.add_attribute(name: :value, type: :string) do |y|
            y.multi_valued = false
            y.description = ""
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: '$ref', type: :reference) do |y|
            y.multi_valued = false
            y.description = ""
            y.required = false
            y.case_exact = false
            y.mutability = :read_write
            y.returned = :default
            y.uniqueness = :none
          end
          x.add_attribute(name: :display_name, type: :string) do |y|
            y.multi_valued = false
            y.description = ""
            y.required = false
            y.case_exact = false
            y.mutability = :read_only
            y.returned = :default
            y.uniqueness = :none
          end
        end
        schema
      end
    end
  end
end
