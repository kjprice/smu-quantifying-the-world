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

download.data()
