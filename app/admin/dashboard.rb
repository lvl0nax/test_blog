ActiveAdmin.register_page "Dashboard" do
  content do
    "You have #{ Subscription.count } subscribers."
  end
end
