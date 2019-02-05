then <- Sys.time()
repeat{
  now <- Sys.time()
  if(as.numeric(difftime(now, then, unit="secs") > 60)){
    print(then)
    print(now)
    then <- Sys.time()
    rmarkdown::render("view_data.Rmd")
  }
}

then <- Sys.time()
repeat{
  now <- Sys.time()
  if(as.numeric(difftime(now, then, unit="secs") > 15)){
    print(then)
    print(now)
    then <- Sys.time()
    rmarkdown::render("60sec.Rmd")
  }
}

