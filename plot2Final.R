

# Set the working directory (adjust as necessary!)
wd <- 'C:/Users/struesdell/OneDrive - Gulf of Maine Research Institute/GMRI/workshops/2018-12-7_DMR_R/'
setwd(wd)

# Read in the herring data as a data frame
hdat <- read.csv('Class_2.csv', header=TRUE)


#### First plot: 2-axis plot with data on different scales ####

# Establish the y and x plotting limits
yl <- range(hdat$SSB)
xl <- range(hdat$Year)

# Set the plotting margins
par(mar = c(5,6,2,4))

# Plot the SSB time series
plot(NA,             # Y ~ X (same as plot(X,y) )
     xlim = xl,      # x limits established earlier
     ylim = yl,      # y limits established earlier
     las = 1,        # ensure all labels are horizontal
     xlab = '',      # supress x axis label
     ylab = '')      # supress y axis label
     
# alternative to plot(NA and arguments xlim and ylim: include 
# plot(SSB ~ YEAR and use argument type = 'n'.
# This would also supress drawing the plot. The x and y limits would be
# correct because R would get them from SSB and YEAR. 
# We want to supress drawing because we will be plotting rectangles 
# and we want any points from the time series to end up on top
# of the rectangles (the order matters).

# Plot rectangles indicating important periods of herring management.
# Amendment 1 specified explicit use of biological reference points so
# create a before/after indicator for this.
# Note that if you want you could combine these calls to rect() into one 
# mtext function and give vectors for each of the arguments
rect(xleft = 1970,         # x value for left edge of rectangle
     ybottom = 940000,     # y value for bottom of rectangle
     xright = 1999,        # x value for right edge of rectangle
     ytop = 1000000,       # y value for top of rectangle
     col = 'red')          # rectangle color

rect(xleft = 1999,
     ybottom = 940000,
     xright = 2020,
     ytop = 10000000,
     col = 'green')

# When we created the boxes they colored over some of the lines for our
# axes. box() re-draws the box around the plot region so it looks better.
box()

# Now use lines to actually plot the Year vs SSB time series
lines(SSB ~ Year, 
      data = hdat,
      type = 'o',   # indicates we want to plot both points and lines together
      pch = 16)     # we want closed circles for the points

# Before we plot the temperature time series we have to tell R that we want
# it to re-evaluate the graphing parameters for the plot. We do that with
# par(new=TRUE)
par(new = TRUE)

# Now we can plot Temp vs Year and R will automatically draw this plot within
# the old graphing region because we specified par(new=TRUE).
plot(NOAA_Mean_SST ~ Year, 
     data = hdat,
     type = 'o',
     pch = 16,
     col = 'blue',   # Plot these points/lines in blue
     ann = FALSE,    # Supress labels (we will label the 2nd Y axis later)
     axes = FALSE)   # This plot should not be annotated -- otherwise R will
# draw new axes on top of the old axes. Below we will
# draw a new Y axis (the X axis will remain the same)

# Draw a new Y axis - this one for temperature - on the right side of the graph
axis(side = 4,  # side=4 tells R to draw the axis on the right side of the plot
     las = 1)   # las=1 indicates that all labels should be read horizontally

# Label the axes. Note that if you want you could combine this into one
# mtext function and give vectors for each of the arguments
mtext(text = 'Year', side = 1, line = 3, cex = 1.5)
mtext(text = 'SSB', side = 2, line = 4, cex = 1.5)
mtext(text = 'NOAA SST', side = 4, line = 2.5, cex = 1.5)

# Create a 2-column legend. Depending on your plot window size in RStudio
# the legend may not look great -- if it overlaps the rest of the plot try
# making the plotting window longer in the X direction.
legend(x = 'bottomright',        # in-plot location for the legend
       legend = c('preBRP', 'postBRP', 'SSB', 'SST'),  # legend text
       col = c('red', 'green', 'black', 'blue'),       # legend outline colors
       pt.bg = c('red', 'green', 'black', 'blue'),  # legend fill colors
       pch = c(22, 22, 16, 16),  # Point character types -- 22 = boxes and
       # 16 = filled circles
       lty = c(0, 0, 1, 1),      # line types -- 0 indicates no line
       ncol = 2,                 # number of columns to divide the legend into
       pt.cex = c(1.5, 1.5, 1, 1),  # expansion factor for legend points --
       # here the squares will be 1.5 times normal
       # size.
       bty = 'n')                   # Remove the box around the legend that is
# there by default



