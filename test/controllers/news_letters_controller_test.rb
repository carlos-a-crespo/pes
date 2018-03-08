require 'test_helper'

class NewsLettersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @news_letter = news_letters(:one)
  end

  test "should get index" do
    get news_letters_url
    assert_response :success
  end

  test "should get new" do
    get new_news_letter_url
    assert_response :success
  end

  test "should create news_letter" do
    assert_difference('NewsLetter.count') do
      post news_letters_url, params: { news_letter: { month: @news_letter.month, year: @news_letter.year } }
    end

    assert_redirected_to news_letter_url(NewsLetter.last)
  end

  test "should show news_letter" do
    get news_letter_url(@news_letter)
    assert_response :success
  end

  test "should get edit" do
    get edit_news_letter_url(@news_letter)
    assert_response :success
  end

  test "should update news_letter" do
    patch news_letter_url(@news_letter), params: { news_letter: { month: @news_letter.month, year: @news_letter.year } }
    assert_redirected_to news_letter_url(@news_letter)
  end

  test "should destroy news_letter" do
    assert_difference('NewsLetter.count', -1) do
      delete news_letter_url(@news_letter)
    end

    assert_redirected_to news_letters_url
  end
end
