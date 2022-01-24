require 'minitest/autorun'

# Boolean Assertions
# https://launchschool.com/exercises/66216db8
class BooleanAssertions < Minitest::Test
    def test_value_odd
        assert(3.odd?, "Value is not odd")
    end
end

# Equality Assertions
# https://launchschool.com/exercises/d69b88d6

class EqualityAssertions < Minitest::Test
    def test_value_downcase
        assert_equal('xyz', "xyz".downcase, "Value is not xyz")
    end
end

# Nil Assertions
# https://launchschool.com/exercises/e1183a98

class NilAssertions < Minitest::Test
    def test_value_is_nil
        assert_nil(nil, "Value is not nil")
    end
end

# Empty Object Assertions
# https://launchschool.com/exercises/eaa85d07

class EmptyObjectAssertions < Minitest::Test
    def test_empty_object
        assert_empty([], "list is not empty")
    end
end

# Included Object Assertions
# https://launchschool.com/exercises/12b78daf

class IncludedObjectAssertions < Minitest::Test
    def test_included_object
        assert_includes(["abc", "xyz"], 'xyz', "'xyz' is not included in list")
    end
end

# Exception Assertions
# https://launchschool.com/exercises/82b73047

=begin
class ExceptionAssertions < Minitest::Test
    def test_NoExperienceError_exception_raised
        assert_raises(NoExperienceError){employee.hire} 
    end
end
=end

# Type Assertions
# https://launchschool.com/exercises/92e1ef71

class TypeAssertions < Minitest::Test
    def test_only_instane_of_Numeric
        assert_instance_of(Numeric, 123, "Not a Numeric instance")
    end
end

# Kind Assertions
# https://launchschool.com/exercises/098fba0b

class KindAssertions < Minitest::Test
    def test_kind_of_Numeric
        assert_kind_of(Numeric, 0.11, "Value is not Numeric or any subclass of Numeric")
    end
end

# Same Object Assertions
# https://launchschool.com/exercises/9eed2942

class SameObjectAssertions < Minitest::Test
    def test_same_object
        list = "this is a list"
        new_list = "this is a list"
        assert_same(list, new_list, "list and new_list are not the same object")
    end
end

# Refutations
# https://launchschool.com/exercises/4ac8e502

class Refutations < Minitest::Test
    def test_refutation
        list = ['abc', 'xyz']
        refute_includes(list, 'xyz', "xyz is an element of list")
    end
end