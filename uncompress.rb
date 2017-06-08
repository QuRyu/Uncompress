# current problem: CL does not accept file names with braces 
# try to add "\" before braces 



$regex = /.*\/(.*)\.rar/

def input()
    case ARGV[0] 
    when "-p" then 
        password = ARGV[1]
        listOfFiles = convertAddress(2)
        puts password 
        processFiles(listOfFiles, password)
    else 
        listOfFiles = convertAddress(0)
        processFiles listOfFiles
    end 
end 

def convertAddress(startIndex)
    startIndex.times do 
        ARGV.shift 
    end 

    result = [] 
    
    ARGV.each do |path| 
        case path[0]
        when '/' then 
            result.push path
        when '.' then 
            arr = Dir.entries(".")
            arr.shift 
            arr.shift 
            puts arr
            result + arr 
        else 
            pwd = Dir.getwd + '/'
            result.push(pwd + path)
        end 
    end 
    return result 
end 

# process the list of compressed file paths 
def processFiles(list) 
   list.each do  |path|
      name = getFileName path
      puts name 
      system ("mkdir #{name}")
      system ("cd #{name}")
      system ("unrar ../#{name}.rar")
      #system ("rm ../#{name}.rar")
   end 
end 

def processFiles(list, password) 
    list.each do |path| 
        name = getFileName path 
        puts name 
        system ("mkdir #{name}")
        system ("cd #{name}")
        system ("unrar e #{path}")
        #system ("rm ../#{name}.rar")
        system (password) 
    end 
end 

# use regular expression to extract the 
# file name from the path 
def getFileName(path) 
    return removeBraces($regex.match(path)[1])
end 

def removeBraces(s) 
    return s.delete("()").gsub(/\s+/, "")
end 

def format(s) 
end 
