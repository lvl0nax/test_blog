class SubscriptionsController < ApplicationController
  def create
    s = Subscription.new(permitted_params)
    if s.valid? && s.save
      render json: {status: :ok}
    else
      render json: {status: 500, error: s.errors.full_messages.first}
    end
  end

  # destroy subscription by token
  def unsubscribe
    email = Base64.decode64(params[:token])
    Subscription.where(email: email).destroy_all
  end

  private
  def permitted_params
    params.permit(:email)
  end
end
