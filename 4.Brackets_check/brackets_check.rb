def valid_brackets?(string)
    brackets = {
      '(' => ')',
      '{' => '}',
      '[' => ']'
    }
    stack = []
    string.each_char do |char|
      if brackets.key?(char)
        stack.push(char)
      elsif brackets.value?(char)
        return false if stack.empty? || brackets[stack.pop] != char
      end
    end
    stack.empty?
  end

  # Примеры использования:
  puts valid_brackets?("(){}[]")    # => true
  puts valid_brackets?("([{}])")    # => true
  puts valid_brackets?("(}")        # => false
  puts valid_brackets?("[(])")      # => false
  puts valid_brackets?("[({})](]")  # => false