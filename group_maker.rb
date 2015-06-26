require_relative 'config/application'
require_relative 'lib/import'

unless ARGV.empty?
  import_text_file(ARGV[0])
end

Controller.new
