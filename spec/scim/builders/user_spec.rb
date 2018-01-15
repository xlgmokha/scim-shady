RSpec.describe Scim::Shady::Builders::User do
  subject { described_class.new }

  describe ".build" do
    let(:id) { SecureRandom.uuid }
    let(:created_at) { Time.now }
    let(:updated_at) { Time.now }
    let(:user_url) { FFaker::Internet.uri("https") }
    let(:user_version) { SecureRandom.uuid }
    let(:username) { FFaker::Internet.user_name }
    let(:x509_certificate) { OpenSSL::X509::Certificate.new }

    it 'builds a minimal scim user' do
      subject.id = id
      subject.username = username
      subject.created_at = created_at
      subject.updated_at = updated_at
      subject.location = user_url
      subject.version = user_version
      result = subject.build

      expect(result.id).to eql(id)
      expect(result.username).to eql(username)
      expect(result.created).to eql(DateTime.parse(created_at.utc.iso8601))
      expect(result.last_modified).to eql(DateTime.parse(updated_at.utc.iso8601))
      expect(result.version).to eql(user_version)
      expect(result.location).to eql(user_url)
    end

    it 'builds a full representation' do
      subject.id = "2819c223-7f76-453a-919d-413861904646"
      subject.external_id = "701984"
      subject.username = "bjensen@example.com"
      subject.name do |x|
        x.family_name = "Jensen"
        x.given_name = "Barbara"
        x.middle_name = "Jane"
        x.honorific_prefix = "Ms."
        x.honorific_suffix = "III"
      end
      subject.display_name = "Babs Jensen"
      subject.nick_name = "Babs"
      subject.profile_url = "https://login.example.com/bjensen"
      subject.emails do |x|
        x.add("bjensen@example.com", type: :work, primary: true)
        x.add("babs@jensen.org", type: :home)
      end
      subject.addresses do |x|
        x.add(
          type: :work,
          street_address: "100 Universal City Plaza",
          locality: "Hollywood",
          region: "CA",
          postal_code: "91608",
          country: "USA",
          primary: true
        )
        x.add(
          type: :home,
          street_address: "456 Hollywood Blvd",
          locality: "Hollywood",
          region: "CA",
          postal_code: "91608",
          country: "USA",
        )
      end
      subject.phone_numbers do |x|
        x.add("555-555-5555", type: :work)
        x.add("555-555-4444", type: :mobile)
      end
      subject.instant_messengers do |x|
        x.add("someaimhandle", type: :aim)
      end
      subject.photos do |x|
        x.add("https://photos.example.com/profilephoto/72930000000Ccne/F", type: :photo)
        x.add("https://photos.example.com/profilephoto/72930000000Ccne/T", type: :thumbnail)
      end
      subject.user_type = "Employee"
      subject.title = "Tour Guide"
      subject.preferred_language = "en-US"
      subject.locale = "en-US"
      subject.timezone = "America/Los_Angeles"
      subject.active = true
      subject.groups do |x|
        x.add("e9e30dba-f08f-4109-8486-d5c6a331660a", "https://example.com/v2/Groups/e9e30dba-f08f-4109-8486-d5c6a331660a", "Tour Guides")
        x.add("fc348aa8-3835-40eb-a20b-c726e15c55b5", "https://example.com/v2/Groups/fc348aa8-3835-40eb-a20b-c726e15c55b5", "Employees")
        x.add("71ddacd2-a8e7-49b8-a5db-ae50d0a5bfd7", "https://example.com/v2/Groups/71ddacd2-a8e7-49b8-a5db-ae50d0a5bfd7",  "US Employees")
      end
      subject.x509_certificates do |x|
        x.add(x509_certificate)
      end
      subject.meta do |x|
        x.created_at = created_at
        x.updated_at = updated_at
        x.version = "a330bc54f0671c9"
        x.location = "https://example.com/v2/Users/2819c223-7f76-453a-919d-413861904646"
      end
      result = subject.build

      expect(result.external_id).to eql(subject.external_id)
      expect(result.name.formatted).to eql("Ms. Barbara J Jensen, III")
      expect(result.addresses.first.formatted).to eql("100 Universal City Plaza\nHollywood, CA 91608 USA")
      expect(result.addresses.first).to be_primary
      expect(result.addresses.last.formatted).to eql("456 Hollywood Blvd\nHollywood, CA 91608 USA")
      expect(result.phone_numbers.first.value).to eql("555-555-5555")
      expect(result.phone_numbers.first).to be_work
      expect(result.phone_numbers.last.value).to eql("555-555-4444")
      expect(result.phone_numbers.last).to be_mobile
      expect(result.instant_messengers.first.value).to eql("someimhandle")
      expect(result.instant_messengers.first.type).to eql("aim")
      expect(result.photos.first.value).to eql("https://photos.example.com/profilephoto/72930000000Ccne/F")
      expect(result.photos.first).to be_photo
      expect(result.photos.last.value).to eql("https://photos.example.com/profilephoto/72930000000Ccne/T")
      expect(result.photos.last).to be_thumbnail
      expect(result.user_type).to eql("Employee")
      expect(result.title).to eql("Tour Guide")
      expect(result.preferred_language).to eql("en-US")
      expect(result.locale).to eql("en-US")
      expect(result.timezone).to eql("America/Los_Angeles")
      expect(result).to be_active
      expect(result.groups[0].value).to eql("e9e30dba-f08f-4109-8486-d5c6a331660a")
      expect(result.groups[0].reference).to eql("https://example.com/v2/Groups/e9e30dba-f08f-4109-8486-d5c6a331660a")
      expect(result.groups[0].display).to eql("Tour Guides")
      expect(result.groups[1].value).to eql("fc348aa8-3835-40eb-a20b-c726e15c55b5")
      expect(result.groups[1].reference).to eql("https://example.com/v2/Groups/fc348aa8-3835-40eb-a20b-c726e15c55b5")
      expect(result.groups[1].display).to eql("Employees")
      expect(result.groups[2].value).to eql("71ddacd2-a8e7-49b8-a5db-ae50d0a5bfd7")
      expect(result.groups[2].reference).to eql("https://example.com/v2/Groups/71ddacd2-a8e7-49b8-a5db-ae50d0a5bfd7")
      expect(result.groups[2].display).to eql("US Employees")
      expect(result.x509_certificates.first).to eql(x509_certificate.to_pem.gsub(/-----BEGIN CERTIFICATE-----/, '').gsub(/-----END CERTIFICATE-----/, ''))
      expect(result.meta).to be_user
      expect(result.meta.created_at).to eql(DateTime.parse(created_at.utc.iso8601))
      expect(result.meta.updated_at).to eql(DateTime.parse(updated_at.utc.iso8601))
      expect(result.meta.version).to eql("W\/\"a330bc54f0671c9\"")
      expect(result.meta.location).to eql("https://example.com/v2/Users/2819c223-7f76-453a-919d-413861904646")
    end
  end
end
