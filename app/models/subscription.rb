# == Schema Information
#
# Table name: subscriptions
#
#  id    :integer          not null, primary key
#  email :string
#

class Subscription < ActiveRecord::Base
  # validation of email format by "EmailValidator" and rails validation of presence and uniqueness of email
  #
  validates :email,
            presence: true,
            email: true,
            uniqueness: true
end
