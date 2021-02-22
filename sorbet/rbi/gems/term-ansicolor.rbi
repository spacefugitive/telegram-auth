# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/term-ansicolor/all/term-ansicolor.rbi
#
# term-ansicolor-1.7.1

module Term::ANSIColor
  def attributes; end
  def black(string = nil, &block); end
  def blink(string = nil, &block); end
  def blue(string = nil, &block); end
  def bold(string = nil, &block); end
  def bright_black(string = nil, &block); end
  def bright_blue(string = nil, &block); end
  def bright_cyan(string = nil, &block); end
  def bright_green(string = nil, &block); end
  def bright_magenta(string = nil, &block); end
  def bright_red(string = nil, &block); end
  def bright_white(string = nil, &block); end
  def bright_yellow(string = nil, &block); end
  def clear(string = nil, &block); end
  def color(name, string = nil, &block); end
  def conceal(string = nil, &block); end
  def concealed(string = nil, &block); end
  def cyan(string = nil, &block); end
  def dark(string = nil, &block); end
  def faint(string = nil, &block); end
  def green(string = nil, &block); end
  def intense_black(string = nil, &block); end
  def intense_blue(string = nil, &block); end
  def intense_cyan(string = nil, &block); end
  def intense_green(string = nil, &block); end
  def intense_magenta(string = nil, &block); end
  def intense_red(string = nil, &block); end
  def intense_white(string = nil, &block); end
  def intense_yellow(string = nil, &block); end
  def italic(string = nil, &block); end
  def magenta(string = nil, &block); end
  def negative(string = nil, &block); end
  def on_black(string = nil, &block); end
  def on_blue(string = nil, &block); end
  def on_bright_black(string = nil, &block); end
  def on_bright_blue(string = nil, &block); end
  def on_bright_cyan(string = nil, &block); end
  def on_bright_green(string = nil, &block); end
  def on_bright_magenta(string = nil, &block); end
  def on_bright_red(string = nil, &block); end
  def on_bright_white(string = nil, &block); end
  def on_bright_yellow(string = nil, &block); end
  def on_color(name, string = nil, &block); end
  def on_cyan(string = nil, &block); end
  def on_green(string = nil, &block); end
  def on_intense_black(string = nil, &block); end
  def on_intense_blue(string = nil, &block); end
  def on_intense_cyan(string = nil, &block); end
  def on_intense_green(string = nil, &block); end
  def on_intense_magenta(string = nil, &block); end
  def on_intense_red(string = nil, &block); end
  def on_intense_white(string = nil, &block); end
  def on_intense_yellow(string = nil, &block); end
  def on_magenta(string = nil, &block); end
  def on_red(string = nil, &block); end
  def on_white(string = nil, &block); end
  def on_yellow(string = nil, &block); end
  def rapid_blink(string = nil, &block); end
  def red(string = nil, &block); end
  def reset(string = nil, &block); end
  def reverse(string = nil, &block); end
  def self.attributes; end
  def self.coloring=(val); end
  def self.coloring?; end
  def self.create_color_method(color_name, color_value); end
  def self.term_ansicolor_attributes; end
  def strikethrough(string = nil, &block); end
  def support?(feature); end
  def term_ansicolor_attributes; end
  def uncolor(string = nil); end
  def uncolored(string = nil); end
  def underline(string = nil, &block); end
  def underscore(string = nil, &block); end
  def white(string = nil, &block); end
  def yellow(string = nil, &block); end
  extend Term::ANSIColor
  include Term::ANSIColor::Movement
end
module Term
end
class Term::ANSIColor::Attribute
  def apply(string = nil, &block); end
  def background?; end
  def code; end
  def distance_to(other, options = nil); end
  def gradient_to(other, options = nil); end
  def gray?; end
  def initialize(name, code, options = nil); end
  def name; end
  def rgb; end
  def rgb_color?; end
  def self.[](name); end
  def self.attributes(&block); end
  def self.get(name); end
  def self.named_attributes(&block); end
  def self.nearest_rgb_color(color, options = nil); end
  def self.nearest_rgb_on_color(color, options = nil); end
  def self.rgb_colors(options = nil, &block); end
  def self.set(name, code, options = nil); end
  def to_rgb_triple; end
end
module Term::ANSIColor::RGBColorMetricsHelpers
end
module Term::ANSIColor::RGBColorMetricsHelpers::WeightedEuclideanDistance
  def weighted_euclidean_distance_to(other, weights = nil); end
end
module Term::ANSIColor::RGBColorMetricsHelpers::NormalizeRGBTriple
  def normalize(v); end
  def normalize_rgb_triple(rgb_triple); end
end
module Term::ANSIColor::RGBColorMetrics
  def self.metric(name); end
  def self.metric?(name); end
  def self.metrics; end
end
module Term::ANSIColor::RGBColorMetrics::Euclidean
  def self.distance(rgb1, rgb2); end
end
module Term::ANSIColor::RGBColorMetrics::NTSC
  def self.distance(rgb1, rgb2); end
end
module Term::ANSIColor::RGBColorMetrics::CompuPhase
  def self.distance(rgb1, rgb2); end
