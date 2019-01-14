download.data = function() {
  source.file = 'http://rdatasciencecases.org/Data/offline.final.trace.txt'
  destination.file = '../data/offline.final.trace.txt'
  
  if (!file.exists(destination.file)) {
    res <- tryCatch(download.file(source.file,
                                  destfile=destination.file,
                                  method='auto'),
                    error=function(e) 1)
  } else {
    print('destination file already exists')
  }
}


download.data()