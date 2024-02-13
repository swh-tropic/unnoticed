require "active_job/arguments"
require "http"
require "unnoticed/engine"

module Unnoticed
  autoload :Base, "unnoticed/base"
  autoload :Coder, "unnoticed/coder"
  autoload :HasNotifications, "unnoticed/has_notifications"
  autoload :Model, "unnoticed/model"
  autoload :TextCoder, "unnoticed/text_coder"
  autoload :Translation, "unnoticed/translation"
  autoload :NotificationChannel, "unnoticed/notification_channel"

  module DeliveryMethods
    autoload :ActionCable, "unnoticed/delivery_methods/action_cable"
    autoload :Base, "unnoticed/delivery_methods/base"
    autoload :Database, "unnoticed/delivery_methods/database"
    autoload :Email, "unnoticed/delivery_methods/email"
    autoload :Fcm, "unnoticed/delivery_methods/fcm"
    autoload :Ios, "unnoticed/delivery_methods/ios"
    autoload :MicrosoftTeams, "unnoticed/delivery_methods/microsoft_teams"
    autoload :Slack, "unnoticed/delivery_methods/slack"
    autoload :Test, "unnoticed/delivery_methods/test"
    autoload :Twilio, "unnoticed/delivery_methods/twilio"
    autoload :Vonage, "unnoticed/delivery_methods/vonage"
  end

  mattr_accessor :parent_class
  @@parent_class = "ApplicationJob"

  class ValidationError < StandardError
  end

  class ResponseUnsuccessful < StandardError
    attr_reader :response

    def initialize(response)
      @response = response
    end
  end
end
