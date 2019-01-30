


# Monthly estimated Atl herring catch

catchEst <- c(May = 43.09,
              June = 54.51,
              July = 45.70)

catchSD <- c(May = 6.97,
             June = 7.51,
             July = 5.29)

###############################################


yrg <- c(0, max(catchEst + catchSD)) # y range will be 0 and the absolute max
xrg <- range(0:4)                    # run the x axis range from 0 to 4

plot(x = NA,       # NA means that nothing will be plotted
     xlim = xrg,   # specify the x axis plotting limits
     ylim = yrg)   # specify the y axis plotting limits

# Plot the three bars using the rect() function
rect(xleft = 0.8,        # minimum in the x direction
     ybottom = 0,        # minimum in the y direction
     xright = 1.2,       # maximum in the x direction
     ytop = catchEst[1]) # maximum in the y direction will be the estimated
                         # value for catch in May

rect(xleft = 1.8,
     ybottom = 0,
     xright = 2.2,
     ytop = catchEst[2])

rect(xleft = 2.8,
     ybottom = 0,
     xright = 3.2,
     ytop = catchEst[3])

