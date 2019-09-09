module Enumerable
    private

    def convert_to_array(object)
        return object.to_a if object.respond_to?(:to_a)
        NoMehodError.new("Undefined method `#{caller_location[-2].label}` for #{object}: #{object.class}")
    end

    public

    def my_each
        as_array = convert_to_array(self)
        return as_array unless as_array.is_a?(Array)
        return self.to_enum(:my_each) unless block_given?

        0.upto(as_array.length - 1) { |i| yield(as_array[i])}

        self
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

[1,2,3,4].my_each { |n| puts n * 3 }