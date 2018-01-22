module Scim
  module Shady
    module Builders
      class Name
        attr_accessor :family_name
        attr_accessor :given_name
        attr_accessor :middle_name
        attr_accessor :honorific_prefix
        attr_accessor :honorific_suffix
        attr_accessor :formatted

        def to_h
          {
            'name' => {
              'formatted' => formatted,
              'familyName' => family_name,
              'givenName' => given_name,
              'middleName' => middle_name,
              'honorificPrefix' => honorific_prefix,
              'honorificSuffix' => honorific_suffix,
            }
          }
        end
      end
    end
  end
end
