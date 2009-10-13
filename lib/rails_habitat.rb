module Rails
  class << self
    alias_method :environment, :env

    Dir.entries(File.join(RAILS_ROOT, 'config', 'environments')).each do |file|
      if file =~ /^(.+)\.rb$/
        env = $1

        define_method "#{env}?" do
          RAILS_ENV == env
        end

        define_method "not_#{env}?" do
          RAILS_ENV != env
        end
      end
    end
  end

end
