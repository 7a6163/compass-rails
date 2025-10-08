# Compatibility patches for Ruby 3.2+
# In Ruby 3.2+, File.exists? was removed in favor of File.exist?
# This patch restores File.exists? for compatibility with older gems like Compass

if RUBY_VERSION >= '3.2' && !File.respond_to?(:exists?)
  class << File
    alias_method :exists?, :exist?
  end
end

if RUBY_VERSION >= '3.2' && !Dir.respond_to?(:exists?)
  class << Dir
    alias_method :exists?, :exist?
  end
end
