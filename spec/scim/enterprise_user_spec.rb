RSpec.describe Scim::Shady::EnterpriseUser do
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
    subject.employee_number = '1'
    subject.cost_center = SecureRandom.uuid
    subject.organization = SecureRandom.uuid
    subject.department = SecureRandom.uuid
  end

  specify { expect(subject).to be_valid }
end
