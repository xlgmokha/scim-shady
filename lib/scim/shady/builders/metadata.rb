module Scim
  module Shady
    module Builders
      module Metadata
        attr_accessor :created_at
        attr_accessor :updated_at
        attr_accessor :location
        attr_accessor :version

        def to_h
          {
            'meta' => {
              'resourceType' => self.class.name.split(/::/).last,
              'created' => created_at.to_time.utc.iso8601,
              'lastModified' => updated_at.to_time.utc.iso8601,
              'location' => location,
              'version' => version,
            },
          }
        end
      end
    end
  end
end
