# == Schema Information
#
# Table name: subscriptions
#
#  id    :integer          not null, primary key
#  email :string
#

class Subscription < ActiveRecord::Base
  validates :email,
            presence: true,
            email: true,
            uniqueness: true
end
