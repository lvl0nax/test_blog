ActiveAdmin.register_page "Dashboard" do
  content do
    "You have #{ Subscription.count } subscribers."

    table do
      thead do
        tr do
          %w[Article comments_count].each &method(:th)
        end
      end
      tbody do
        Article.last(10)
      end
    end
  end
end
