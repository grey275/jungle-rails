
class OrderMailerPreview < ActionMailer::Preview
  def welcome_email
    OrderMailer.welcome_email(Order.first)
  end

  def order_confirmation_email
    OrderMailer.order_confirmation_email(Order.first)
  end
end