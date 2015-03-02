class SubscriptionsController < ApplicationController
  def create
    if Subscription.create(permitted_params)
      redirect_to root_url
    else
      render json: {error: 'big error'}
    end
  end

  private
  def permitted_params
    params.permit(:email)
  end
end
