require "test_helper"

class TaskStateTest < ActiveSupport::TestCase

  test "should create task_state with correct data" do
    assert TaskState.new(name: "test", priority: 0).valid?
  end

  test "should not create task_state without name" do
    assert_not TaskState.new(priority: 0).valid?
  end

  test "should not create task_state without priority" do
    assert_not TaskState.new(name: "test").valid?
  end

  test "should delete task_state have no task" do
    TaskState.create(name: "test", priority: 0)
    assert TaskState.last.destroy
  end

  test "should not delete task_state have task" do
    TaskState.create(name: "test", priority: 0)
    Task.create(creator_id: users(:one).id,
                assigner_id: users(:two).id,
                due_at: Time.zone.now,
                project_id: projects(:one).id,
                content: 'testtask',
                task_state_id: TaskState.last.id,
                description: "This is test task")
    assert_raises(ActiveRecord::DeleteRestrictionError) do
      TaskState.last.destroy
    end
  end

end
