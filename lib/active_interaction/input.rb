# frozen_string_literal: true

module ActiveInteraction
  # Represents a processed input.
  class Input
    def initialize(value: nil, error: nil)
      @value = value
      @error = error
    end

    # @overload value
    #   The processed input value.
    attr_reader :value

    # @overload error
    #   Any error that occurred during processing.
    #
    #   @return [InvalidValueError, MissingValueError, InvalidNestedValueError]
    attr_reader :error
  end

  # Represents a processed array input.
  class ArrayInput < Input
    def initialize(value: nil, error: nil, children: [])
      super(value: value, error: error)
      @children = children
    end

    # @overload children
    #   Child inputs if a nested filter is used.
    #
    #   @return [Input, ArrayInput]
    attr_reader :children
  end
end
