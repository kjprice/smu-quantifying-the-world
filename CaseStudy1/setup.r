local.filepath = '../data/offline.final.trace.txt'

download.data = function() {
  source.file = 'http://rdatasciencecases.org/Data/offline.final.trace.txt'
  destination.file = local.filepath
  
  if (!file.exists(destination.file)) {
    res <- tryCatch(download.file(source.file,
                                  destfile=destination.file,
                                  method='auto'),
                    error=function(e) 1)
  } else {
    print('destination file already exists')
  }
}

load.data = function() {
  read.delim(local.filepath)
}

download.data()

local.data = load.data()

# while testing - TODO: Delete
local.data = head(local.data)
