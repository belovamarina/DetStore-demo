class OrderNotifier < ApplicationMailer

  default from: '<rubyonrails4@ya.ru>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    mail(to: order.email, subject: 'DetStore order confirmation') do |format|
      format.text
    end
  end

  def new_order(order)
    mail(to: '<rubyonrails4@ya.ru>', subject: 'New order in DetStore (#{order.id})') do |format|
      format.html
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order
    mail to: order.email, subject: 'Your order was shipped from DetStore'
  end
end
