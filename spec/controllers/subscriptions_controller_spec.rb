require 'spec_helper'
describe SubscriptionsController do
  let!(:subscription1) { Subscription.make! email: 'test@email.com' }
  let!(:subscription2) { Subscription.make! }
  describe 'GET unsubscribe' do
    it 'should destroy subscription by token' do
      expect{
        get :unsubscribe, { token: Base64.encode64('test@email.com') }
      }.to change(Subscription, :count).by(-1)
    end
  end
end
