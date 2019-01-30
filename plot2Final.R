

# Set the working directory (adjust as necessary!)
wd <- 'C:/Users/struesdell/OneDrive - Gulf of Maine Research Institute/GMRI/workshops/2018-12-7_DMR_R/'
setwd(wd)

# Read in the herring data as a data frame
hdat <- read.csv('Class_2.csv', header=TRUE)


#### First plot: 2-axis plot with data on different scales ####

# Set the plotting margins
par(mar = c(5,6,2,4))

# Plot the SSB time series
plot(SSB ~ Year,     # Y ~ X (same as plot(X,y) )
     data = hdat,    # Identify the data frame for SSB and Year
     las = 1,        # ensure all labels are horizontal
     xlab = '',      # supress x axis label
     ylab = '',      # supress y axis label
     type = 'n')     # supress the actual plotting. We want this because
#   we will plot be plotting rectangles and we want
#   any points from the time series to end up on top
#   of the rectangles.

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
# Draw a new Y axis - this on for temperature - on the right side of the graph
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



# Amendment 1
# (February 1999)
# ASMFC’s Amendment 1 to the Atlantic Herring Fishery Management Plan (FMP) was 
# developed to complement the NEFMC’s federal management plan; it was designed to minimize 
# regulatory differences in fisheries conducted i
# n state and federal waters. Amendment I 
# established management goals and objectives for the U.S. Atlantic herring resource that can only 
# be reached through the successful implementation of both the interstate and federal management 
# plans. The management sc
# heme relies on a total allowable catch (TAC) with effort control 
# measures to avoid overfishing. TACs are developed for specific management areas to reflect the 
# current state of knowledge concerning migratory behavior and mixing rates of the sub
# -
#   components 
# of Atlantic herring. 
# Amendment 1 defines overfishing and biological reference points based on an estimate of 
# maximum sustainable yield (MSY) for the entire stock complex. In order to maintain consistency 
# between Amendment 1 and NEFMC’s FMP, ASMFC’s 
# Atlantic Herring Section adopted the 
# same overfishing definition and biological reference points as in the federal plan, which were 
# created under guidelines stipulated in the revised Magnuson
# -
#   Stevens Fishery Conservation and 
# Management Act (MSA) prior to t
# he 2006 re
# -
#   authorization. Both FMPs provide a process for 
# setting annual specifications and contain institutional frameworks for developing and 
# implementing future management action involving the ASMFC, the New England and Mid
# -
#   Atlantic Councils, and (possi
#                           bly) Canada. The plans also include state and federal spawning 
# closures/restrictions and recommendations to prevent damage to herring spawning habitat and 
# egg beds. State effort controls include specific “days out” of the week to slow the fishery’s catch 
# r
# ates and extend the fishing season in Management Area 1A.
# 
