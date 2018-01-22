RSpec.describe Scim::Shady::Builders::ServiceProviderConfiguration do
  subject { described_class.new }

  describe ".build" do
    let(:documentation_uri) { FFaker::Internet.uri("https") }

    it 'can specify the documentation url' do
      subject.documentation_uri = documentation_uri
      expect(subject.build.documentation_uri).to eql(documentation_uri)
    end

    it 'can specify patch support' do
      subject.patch = false
      expect(subject.build.patch).to be(false)

      subject.patch = true
      expect(subject.build.patch).to be(true)
    end

    it 'can configure bulk support' do
      subject.bulk do |x|
        x.supported = true
        x.max_operations = 1_000
        x.max_payload_size = 1_048_576
      end

      result = subject.build
      expect(result.bulk_supported).to be(true)
      expect(result.bulk_max_operations).to eql(1_000)
      expect(result.bulk_max_payload_size).to eql(1_048_576)
    end

    it 'can configure filter support' do
      subject.filter do |x|
        x.supported = true
        x.max_results = 200
      end
      result = subject.build
      expect(result.filter_supported).to be(true)
      expect(result.filter_max_results).to eql(200)
    end

    it 'can configure change password support' do
      subject.change_password_supported = true
      result = subject.build
      expect(result.change_password_supported).to be(true)
    end

    it 'can configure sort support' do
      subject.sort_supported = true
      expect(subject.build.sort_supported).to be(true)
    end

    it 'can configure etag support' do
      subject.etag_supported = true
      expect(subject.build.etag_supported).to be(true)
    end

    it 'can add authentication schemes' do
      subject.add_authentication_scheme(:oauth_bearer_token)
      subject.add_authentication_scheme(:http_basic)

      result = subject.build
      expect(result.authentication_schemes).to match_array([
        {
          "name" => "OAuth Bearer Token",
          "description" => "Authentication scheme using the OAuth Bearer Token Standard",
          "specUri" => "http://www.rfc-editor.org/info/rfc6750",
          "documentationUri" => "http://example.com/help/oauth.html",
          "type" => "oauthbearertoken",
          "primary" => true,
        },
        {
          "name" => "HTTP Basic",
          "description" => "Authentication scheme using the HTTP Basic Standard",
          "specUri" => "http://www.rfc-editor.org/info/rfc2617",
          "documentationUri" => "http://example.com/help/httpBasic.html",
          "type" => "httpbasic",
        }
      ])
    end

    it 'can configure metadata' do
      subject.location = FFaker::Internet.uri("https")
      subject.created_at = Time.now.utc
      subject.updated_at = Time.now.utc
      subject.version = 1

      result = subject.build

      expect(result.meta.location).to eql(subject.location)
      expect(result.meta.created).to eql(DateTime.parse(subject.created_at.iso8601))
      expect(result.meta.last_modified).to eql(DateTime.parse(subject.updated_at.iso8601))
      expect(result.meta.version).to eql(subject.version)
    end
  end
end
