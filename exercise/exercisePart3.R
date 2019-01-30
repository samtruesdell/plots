

## Part 3 tasks:
## 
##    (1) Use the arrows() function to include error bars that indicate the
##        standard deviation


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
     las = 1)

rect(xleft = c(0.8, 1.8, 2.8),
     ybottom = c(0, 0, 0),
     xright = c(1.2, 2.2, 3.2),
     ytop = catchEst,
     col = 'gray')

# The arrows() function here will display the sd associated with each of
# the landings values
arrows(x0 = c(1, 2, 3),          # starting x location for each arrow
       y0 = catchEst,            # starting y location for each arrow
       x1 = c(1, 2, 3),          # ending x location for each arrow
       y1 = catchEst + catchSD,  # ending y location for each arrow
       code = 2,                 # code=2 specifies arrow head on end
       angle = 90)               # arrow head angle: 90 for flat

