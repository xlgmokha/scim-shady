module Scim
  module Shady
    module Builders
      class Resource
        attr_accessor :id

        def initialize
          @created_at = @updated_at = Time.now
          @meta = Metadata.new
        end

        def meta
          yield @meta
        end

        def to_h
          {
            'schemas' => [],
            'id' => id,
          }.merge(@meta.to_h)
        end
      end
    end
  end
end
