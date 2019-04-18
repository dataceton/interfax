require 'serializers/base'

Dir[File.join(File.dirname(__FILE__), 'serializers', '*.rb')].each {|file| require file }
