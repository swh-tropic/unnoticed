class JsonNotification < ApplicationRecord
  include Unnoticed::Model
  self.table_name = "json_notifications"
end
