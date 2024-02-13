class JsonbNotification < ApplicationRecord
  include Unnoticed::Model
  self.table_name = "jsonb_notifications"
end
