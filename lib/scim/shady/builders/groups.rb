module Scim
  module Shady
    module Builders
      class Groups
        def add(id, url, display_name)
          @items ||= []
          @items.push(value: id, '$ref' => url, display: display_name)
        end

        def to_h
          { 'groups' => @items }
        end
      end
    end
  end
end
