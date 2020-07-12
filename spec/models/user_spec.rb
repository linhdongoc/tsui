require 'rails_helper'

RSpec.describe User do
  subject { build(:user) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should define_enum_for(:role).with_values(%i[usual employee admin]) }
  it { should define_enum_for(:lang).with_values(Rails.configuration.i18n.available_locales) }
  it { should define_enum_for(:salutation).with_values(%i[salutation_none female male various]) }

  describe 'associations' do
    subject { build(:user) }
    it { should have_many(:books).dependent(:destroy) }
    it { should have_many(:event_users).dependent(:destroy) }
    it { should have_many(:events).through(:event_users) }
  end

  describe 'validate email format' do
    it { should allow_value('user@foo.COM', 'A_US-ER@f.b.org', 'frst.lst@foo.jp', 'a+b@baz.cn').for(:email) }
    it { should_not allow_value('user@foo,com', 'user_at_foo.org', 'example.user@foo.', 'foo@bar_baz.com', 'foo@bar+baz.com').for(:email) }
  end

  describe 'name' do
    before do
      subject.first_name = 'First'
      subject.last_name = 'Last'
    end
    it { expect(subject.name).to be_eql('First Last') }
  end
end
