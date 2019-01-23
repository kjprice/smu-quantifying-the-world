# local testing
server.path = 'http://rdatasciencecases.org/Data'
local.path = '../data'

file.names = c('offline.final.trace.txt', 'online.final.trace.txt')

download.data = function() {
  
  for (file.name in file.names) {
    destination.file = file.path(local.path, file.name)
    server.filepath = file.path(server.path, file.name)
    if (!file.exists(destination.file)) {
      res <- tryCatch(download.file(server.filepath,
                                    destfile=destination.file,
                                    method='auto'),
                      error=function(e) 1)
    } else {
      print(sprintf('%s  already exists', destination.file))
    }
  }
}

load.data = function() {
  readChar(local.filepath, file.info(local.filepath)$size)
}

transform.row = function(row) {
  
}

transform.to.dataframe = function(data) {
  rows = unlist(strsplit(data, '\n'))
  ## I left off here - this is not a dataframe yet
  rows
}

download.data()

local.data = load.data()
local.dataframe = transform.to.dataframe(local.data)
