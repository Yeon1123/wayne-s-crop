then <- Sys.time()
repeat{
  now <- Sys.time()
  if(as.numeric(difftime(now, then, unit="secs") > 60)){
    print("60sec")
    then <- Sys.time()
    rmarkdown::render("view_data.Rmd")
  }
  if(as.numeric(difftime(now, then, unit="secs") > 15)){
    print("15sec")
    then <- Sys.time()
    rmarkdown::render("60sec.Rmd")
  }
}

