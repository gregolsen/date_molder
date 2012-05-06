$:.unshift File.join(File.dirname(__FILE__), 'date_molder')
require 'time'
require 'parser'

module DateMolder

  DATE_FORMATS = {
    :wday => %w{A a u w},
    :year => %w{Y C y},
    :mon  => %w{m _m -m B ^B b ^b},
    :mday => %w{e d -d j},
  }

  AMPM_HOUR   = %w{l -l I}
  SIMPLE_HOUR = %w{k -k H}

  ADDITIONAL_FORMATS = {
    :meridian => %w{p P},
    :zone     => %w{z Z}
  }

  extend self

  def build_format(str)
    formats = build_formats(str)
    parser = Parser.new(str, formats)
    find_solution(parser.parse)
  end

  private

  def find_solution(solutions)
    solutions.select do |format|
      !/[[:digit:]]/.match(format)
    end.sort_by(&:size).first
  end

  def build_formats(str)
    time_hash = Date._parse(str)
    formats = DATE_FORMATS.merge(build_time_formats(str))
    formats.select! { |key, _| time_hash[key] }
    formats.merge(ADDITIONAL_FORMATS)
  end

  def build_time_formats(str)
    {
      :hour => ampm_format?(str) ? AMPM_HOUR : SIMPLE_HOUR,
      :min  => ['M']
    }
  end

  def ampm_format?(str)
    !!/#{Time.parse(str).strftime("%p")}/i.match(str)
  end

end
