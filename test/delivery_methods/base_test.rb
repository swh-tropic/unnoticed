require "test_helper"

class CustomDeliveryMethod < Unnoticed::DeliveryMethods::Base
  class_attribute :deliveries, default: []

  def deliver
    self.class.deliveries << params
  end
end

class CustomDeliveryMethodExample < Unnoticed::Base
  deliver_by :example, class: "CustomDeliveryMethod"
end

class DeliveryMethodWithOptions < Unnoticed::DeliveryMethods::Test
  option :foo
end

class DeliveryMethodWithOptionsExample < Unnoticed::Base
  deliver_by :example, class: "DeliveryMethodWithOptions"
end

class DeliveryMethodWithNilOptionsExample < Unnoticed::Base
  deliver_by :example, class: "DeliveryMethodWithOptions", foo: nil
end

class Unnoticed::DeliveryMethods::BaseTest < ActiveSupport::TestCase
  test "can use custom delivery method with params" do
    CustomDeliveryMethodExample.new.deliver(user)
    assert_equal 1, CustomDeliveryMethod.deliveries.count
  end

  test "validates delivery method options" do
    assert_raises Unnoticed::ValidationError do
      DeliveryMethodWithOptionsExample.new.deliver(user)
    end
  end

  test "nil options are valid" do
    assert_difference "Unnoticed::DeliveryMethods::Test.delivered.count" do
      DeliveryMethodWithNilOptionsExample.new.deliver(user)
    end
  end
end
