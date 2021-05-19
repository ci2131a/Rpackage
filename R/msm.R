# functions for converting data sets to the msm format


# transforms data from the counting process notation
# (i.e. times are start, stop) into the longitudinal
# format where time is one column


surv2msm <- function(data, id, time1, time2, event, tvars = NULL, msmevent = TRUE, rcb2 = TRUE){
# all other variables should get carried over

  # input checks
  if(missing(data)) stop("Argument to data not supplied")
  if(missing(id)) stop("Argument to id not supplied")
  if(missing(time1)) stop("Argument to time1 not supplied")
  if(missing(time2)) stop("Argument to time2 not supplied")
  if(missing(event)) stop("Argument to event not supplied")



  #if(!is.numeric(data[[time1]])) stop("time inputs must be numeric")
  #if(!is.numeric(data[[time2]])) stop("time inputs must be numeric")
  if(!is.numeric(data[[event]])) stop("event variable must be numeric")

  if(!rcb2){

# subset first observation of each person
  first <- data[!duplicated(data[id]),!(names(data) %in% c(time2))]
# rename time variable
  names(first)[names(first)==time1] <- "time"
# ensure the starting status is the same as the first event
  first[,event] <- min(data[event])
# drop start variable
  drop <- data[,!(names(data) %in% c(time1))]
  names(drop)[names(drop)==time2] <- "time"
# combine the stop times with the first start time
  newdata <- rbind(first,drop)
# sort the data by id and time
  sorted <- newdata[order(newdata[id], newdata["time"]),]

  if(msmevent){
    if(0 %in% min(ce)){
      sorted[event] <- sorted[event]+1
    }else{
      warning("Event values not changed in msmevent")
    }
  }
# returns
  return(sorted)

  }
  else{
    first <- data[,!names(data) %in% c(time2,event)]
    names(first)[names(first) == time1] <- "time"
    last <- data[,!names(data) %in% c(time1,tvars)]
    names(last)[names(last) == time2] <- "time"
    newdata <- merge(first,last,all = TRUE)
    if(0 %in% min(data[[event]])){
      newdata[[event]][is.na(newdata[[event]])] <- min(data[[event]])
    }
    if(0 %in% min(data[[event]]) & msmevent){
      newdata[event] <- newdata[event] + 1
    }
    else{
      warning("Event values not changed in msmevent")
    }

    return(newdata)
  }

}