end
module Term::ANSIColor::RGBColorMetrics::YUV
  def self.distance(rgb1, rgb2); end
end
class Anonymous_Struct_5 < Struct
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
  def u; end
  def u=(_); end
  def v; end
  def v=(_); end
  def y; end
  def y=(_); end
end
class Term::ANSIColor::RGBColorMetrics::YUV::YUVTriple < Anonymous_Struct_5
  def self.from_rgb_triple(rgb_triple); end
  include Term::ANSIColor::RGBColorMetricsHelpers::WeightedEuclideanDistance
end
module Term::ANSIColor::RGBColorMetrics::CIEXYZ
  def self.distance(rgb1, rgb2); end
end
class Anonymous_Struct_6 < Struct
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
  def x; end
  def x=(_); end
  def y; end
  def y=(_); end
  def z; end
  def z=(_); end
end
class Term::ANSIColor::RGBColorMetrics::CIEXYZ::CIEXYZTriple < Anonymous_Struct_6
  def self.from_rgb_triple(rgb_triple); end
  extend Term::ANSIColor::RGBColorMetricsHelpers::NormalizeRGBTriple
  include Term::ANSIColor::RGBColorMetricsHelpers::WeightedEuclideanDistance
end
module Term::ANSIColor::RGBColorMetrics::CIELab
  def self.distance(rgb1, rgb2); end
end
class Anonymous_Struct_7 < Struct
  def a; end
  def a=(_); end
  def b; end
  def b=(_); end
  def l; end
  def l=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
end
class Term::ANSIColor::RGBColorMetrics::CIELab::CIELabTriple < Anonymous_Struct_7
  def self.from_rgb_triple(rgb_triple); end
  extend Term::ANSIColor::RGBColorMetricsHelpers::NormalizeRGBTriple
  include Term::ANSIColor::RGBColorMetricsHelpers::WeightedEuclideanDistance
end
class Term::ANSIColor::RGBTriple
  def ==(other); end
  def blue; end
  def blue_p; end
  def color(string); end
  def css(percentage: nil); end
  def distance_to(other, options = nil); end
  def gradient_to(other, options = nil); end
  def gray?; end
  def green; end
  def green_p; end
  def html; end
  def initialize(red, green, blue); end
  def initialize_copy(other); end
  def invert; end
  def method_missing(name, *args, &block); end
  def percentages; end
  def red; end
  def red_p; end
  def self.[](thing); end
  def self.convert_value(color, max: nil); end
  def self.from_array(array); end
  def self.from_css(css); end
  def self.from_hash(options); end
  def self.from_html(html); end
  def to_a; end
  def to_hsl_triple; end
  def to_rgb_triple; end
  def values; end
  include Term::ANSIColor::RGBColorMetricsHelpers::WeightedEuclideanDistance
end
class Term::ANSIColor::HSLTriple
  def ==(other); end
  def adjust_hue(degree); end
  def complement; end
  def css; end
  def darken(percentage); end
  def desaturate(percentage); end
  def grayscale; end
  def hue2rgb(x, y, h); end
  def hue; end
  def initialize(hue, saturation, lightness); end
  def lighten(percentage); end
  def lightness; end
  def method_missing(name, *args, &block); end
  def saturate(percentage); end
  def saturation; end
  def self.[](thing); end
  def self.from_css(css); end
  def self.from_hash(options); end
  def self.from_rgb_triple(rgb); end
  def to_hsl_triple; end
  def to_rgb_triple; end
end
class Term::ANSIColor::PPMReader
  def each_row; end
  def initialize(io, options = nil); end
  def next_line; end
  def parse_header; end
  def parse_next_pixel; end
  def parse_row; end
  def reset_io; end
  def to_a; end
  def to_s; end
  include Term::ANSIColor
end
class Term::ANSIColor::Attribute::Text
end
class Term::ANSIColor::Attribute::Color8
end
class Term::ANSIColor::Attribute::IntenseColor8
end
class Term::ANSIColor::Attribute::Color256
end
module Term::ANSIColor::Movement
  def clear_screen(string = nil, &block); end
  def erase_in_display(n = nil, string = nil, &block); end
  def erase_in_line(n = nil, string = nil, &block); end
  def hide_cursor(string = nil, &block); end
  def move_backward(columns = nil, string = nil, &block); end
  def move_command(move, string = nil); end
  def move_down(lines = nil, string = nil, &block); end
  def move_forward(columns = nil, string = nil, &block); end
  def move_home(string = nil, &block); end
  def move_to(line = nil, column = nil, string = nil, &block); end
  def move_to_column(column = nil, string = nil, &block); end
  def move_to_line(line = nil, string = nil, &block); end
  def move_to_next_line(lines = nil, string = nil, &block); end
  def move_to_previous_line(lines = nil, string = nil, &block); end
  def move_up(lines = nil, string = nil, &block); end
  def restore_position(string = nil, &block); end
  def return_to_position(string = nil, &block); end
  def save_position(string = nil, &block); end
  def scroll_down(pages = nil, string = nil, &block); end
  def scroll_up(pages = nil, string = nil, &block); end
  def show_cursor(string = nil, &block); end
  def terminal_columns; end
  def terminal_lines; end
end
