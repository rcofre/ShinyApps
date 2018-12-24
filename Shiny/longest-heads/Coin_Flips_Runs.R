##################################################
#  R code written by:                            #
#                                                #
#  Jimmy A. Doi (jdoi@calpoly.edu)               #
#  Department of Statistics                      #
#  Cal Poly State Univ, San Luis Obispo          #
#  Web: www.calpoly.edu/~jdoi                    #
#                                                #
#  ............................................  #
#                                                #
#  Shiny app site:                               #
#        calpolystat.shinyapps.io/LongRun        #
#  ............................................  #
#                                                #
#                     Code updated on: 3SEP2014  #
##################################################

flip.gen <- function(trials,prob){

  # Generate random uniform variates
  flips <-runif(trials)

  # COINS will have Heads (1) or Tails (0)
  coins <- seq(1:length(flips))

  for (i in 1:length(flips)){
    if (flips[i]<=prob) coins[i] = 1
    else coins[i] = 0
  }

  coords <- matrix(NA,ncol=3,nrow=(length(coins)))

  colnames(coords) <- c("coin","segment","run")

  coords[,1]<-coins

  # SEGMENT will be an ID number attached to each run

  segment <- 1

  coords[1,2] <- 1 # automatic start at 1 for first row

  for (i in 2:length(coins)){

    coin1 <- coords[i-1,1]
    coin2 <- coords[i,1]

    if (coin1 == coin2) coords[i,2] <- segment
    if (coin1 != coin2) {
      segment <- segment +1
      coords[i,2] <- segment}
  }

  # MY.RUNS will determine the observed frequency of
  # each SEGMENT value [using table()], thereby
  # determining the exact run length for each run.

  my.runs <- table(coords[,2])

  # In the following loop, for each unique value of
  # SEGMENT, the corresponding run length will be assigned

  for (i in 1:length(my.runs)){
    coords[coords[,2]==i,3]<-my.runs[i]
  }
  return(coords)
}

###############################################################################

plot.flips <- function(run.min,coords,my.cex,sub.flag){

# run.min  = Specified minimum run length to color
# coords   = Returned matrix from call to FLIP.GEN()
# my.cex   = Specified font size
# sub.flag = Indicator of whether to include subtitle MY.SUB

    	if(missing(sub.flag))  sub.flag <- 0
    	if(missing(my.cex))      my.cex <- 2
  
      my.cex <- seq(1,2.5,,10)[my.cex]

      # Determine the observed maximum run length
      max.run <- max(coords[,3])

      my.title <- paste("n = ", nrow(coords), ", Longest run = ",max.run,
                        "\n Marked runs of at least ",run.min,sep="")

      my.sub <- " "

      n <- nrow(coords)

      # Subtitle to include point and interval estimates
      if (sub.flag==1){

        # The point and interval estimates for the approximate length
        # of the longest run are stored in PRED_ESTIMATES.TXT and were
        # provided by M. Schilling (see references).
        #
        # The file contains 4 columns corresponding to sample size,
        # predicted approximate length of longest run, and the lower/upper
        # limits for the 95% prediction interval.
        pred.est <- read.table("pred_estimates.txt", header=F)
        sel.row <- pred.est[(pred.est[,1]==n),]
        my.sub <- paste("Predicted approximate longest run = ",
                        sel.row[2],
                        "\n Appx. 95% prediction interval for longest run = [",#
                        sel.row[3],",",sel.row[4],"]",sep="")
      }

      # Trim white space around plot [default is mar=c(4.1,4.1,4.1,4.1)]
      # By trimming, this allows a better view of plot
      par(mar=c(3,.5,3,.5)+0.1)

      # Plot will use rows of a maximum of 25 outcomes per row
      plot(1,1,xlim=c(0,25+1),ylim=c(0,ceiling(nrow(coords)/25)+1),col=0,
           yaxt="n",xaxt="n",xlab="",ylab="",main=my.title)

      mtext(my.sub,1,2,cex=1.2)

      # X will be the horizontal Cartesian coordinate of coin flip
      # [Range of X will be 1, 2, ..., 25]
      # Y will be the vertical Cartesian coordinate of coin flip
      # [Range of Y will be 1, 2, ..., ceiling(TRIALS/25)]
      i <- seq(1,nrow(coords))
      x <- i %% 25
      x[which(x==0)]<-25
      y <- ceiling(nrow(coords)/25) - ceiling(i/25) + 1

      coords <- cbind(coords,x,y)

      # Plot the outcome of each coin flip:
      # Use color for any outcome belonging to
      # a run whose length is at least RUN.MIN
      for (i in 1:nrow(coords)){
        my.coin <- coords[i,1]
        if (my.coin==1) {
          if (coords[i,3]>=run.min) text(coords[i,4],coords[i,5],"H",
                                         col="red",font=2,cex=my.cex)
          else text(coords[i,4],coords[i,5],"H",cex=my.cex)}
        if (my.coin==0) {
          if (coords[i,3]>=run.min) text(coords[i,4],coords[i,5],"T",
                                         col="deepskyblue",font=2,cex=my.cex)
          else text(coords[i,4],coords[i,5],"T",cex=my.cex)}
          }
    }