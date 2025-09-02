# frozen_string_literal: true

require "test_helper"

class TestStrongService < Minitest::Test
  def test_that_it_is_a_strong_class
    assert_kind_of Class, StrongService
  end
end
