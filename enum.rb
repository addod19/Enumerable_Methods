module Enumerable
    private

    def convert_to_array(object)
        return object.to_a if object.respond_to?(:to_a)
        NoMehodError.new("Undefined method `#{caller_location[-2].label}` for #{object}: #{object.class}")
    end

    public

    def my_each

    end

    def my_each_with_index

    end

    def my_select

    end

    def my_all

    end
    def my_any

    end

    def my_none

    end

    def my_count

    end

    def my_map

    end

    def my_inject

    end
end



def multiply_els arr

end
p convert_to_array([])