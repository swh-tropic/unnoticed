require "test_helper"

class TranslationTest < ActiveSupport::TestCase
  class I18nExample < Unnoticed::Base
    def message
      t("hello")
    end
  end

  class Unnoticed::I18nExample < Unnoticed::Base
    def message
      t(".message")
    end
  end

  class ::ScopedI18nExample < Unnoticed::Base
    def i18n_scope
      :unnoticed
    end

    def message
      t(".message")
    end
  end

  test "I18n support" do
    assert_equal "hello", I18nExample.new.send(:scope_translation_key, "hello")
    assert_equal "Hello world", I18nExample.new.message
  end

  test "I18n supports namespaces" do
    assert_equal "notifications.unnoticed.i18n_example.message", Unnoticed::I18nExample.new.send(:scope_translation_key, ".message")
    assert_equal "This is a notification", Unnoticed::I18nExample.new.message
  end

  test "I18n supports custom scopes" do
    assert_equal "unnoticed.scoped_i18n_example.message", ScopedI18nExample.new.send(:scope_translation_key, ".message")
    assert_equal "This is a custom scoped translation", ScopedI18nExample.new.message
  end
end
