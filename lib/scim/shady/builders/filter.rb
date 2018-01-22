module Scim
  module Shady
    module Builders
      class Filter
        attr_accessor :supported
        attr_accessor :max_results

        def to_h
          {
            'supported' => supported,
            'maxResults' => max_results,
          }
        end
      end
    end
  end
end
