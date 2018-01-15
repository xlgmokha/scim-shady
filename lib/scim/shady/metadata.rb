module Scim
  module Shady
    module Metadata
      def created
        DateTime.parse(to_h['meta']['created'])
      end

      def last_modified
        DateTime.parse(to_h['meta']['lastModified'])
      end

      def version
        to_h['meta']['version']
      end

      def location
        to_h['meta']['location']
      end
    end
  end
end
