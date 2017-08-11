module Liquid
  class Drop
    class Str < String
      attr_writer :context

      # --
      # Mocks `#is_a?` so that Liquid thinks we are a
      #   drop. If it ever decides to ask.
      # --
      def is_a?(v)
        v == Liquid::Drop || super(v)
      end

      # --
      # Liquid version of `method_missing`, except it only
      #   works for Liquid and only takes the method.
      # @return Error.
      # --
      def liquid_method_missing(method)
        return nil unless @context && @context.strict_variables
        raise Liquid::UndefinedDropMethod, \
          "undefined method #{method}"
      end

      # --
      # Invokes a method on the drop if it exist and is
      #   not blacklisted.  We blacklist most methods by
      #   default if it's on `String`, `Array`, `Enumberable`
      #   `Hash` and this own class...
      # --
      def invoke_drop(m)
        self.class.invokable?(m) ? send(m) : liquid_method_missing(m)
      end

      # --
      def to_liquid
        self
      end

      # --
      def key?(_)
        true
      end

      # --
      # This is `.invokable?` when it comes to Liquids own
      #   source.  We change it to discourage users from overriding
      #   the methods because this is a wrapper.
      # --
      def self.invokable?(m)
        invokable_methods.include?(m.to_s)
      end

      # --
      def self.invokable_methods
        @invokable_methods ||= begin
          Set.new(good.map(&:to_s))
        end
      end

      private
      def self.bad
        @bad ||= begin bad = []
          bad = bad |       Drop.public_instance_methods
          bad = bad |      Array.public_instance_methods
          bad = bad | Enumerable.public_instance_methods
          bad = bad |     String.public_instance_methods
          bad = bad |       Hash.public_instance_methods
        end
      end

      private
      def self.good
        @good ||= [:to_liquid] | (
          public_instance_methods - bad
        )
      end

      # --

      alias_method :===, :is_a?
      alias_method :[], :invoke_drop
    end
  end
end
