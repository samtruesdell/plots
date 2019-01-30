

## Part 4 tasks:
## 
##    (1) Supress plotting of the x axis in plot() and create a new, more
##        informative axis using axis()
##    (2) Use the length argument in arrows() to make the error bar hats
##        smaller
##    (3) Supress the x and y axis labels in plot() and use mtext() to
##        include larger, more informative labels
##    (4) Use par(yaxs='i') to make the y axis start at exactly zero. Must
##        also extend the maximum range of the y axis when we do this


# Monthly estimated Atl herring catch

catchEst <- c(May = 43.09,
              June = 54.51,
              July = 45.70)

catchSD <- c(May = 6.97,
             June = 7.51,
             July = 5.29)

###############################################

# extend the maximum y limit by 4%. This is necessary because we will be
# telling plot() that we want to use the exact y plotting limits that we
# specify and we will need a little extra space up top
yrg <- c(0, max( (catchEst + catchSD) * 1.04 ))
xrg <- range(0:4)

plot(x = NA,
     xlim = xrg,
     ylim = yrg,
     las = 1,
     xlab = '',    # supress x axis label
     ylab = '',    # supress y axis label
     xaxt = 'n',   # supress plotting of x axis
     yaxs = 'i')   # tell R you want the y limits to be exactly as specified
                   # in the ylim argument

axis(side = 1,         # which side do you want the axis on (1 for bottom)
     at = c(1, 2, 3),  # where do you want the ticks and labels to be
     labels = c('May', 'Jun', 'Jul'))  # text for the labels

rect(xleft = c(0.8, 1.8, 2.8),
     ybottom = c(0, 0, 0),
     xright = c(1.2, 2.2, 3.2),
     ytop = catchEst,
     col = 'gray')

arrows(x0 = c(1, 2, 3),
       y0 = catchEst,
       x1 = c(1, 2, 3),
       y1 = catchEst + catchSD,
       code = 2,
       angle = 90,
       length = 0.1)  # Specify the length for the hat on the error bar

# X and Y axis labels
mtext(text = 'Month',   # What should the label be
      side = 1,         # Which side of the plot (1 for bottom)
      line = 3,         # How far away from the axis should the text go
      cex = 1.5)        # How large should the text be

mtext(text = 'Catch (MT)',
      side = 2, 
      line = 3,
      cex = 1.5)

