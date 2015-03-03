require 'spec_helper'

describe Subscription do
  subject { described_class.make! }
  it { should be_valid }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
end
