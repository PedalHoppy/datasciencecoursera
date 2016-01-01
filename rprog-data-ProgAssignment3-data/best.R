## Function to find the best hospital in specified state for specified outcome

best <- function(state, outcome) {
  ## Read outcome data
  alldata <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
  ## Make named vector of acceptable input for outcome to aid in selection/verification
  outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
  ## Check that state and outcome are valid
    if (!outcome %in% names(outcomes)) {
      stop("invalid outcome")
    }
    if (!state %in% alldata[,7]) {
      stop ("invalid state")
    }
  ## select only relevant columns and sort for easier processing
  mydata <- na.omit(alldata[, c(2,7, outcomes[outcome])])
  mydata <- mydata[order(mydata[,2],mydata[,3],mydata[,1]),]
  names(mydata) <- c("hospital", "state", "outcome")
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  mystate <- mydata[mydata[,"state"]==state,]
  best <- mystate[1,1]
  best
  
}