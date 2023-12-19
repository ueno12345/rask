require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
    @project2 = projects(:two)
    @user = users(:one)
    @project.user = @user
    OmniAuth.config.test_mode = true
  end

  test "should get index" do
    skip 'Exception'
    log_in_as(@user)
    get projects_url
    assert_response :success
  end

  test "should get new" do
    skip 'Exception'
    log_in_as(@user)
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    skip 'Exception'
    log_in_as(@user)
    assert_difference('Project.count', 2) do
      post projects_url, params: { project: { name: @project.name, user_id: @project.user_id } }
      post projects_url, params: { project: { name: @project2.name, user_id: @project2.user_id } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    skip 'Exception'
    log_in_as(@user)
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    skip 'Exception'
    log_in_as(@user)
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    skip 'Exception'
    log_in_as(@user)
    patch project_url(@project), params: { project: { name: @project.name, user_id: @project.user_id } }
    assert_redirected_to project_url(@project)
  end

  test "should not destroy project with tasks" do
    skip 'Exception'
    log_in_as(@user)
    assert_difference('Project.count', 0) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end

  test "should destory project" do
    skip 'Exception'
    log_in_as(@user)
    assert_difference('Project.count', -1) do
      delete project_url(@project2)
    end

    assert_redirected_to projects_url
  end
end
