require "fileutils"
require "test/unit"

class MyTest < Test::Unit::TestCase

  def test_get
    FileUtils.rm("foo.txt", force: true)
    `echo 'get foo.txt' | tftp localhost 6969`
    assert_equal("Puppy duckling kitten\n", File.read("foo.txt"))
  end

end
