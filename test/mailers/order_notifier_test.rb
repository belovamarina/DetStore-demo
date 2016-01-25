require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "DetStore order confirmation", mail.subject
    assert_equal ["email@gmail.com"], mail.to
    assert_equal ["rubyonrails4@ya.ru"], mail.from
    #assert_match /Игровая площадка/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Your order was shipped from DetStore", mail.subject
    assert_equal ["email@gmail.com"], mail.to
    assert_equal ["rubyonrails4@ya.ru"], mail.from
    #assert_match /<td>1&times;<\/td>\s*<td>Игровая площадка<\/td>/, mail.body.encoded
  end

end
