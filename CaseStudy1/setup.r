# local testing
local.filepath = '../data/offline.final.trace.txt_HEAD'
#local.filepath = '../data/offline.final.trace.txt'

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
