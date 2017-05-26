regex = "/(*).rar"

def input
    case ARGV[0] 
    when "-p" then 
        password = ARGV[1]
        listOfFiles = convertAddress(2)
        processFiles listOfFiles 
    else 
        listOfFiles = convertAddress(0)
        processFiles listOfFiles
    end 
end 

def convertAddress(startIndex)
    startIndex.times do 
        ARGV.shift 
    end 
    
    ARGV.each do |path| 
        case path[0]
        when '/' then 
            return [address]
        when '.' then 
            arr = Dir.entries(".")
            arr.shift 
            return arr.shift 
        else 
            pwd = File.basename(Dir.getwd)
            return [pwd + address]
        end 
    end 
end 

# process the list of compressed file paths 
def processFiles(list) 
   list.each do  |path|
      name = getFileName path
      system ("mkdir #{name}")
      system ("cd #{name}")
   end 
end 

# use regular expression to extract the 
# file name from the path 
def getFileName(path) 

end 

