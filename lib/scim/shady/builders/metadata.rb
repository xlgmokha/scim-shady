module Scim
  module Shady
    module Builders
      class Metadata
        attr_accessor :created_at
        attr_accessor :updated_at
        attr_accessor :location
        attr_accessor :version

        def initialize(resource)
          @resource = resource
          @created_at = @updated_at = Time.now
        end

        def to_h
          {
            'meta' => {
              'resourceType' => @resource.class.name.split(/::/).last,
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
