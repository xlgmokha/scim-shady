RSpec.describe Scim::Shady::User do
  describe ".build" do
    subject { described_class }
    let(:id) { SecureRandom.uuid }
    let(:created_at) { Time.now }
    let(:updated_at) { Time.now }
    let(:user_url) { FFaker::Internet.uri("https") }
    let(:user_version) { SecureRandom.uuid }
    let(:username) { FFaker::Internet.user_name }

    it 'builds a scim user' do
      result = subject.build do |builder|
        builder.id = id
        builder.username = username
        builder.created_at = created_at
        builder.updated_at = updated_at
        builder.location = user_url
        builder.version = user_version
      end.to_h

      expect(result['schemas']).to match_array([Scim::Shady::Schemas::USER])
      expect(result['id']).to eql(id)
      expect(result['userName']).to eql(username)
      expect(result['meta']['resourceType']).to eql('User')
      expect(result['meta']['created']).to eql(created_at.utc.iso8601)
      expect(result['meta']['lastModified']).to eql(updated_at.utc.iso8601)
      expect(result['meta']['location']).to eql(user_url)
      expect(result['meta']['version']).to eql(user_version)
    end
  end
end
