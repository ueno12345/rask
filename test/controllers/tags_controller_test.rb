require "test_helper"

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
    @tag = tags(:one)
    @user = users(:one)
    @task.user = @user
    OmniAuth.config.test_mode = true
  end

  test "should redirect to get inde without login" do
    get tags_url
    assert_redirected_to root_path
  end

  test "should get index with login" do
    log_in_as(@user)
    get tags_url
    assert_response :success
  end

  test "should redirect to get new tag page without login" do
    get new_tag_url
    assert_redirected_to root_path
  end

  test "should get new tag page with login" do
    log_in_as(@user)
    get new_tag_url
    assert_response :success
  end

  test "should redirect to create new task" do
    get new_task_url
    assert_redirected_to root_path
  end

  test "should get create-tag-page" do
    log_in_as(@user)
    assert_difference('Tag.count') do
      post tags_url, params: { tag: { name: "Test Tag" } }
    end

    assert_redirected_to tag_url(Tag.last)
  end

  test "should show tag" do
    log_in_as(@user)
    get tag_url(@tag)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_tag_url(@tag)
    assert_response :success
  end

  test "should update tag" do
    log_in_as(@user)
    patch tag_url(@tag), params: { tag: { name: @tag.name } }
    assert_redirected_to tag_url(@tag)
  end

  test "should destroy tag" do
    log_in_as(@user)
    assert_difference('Tag.count', -1) do
      delete tag_url(@tag)
    end

    assert_redirected_to tags_url
  end
end
