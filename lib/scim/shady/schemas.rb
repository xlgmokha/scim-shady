module Scim
  module Shady
    class Schemas
      CORE = "urn:ietf:params:scim:schemas:core:2.0"
      GROUP = "#{CORE}:Group"
      SERVICE_PROVIDER_CONFIG = "#{CORE}:ServiceProviderConfig"
      USER = "#{CORE}:User"
    end

    class Messages
      CORE = "urn:ietf:params:scim:api:messages:2.0"
      LIST_RESPONSE = "#{CORE}:ListResponse"
      SEARCH_REQUEST = "#{CORE}:SearchRequest"
      ERROR = "#{CORE}:Error"
    end
  end
end
