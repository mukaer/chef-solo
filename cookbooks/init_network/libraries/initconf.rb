class Initconf

  @org_cont
  @cont 
  
  def initialize ()
    reset_cont()
  end


  def reset_cont()
    @org_cont = Array.new
    @cont     = Hash.new
  end
  

  def load_file(path)
    reset_cont()    
    @org_cont = File.read(path).split("\n")
    converter()    
  end

  
  def load_str(str)
    reset_cont()
    @org_cont = str.split("\n")
    converter()
    
  end

  
  def converter()
    @org_cont.each do | str|

      result = inport_key_value(str)
    
      if  result[0].length > 0       
        hash = {result[0] => result[1] }
        @cont = @cont.merge(hash)      
      end
      
    end    
  end

 
  def inport_key_value(str)
    result =str.match(/^[\s]?([\w\.-]*)[\s=]?['"]?([\w\.-\/]*)['"]?.*$/)
    [result[1] ,result[2] ]
    
  end

  
  def get_value(name)
    @cont[name]
  end

  
  def dump
    @cont
  end
  
end
