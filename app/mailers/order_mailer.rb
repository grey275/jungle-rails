class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'
  layout 'order_mailer'

  def order_confirmation_email(order)
    @order = order
    @url = "http://localhost:3000/order/#{order.id}"

    mail(to: @order.email, template_path: 'orders', template_name: 'show', subject: 'you placed an order!')
  end

  def welcome_email(order)
    @order = order
    mail(to: @order.email, subject: "welcome")
  end
end
