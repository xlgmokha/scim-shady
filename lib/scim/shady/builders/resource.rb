module Scim
  module Shady
    module Builders
      class Resource
        include Metadata
        attr_accessor :id

        def initialize
          @created_at = @updated_at = Time.now
        end

        def to_h
          super.merge({
            'schemas' => [],
            'id' => id,
          })
        end
      end
    end
  end
end
