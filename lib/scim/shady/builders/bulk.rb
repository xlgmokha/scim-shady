module Scim
  module Shady
    module Builders
      class Bulk
        attr_accessor :supported
        attr_accessor :max_operations
        attr_accessor :max_payload_size

        def to_h
          {
            'supported' => supported,
            'maxOperations' => max_operations,
            'maxPayloadSize' => max_payload_size,
          }
        end
      end
    end
  end
end
