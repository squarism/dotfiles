# *****************************************
#  .irbrc
#
#  Includes lots of nice stuff to make
#  your irb and script/console ruby shell
#  more pretty and productive
#
#  Used to use wirble, then brice.  Now
#  using pry as irb.  @squarism
#
# *****************************************


require 'irb/ext/save-history'
ARGV.concat [ "--readline" ]
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
IRB.conf[:PROMPT_MODE] = :SIMPLE

# ---------------------------------------
#  Hirb - Pretty ActiveRecord tables in a
#         mysql console table view.
# ---------------------------------------
  begin
    require 'hirb'
    Hirb.enable
  rescue LoadError => err
    #warn "Couldn't load Hirb: #{err}"
  end

# ----------------------------------------
#  Indent blocks
# ----------------------------------------
  IRB.conf[:AUTO_INDENT] = true

# ----------------------------------------
#  Set IRB prompt to include project name and env (Rails)
#  app_name[development]> or app_name[production]>, etc...
# ----------------------------------------
  if ENV['RAILS_ENV']
    rails_root = File.basename(Dir.pwd)
    prompt = "#{rails_root}[#{ENV['RAILS_ENV']}]"
    IRB.conf[:PROMPT] ||= {}
    IRB.conf[:PROMPT][:RAILS] = {
      :PROMPT_I => "#{prompt}> ",
      :PROMPT_S => "#{prompt}* ",
      :PROMPT_C => "#{prompt}? ",
      :RETURN => "=> %s\n"
    }
    IRB.conf[:PROMPT_MODE] = :RAILS
  end

# ----------------------------------------
#  Cool stuff just for Rails console
# ----------------------------------------
  if ENV['RAILS_ENV']
    IRB.conf[:IRB_RC] = Proc.new do
      # Alias User[3] for User.find(3) in Rails
      ActiveRecord::Base.instance_eval { alias :[] :find }
      # Cause queries to log to console
      # ActiveRecord::Base.logger = Logger.new(STDOUT)
    end
  end

# ---------------------------------------
#  allows you to say 'helper :application' in your
#  Rails app, then you can use helpers by calling
#  helper.helper_name on the console
#  http://errtheblog.com/posts/41-real-console-helpers
# ---------------------------------------
  if ENV['RAILS_ENV']
    def Object.method_added(method)
      return super(method) unless method == :helper
      (class<<self;self;end).send(:remove_method, :method_added)

      def helper(*helper_names)
        ($helper_proxy ||= Object.new).tap do |helper|
          helper_names.each { |h| helper.extend "#{h}_helper".classify.constantize }
        end
      end

      helper.instance_variable_set("@controller", ActionController::Integration::Session.new)

      def helper.method_missing(method, *args, &block)
        @controller.send(method, *args, &block) if @controller && method.to_s =~ /_path$|_url$/
      end

      helper :application rescue nil
    end
  end

# ---------------------------------------
#  (Array|Object)#grep
#  from http://github.com/joefiorini/dotfiles
# ---------------------------------------

  class Array
    def grep(pattern)
      select {|i| i =~ pattern }
    end
  end
  class Object
    def grep(pattern)
      methods.inject([]) {|all,m| all << m if m =~ pattern }
    end
  end

# ---------------------------------------
#  Local methods for an object
# ---------------------------------------
  class Object
    # Return a list of methods defined locally for a particular object.  Useful
    # for seeing what it does whilst losing all the guff that's implemented
    # by its parents (eg Object).
    def local_methods
      if ENV['RAILS_ENV']
        (methods - ActiveRecord::Base.methods).sort
      else
        (methods - Object.instance_methods).sort
      end
    end
  end

# ---------------------------------------
#  Benchmark block run time
# ---------------------------------------
  def benchmark
    # From http://blog.evanweaver.com/articles/2006/12/13/benchmark/
    # Call benchmark { } with any block and you get the wallclock runtime
    # as well as a percent change + or - from the last run
    cur = Time.now
    result = yield
    print "#{cur = Time.now - cur} seconds"
    puts " (#{(cur / $last_benchmark * 100).to_i - 100}% change)" rescue puts ""
    $last_benchmark = cur
    result
  end

