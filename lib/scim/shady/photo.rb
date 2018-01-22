module Scim
  module Shady
    class Photo
      def initialize(hash)
        @hash = hash
      end

      def value
        to_h['value']
      end

      def type
        to_h['type']
      end

      def photo?
        type == 'photo'
      end

      def thumbnail?
        type == 'thumbnail'
      end

      def to_h
        @hash
      end
    end
  end
end
