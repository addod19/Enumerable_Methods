# frozen_string_literal: true

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
    return to_enum(:my_each) unless block_given?

    0.upto(as_array.length - 1) { |i| yield(as_array[i]) }

    self
  end

  def my_each_with_index
    as_array = convert_to_array(self)
    return as_array unless as_array.is_a?(Array)
    return to_enum(:my_each_with_index) unless block_given?

    0.upto(as_array.length - 1) { |i| yield(as_array[i], [i]) }
    self
  end

  def my_select
    result = []
    as_array = convert_to_array(self)

    return as_array unless as_array.is_a?(Array)
    return to_enum(:my_select) unless block_given?

    0.upto(as_array.length - 1) { |i| result << as_array[i] if yield(as_array[i]) }

    result
  end

  def my_all?(*args)
    as_array = convert_to_array(self)
    len = as_array.length
    return as_array unless as_array.is_a?(Array)

    unless args.empty?
      puts `#{caller[0].split(':')[0..-2].join(':')} warning: arguments already passed` if block_given?
      return as_array.grep(args[0]).length === len
    end

    if block_given?
      0.upto(len - 1) { |i| return false unless yield(as_array[i]) }
    else
      0.upto(len - 1) { |i| return false if as_array[i].nil? || as_array[i] == false }
    end
    true
  end

  def my_any; end

  def my_none; end

  def my_count; end

  def my_map; end

  def my_inject; end
end

def multiply_els(arr); end

a = [2, 4, 6, 8]

p a.my_all?(&:even?)
