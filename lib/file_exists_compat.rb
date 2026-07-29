# Ruby 3.4 removed File.exists? and Dir.exists?.
# annotate 2.6.x still calls File.exists? in its CLI entrypoint.
module FileExistsCompat
  def self.apply
    class << File
      alias_method :exists?, :exist? unless method_defined?(:exists?)
    end

    class << Dir
      alias_method :exists?, :exist? unless method_defined?(:exists?)
    end
  end
end

FileExistsCompat.apply
