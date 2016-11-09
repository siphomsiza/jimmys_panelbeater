require 'test_helper'

class Galleries::GalleriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @galleries_gallery = galleries_galleries(:one)
  end

  test "should get index" do
    get galleries_galleries_url
    assert_response :success
  end

  test "should get new" do
    get new_galleries_gallery_url
    assert_response :success
  end

  test "should create galleries_gallery" do
    assert_difference('Galleries::Gallery.count') do
      post galleries_galleries_url, params: { galleries_gallery: {  } }
    end

    assert_redirected_to galleries_gallery_url(Galleries::Gallery.last)
  end

  test "should show galleries_gallery" do
    get galleries_gallery_url(@galleries_gallery)
    assert_response :success
  end

  test "should get edit" do
    get edit_galleries_gallery_url(@galleries_gallery)
    assert_response :success
  end

  test "should update galleries_gallery" do
    patch galleries_gallery_url(@galleries_gallery), params: { galleries_gallery: {  } }
    assert_redirected_to galleries_gallery_url(@galleries_gallery)
  end

  test "should destroy galleries_gallery" do
    assert_difference('Galleries::Gallery.count', -1) do
      delete galleries_gallery_url(@galleries_gallery)
    end

    assert_redirected_to galleries_galleries_url
  end
end
