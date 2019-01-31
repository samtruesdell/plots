

#### Plot of SST means and SDs ####


# Set the working directory (adjust as necessary!)
wd <- 'C:/Users/struesdell/OneDrive - Gulf of Maine Research Institute/GMRI/workshops/2018-12-7_DMR_R/'
setwd(wd)

# Read in the herring data as a data frame
hdat <- read.csv('Class_2.csv', header=TRUE)


# Subset the dataframe to make things a little easier -- focus on temperature
# data
temp <- hdat[,c('BBH_SST_Mean', 'BBH_SST_May_Nov', 
                'F_Com_Temp', 'NOAA_Mean_SST')]

# Calculate the means and sds for each temperature series using the
# apply() function
tempMean <- apply(temp, 2, mean)
tempSd <- apply(temp, 2, sd)

### ------------------------------------ ###
### We want to make a plot. However, in this case we are not going to feed
### R any data so the program needs to know what the x and y limits should
### be. x limits are easy -- we will have 4 x locations and we will plot them
### at c(1, 2, 3, 4). y limits will need to be calculated based on what we
### know about about the data we are going to plot.
### ------------------------------------ ###

# Generate range for y data. range() takes whatever inputs you give it and
# calculates the min and max values. In this case our maximum extreme will
# be the maximum of the means plus the sds and the minimum extreme will be
# the means minus the sds.
yl <- range(tempMean - tempSd, tempMean + tempSd)

# Set the desired margins
par(mar=c(4.5,4.5,3,2))

# Create an empty plot that we will then add to
plot(x = NA,          # NA will make an empty plot. In the previous example
                      # we included data so that R would determine our x and y
                      # limits for us. In this case we will say the data are
                      # NA and we will provide limits ourselves.
     xlim = c(0, 5),  # We have 4 data sets that we will plot at locations 1-4
     ylim = yl,       # y axis limits are specified above
     las = 1,         # ensure all labels are in the reading direction
     xlab = 'Temperature series',         # Label the x axis
     ylab = 'Temperature',                # Label the y axis
     main = 'Temperature Mean and SDs',   # Title for the plot
     xaxt = 'n')      # Do not create an x axis -- we will make one later that
                      # has better labels (i.e., not 1, 2, 3, ...)

# Create an x axis for the plot that is appropriately labeled
axis(side = 1,                    # side=1 indicates an x axis label
     at = c(1, 2, 3, 4),          # the locations of the ticks and labels
     labels = c('BBH1', 'BBH2',   # the label text
                'FCom', 'NOAA'))

# Add the mean temperature values as points
points(x = 1:4,          # x values are 1, 2, 3, 4
       y = tempMean,     # y values are the means of each temperature series
       pch = 16,         # the points will be filled circles
       col = c('red',    # Colors for each of the points
               'blue', 'darkgreen', 'orange'))

# We want to add range lines that indicate +/- sd from the mean. An easy way
# to do this is to use the arrows() function and specify that (1) you want an
# arrow head on each end; and (2) the arrow head should be at a 90 degree angle
# so it is horizontal. Here is an example of vectorized arguments. We could
# have created 4 different calls to the arrows() function, one for each arrow
# but instead we create one call and give each argument 4 values.
arrows(x0 = c(1, 2, 3, 4),         # starting x for each of the arrows
       y0 = c(tempMean - tempSd),  # starting y for each of the arrows
       x1 = c(1, 2, 3, 4),         # ending x (optional for vertical line)
       y1 = tempMean + tempSd,     # ending y
       code = 3,                   # specifies double-headed arrow
       angle = 90,                 # arrow angle is 90 deg so this will be a
                                   # vertical line
       col = c('red',              # colors for each of the arrows 
               'blue', 'darkgreen', 'orange'),
       lwd = 2)                    # Arrow line width




