RSpec.describe Scim::Shady::User do
  describe ".build" do
    subject { described_class }
    let(:id) { SecureRandom.uuid }
    let(:email) { FFaker::Internet.email }
    let(:other_email) { FFaker::Internet.email }
    let(:created_at) { Time.now }
    let(:updated_at) { Time.now }
    let(:user_url) { FFaker::Internet.uri("https") }
    let(:user_version) { SecureRandom.uuid }
    let(:username) { FFaker::Internet.user_name }
    let(:full_name) { FFaker::Name.name_with_prefix }

    it 'builds a scim user' do
      result = subject.build do |builder|
        builder.id = id
        builder.external_id = email
        builder.created_at = created_at
        builder.updated_at = updated_at
        builder.location = user_url
        builder.version = user_version
        builder.full_name = full_name

        builder.username = username
        builder.add_email(email)
        builder.add_email(other_email)
      end.to_h

      expect(result['schemas']).to match_array([Scim::Shady::Schemas::USER])
      expect(result['id']).to eql(id)
      expect(result['externalId']).to eql(email)
      expect(result['meta']['resourceType']).to eql('User')
      expect(result['meta']['created']).to eql(created_at.utc.iso8601)
      expect(result['meta']['lastModified']).to eql(updated_at.utc.iso8601)
      expect(result['meta']['location']).to eql(user_url)
      expect(result['meta']['version']).to eql(user_version)
      expect(result['name']['formatted']).to eql(full_name)
      expect(result['userName']).to eql(username)
      expect(result['emails']).to match_array([
        { 'value' => email, 'type' => 'work', 'primary' => true },
        { 'value' => other_email, 'type' => 'work', 'primary' => false }
      ])
    end
  end
end
