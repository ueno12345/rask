require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Should create projects with correct data" do
    assert Project.new(name: 'testdata', user_id: users(:one).id).save
  end

  test "Should not create projects without user_id" do
    assert_not Project.new(name: 'testdata').save
  end

  test "Should not create projects without name" do
    assert_not Project.new(user_id: users(:one).id).save
  end

  test "Should delete projects which does not have task and document" do
    project = Project.create(name: 'testdata', user_id: users(:one).id)
    assert project.destroy
  end

  test "Should not delete projects which has documents" do
    assert_raises(ActiveRecord::DeleteRestrictionError) do
      projects(:has_document).destroy
    end
  end

  test "Should not delete projects which has tasks" do
    assert_raises(ActiveRecord::DeleteRestrictionError) do
      projects(:has_task).destroy
    end
  end
end
