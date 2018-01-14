module Scim
  module Shady
    module Builders
      class Resource
        attr_accessor :id
        attr_accessor :created_at
        attr_accessor :updated_at
        attr_accessor :location
        attr_accessor :version

        def to_h
          {
            'schemas' => [],
            'id' => id,
            'meta' => {
              'resourceType' => self.class.name.split(/::/).last,
              'created' => created_at.utc.iso8601,
              'lastModified' => updated_at.utc.iso8601,
              'location' => location,
              'version' => version,
            },
          }
        end
      end
    end
  end
end
