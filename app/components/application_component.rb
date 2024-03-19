# frozen_string_literal: true

class ApplicationComponent
  def self.slot(name)
    class_eval <<-CODE, __FILE__, __LINE__ + 1
      attr_writer :#{name}

      def #{name}(&block)
        if block_given?
          @#{name} = @view_context.capture(&block)
        else
          @#{name}
        end
      end

      def #{name}?
        !!@#{name}
      end
    CODE
  end
end
