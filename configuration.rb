require 'optparse'
class Configuration
  attr_accessor :options
  def initialize
    @options={}
    config_file="#{$0}.conf"
    self.argument_parse
    if @options[:conf]
      config_file=@options[:conf]
    end
    inp=File.new(config_file,"r")
    while line=inp.gets do
      k,v=line.chomp.split("=")
      k=k.downcase
      if !@options[k]
        @options[k]=v
      end
    end
  end
  def argument_parse
    OptionParser.new do |opts|
      opts.banner = "Usage: #{$0} <recipe> <production rate> [options]"
      opts.on("-r","--recipes RECIPES_FILE", "Specify RECIPES_FILES to read recipes from") do |v|
        @options["recipes"]=v
      end
      opts.on("-c","--conf CONF_FILE", "Specify CONF_FILE to read configuration from") do |v|
        @options["conf"]=v
      end
      opts.on("-m","--multiple x,y,z","Computes and adds the factories/production requirements for multiple recipe") do |v|
        @options["multiple"]=true
        puts "MULTIPLE #{v}"
        @options["to_craft"]=v.split(",").map{|x| x.gsub(" ","-").downcase}
      end
    end.parse!
    if ARGV.size < 1 && !@options["multiple"]
      puts "Usage: #{$0} <recipe> (<target rate>) [options]"
      exit
    end
    @options["target_rate"]=-1
    if !@options["multiple"]
      @options["to_craft"]=ARGV[0].gsub(" ","-").downcase
      if ARGV.size == 2
        @options["target_rate"]=ARGV[1].to_f
      end
    else
      if ARGV.size==1
        @options["target_rate"]=ARGV[0].to_f
      end
    end
  end
end
