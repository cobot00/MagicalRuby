#! /usr/bin/env ruby

require 'minitest/unit'

MiniTest::Unit.autorun

=begin
	assert (actual, message = nil): 処理結果がtrueかの判定
  assert_equal (expected, actual, message = nil): 2値が同値かの判定
  assert_match (regexp, str, message = nil): 文字列が正規表現に合致するかの判定
=end

class TestPractice < MiniTest::Unit::TestCase

  def setup
    # execute before all test
  end

  def teardown
    # execute after all test
  end

  def test_int
    assert_equal(1 + 2, 3)
    assert_equal(1 + 2, 4, "1 + 2 <> 4")
  end

  def test_array
  	values = [1, 2, 3, 4, 5]

  	assert_equal(values[0], 1)
  	assert_equal(values[1], 3, "2nd element <> 3")
  end

  def test_str
    assert_equal("a1", "a1")
    assert_equal("ab", "bc", "ab <> bc")
  end

  def test_reg
    assert_match(/[a-z]/, "a")
    assert_match(/[a-z]/, "A", "A dosen't match [a-z]")
  end

  def test_bool
    assert_equal(1 == 0, false)
    assert_equal(1 == 0, true, "1 <> 0")
  end
end
