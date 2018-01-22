module Scim
  module Shady
    module Builders
      class Photos
        def add(url, type: :photo)
          @items ||= []
          @items.push(value: url, type: type)
        end

        def to_h
          { 'photos' => @items }
        end
      end
    end
  end
end
