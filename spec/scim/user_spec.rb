RSpec.describe Scim::Shady::User do
  let(:id) { SecureRandom.uuid }
  let(:created_at) { Time.now }
  let(:updated_at) { Time.now }
  let(:user_url) { FFaker::Internet.uri("https") }
  let(:user_version) { SecureRandom.uuid }
  let(:username) { FFaker::Internet.user_name }

  describe ".build" do
    subject { described_class }

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

  describe ".to_json" do
    subject { described_class }

    it 'produces valid json' do
      result = subject.build do |builder|
        builder.id = id
        builder.username = username
        builder.created_at = created_at
        builder.updated_at = updated_at
        builder.location = user_url
        builder.version = user_version
      end.to_json
      result = JSON.parse(result)

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

  describe ".new" do
    it 'parses json' do
      json = JSON.dump({
        schemas: [Scim::Shady::Schemas::USER],
        id: id,
        userName: username,
        meta: {
          resourceType: "User",
          created: created_at.iso8601,
          lastModified: updated_at.iso8601,
          version: user_version,
          location: user_url,
        }
      })
      subject = described_class.new(json)

      expect(subject.id).to eql(id)
      expect(subject.username).to eql(username)
      expect(subject.created.iso8601).to eql(created_at.iso8601)
      expect(subject.last_modified.iso8601).to eql(updated_at.iso8601)
      expect(subject.version).to eql(user_version)
      expect(subject.location).to eql(user_url)
    end
  end
end
