def vi
  require 'tempfile' unless defined? Tempfile
  @f ||= Tempfile.new('irb-interactive')
  system('vim', @f.path)
  Object.class_eval File.read(@f.path) if $?.success?
end
