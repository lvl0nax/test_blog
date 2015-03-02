class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@my_blog.com'
  layout 'mailer'
end
