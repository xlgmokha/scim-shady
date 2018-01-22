require 'forwardable'

module Scim
  module Shady
    module Builders
      class Resource
        extend Forwardable
        attr_accessor :id
        def_delegators :@meta, :created_at=, :updated_at=, :location=, :version=

        def initialize
          @meta = Metadata.new(self)
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
