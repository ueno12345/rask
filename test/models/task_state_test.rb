require "test_helper"

class TaskStateTest < ActiveSupport::TestCase

  test "should create task_state with correct data" do
    assert TaskState.new(name: "test", priority: 0).valid?
  end

  test "should not create task_state without name" do
    skip ''
    assert_not TaskState.new(priority: 0).valid?
  end

  test "should not create task_state without priority" do
    skip ''
    assert_not TaskState.new(name: "test").valid?
  end

  test "should delete task_state" do
    skip 'Exception'
    TaskState.new(name: "test", priority: 0)
    assert_not TaskState.last.destroy
  end

end
