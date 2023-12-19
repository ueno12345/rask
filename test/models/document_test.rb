require "test_helper"

class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Should create document with correct data" do
    skip ''
    assert Document.new(content: 'test', description: 'test').save
  end

  test "Should not create document without content" do
    skip ''
    assert_not Document.new.save
  end

  test "Should delete document" do
    p("\n\n\n\ncheck\n\n\n\n")
    document = Document.create(content: 'test', description: 'test')
    assert document.destroy
  end

end
