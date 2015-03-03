# == Schema Information
#
# Table name: subscriptions
#
#  id    :integer          not null, primary key
#  email :string
#

class Subscription < ActiveRecord::Base
  # validates with custom email validator and rails validation for presence and uniqueness email
  validates :email,
            presence: true,
            email: true,
            uniqueness: true
end
