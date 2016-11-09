require 'test_helper'

class Galleries::AlbumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @galleries_album = galleries_albums(:one)
  end

  test "should get index" do
    get galleries_albums_url
    assert_response :success
  end

  test "should get new" do
    get new_galleries_album_url
    assert_response :success
  end

  test "should create galleries_album" do
    assert_difference('Galleries::Album.count') do
      post galleries_albums_url, params: { galleries_album: {  } }
    end

    assert_redirected_to galleries_album_url(Galleries::Album.last)
  end

  test "should show galleries_album" do
    get galleries_album_url(@galleries_album)
    assert_response :success
  end

  test "should get edit" do
    get edit_galleries_album_url(@galleries_album)
    assert_response :success
  end

  test "should update galleries_album" do
    patch galleries_album_url(@galleries_album), params: { galleries_album: {  } }
    assert_redirected_to galleries_album_url(@galleries_album)
  end

  test "should destroy galleries_album" do
    assert_difference('Galleries::Album.count', -1) do
      delete galleries_album_url(@galleries_album)
    end

    assert_redirected_to galleries_albums_url
  end
end
