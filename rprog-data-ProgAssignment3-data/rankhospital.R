## rankhospital function ranks at given number in given state
## rank can be numeric or "best" or "worst"

rankhospital <- function(state, outcome, num="best") {
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
  ## select only relevant columns and sort for easier processing and accurate tie-break
  mydata <- na.omit(alldata[, c(2,7, outcomes[outcome])])
  mydata <- mydata[order(mydata[,2],mydata[,3],mydata[,1]),]
  names(mydata) <- c("hospital", "state", "outcome")
  # split by state 
  bystate <- split(mydata, mydata$state)
  mystate <- bystate[state[]]
  if (num == "worst"){
    num <- nrow(mystate[[1]])
  }
  if (num == "best") {
    num <- 1
  }
  rankhosp <- mystate[[1]][num,1]
  rankhosp
}