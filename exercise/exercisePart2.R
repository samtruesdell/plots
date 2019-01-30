

## Part 2 tasks:
## 
##    (1) Draw the rectangles using one call to rect()
##    (2) Color the rectangles gray
##    (3) rotate the y axis labels so they are horizontal



# Monthly estimated Atl herring catch

catchEst <- c(May = 43.09,
              June = 54.51,
              July = 45.70)

catchSD <- c(May = 6.97,
             June = 7.51,
             July = 5.29)

###############################################


yrg <- c(0, max(catchEst + catchSD))
xrg <- range(0:4)

plot(x = NA,
     xlim = xrg,
     ylim = yrg,
     las = 1)    # las = 1 rotates the y axis labels

rect(xleft = c(0.8, 1.8, 2.8),  # Include the minimum x value for all 3
                                # rectangles
     ybottom = c(0, 0, 0),      # Each of the 3 minimum y values will be 0
                                # (note that if you use just one 0 here that
                                # will work too because it will be recycled
     xright = c(1.2, 2.2, 3.2), # Include the maximum x value for all 3
                                # rectangles
     ytop = catchEst,           # Include the entire vector for catch estimates
     col = 'gray')              # set the rectangle color to be gray



