class Mysql_Command
  @command = ""
  @query   = ""
  
  def initialize(node)
    @command = ""    
    @query   = ""
    get_options(node)
  end

  #todo?   split options...
  def get_options(node)
    cmd  = node[:bin_mysql] 
    cmd += " -h " + node[:host]
    cmd += " -P " + node[:port]
    cmd += " -u " + node[:username]
    cmd += " -p\""  + node[:password] + '"'

    @command = cmd
  end
  
  def query(q)
      @query  =  " -e '" + q + "'"
  end

  def cmd
    @command + @query
  end
  
end
