RSpec.describe Scim::Shady::User do
  subject { described_class.new }

  before do
    subject.user_name = 'bjensen'
    subject.name.formatted = "Ms. Barbara J Jensen, III"
    subject.name.family_name = "Jensen"
    subject.name.given_name = "Barbara"
    subject.name.middle_name = "Jane"
    subject.name.honorific_prefix = "Ms."
    subject.name.honorific_suffix = "III"
    subject.display_name = "Barbara Jensen"
    subject.nick_name = "Barb"
    subject.preferred_language = "en_US"
    subject.locale = "en"
    subject.timezone = "America/Los_Angeles"
    subject.active = true
    subject.password = "password"
    subject.emails << { value: 'bjensen@example.com', display: 'bjensen@example.com', type: 'work', primary: true }
    subject.phone_numbers << { value: '1-555-5555', display: '1-555-5555', type: 'work', primary: true }
    subject.ims << { value: 'bjensen', display: 'bjensen', type: 'xmpp', primary: true }
  end

  specify { expect(subject.to_h[:userName]).to eql('bjensen') }
  xspecify { expect(subject).to be_valid }
  specify { subject.valid?; puts subject.errors.full_messages.inspect }
end
