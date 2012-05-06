module DateMolder
  class Parser
    attr_accessor :init, :formats, :solutions, :parsed_time

    def initialize(str, formats)
      @str = str
      @init = str.dup
      @formats = formats
      @solutions= []
      @parsed_time = Time.parse(str)
    end

    def parse
      parse_internal(@str, 0)
    end

    private

    def parse_internal(str, index)
      if index >= @formats.keys.size
        @solutions << str if @parsed_time.strftime(str) == @init
        return @solutions
      end
      @formats[@formats.keys[index]].each do |val|
        if m = build_format_regexp(val).match(str)
          parse_internal(str.sub(m[0], "%#{val}"), index + 1)
        end
      end
      parse_internal(str, index + 1) if index + 1 <= @formats.keys.size
      @solutions
    end

    def build_format_regexp(value)
      /(#{Regexp.escape(@parsed_time.strftime("%#{value}"))})/i
    end
  end
end
