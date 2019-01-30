

# Exercise instructions

## Premise

You have some landings data for the midwater trawl Atlantic Herring fishery from May, June and July as well as estimated standard deviations associated with each:

| Month | Landings | Standard Deviation |
| ----- | -------- | ------------------ |
|  May  | 43.09    | 6.97               |
|  June | 54.51    | 7.51               |
|  July | 45.70    | 5.29               |

Your task is to create a barplot in R that shows the estimated landings as the main bars and also includes the standard deviation for each month as an error bar on top. We want to make something that looks like this:

![Final Figure](/images/finalProduct.jpeg)

The first thing that pops to mind may be to use R's barplot() function. We could certainly do that but it would be too easy! Instead let's try to create a barplot using some of the concepts we just learned.

The assignment is divided into four sections; each section builds on the last. Given that some or much of this material is probably new for some people don't feel like you have to make it all the way to the end of the assignment. The purpose is simply to reinforce some of the concepts that we just discussed.

Before we begin let's add the data from the table above into R by creating two vecors -- one for the estimated catch (```catchEst```) and one for the standard deviations (```catchSD```). You can copy the code below right into your R script.
```
catchEst <- c(May = 43.09,
              June = 54.51,
              July = 45.70)

catchSD <- c(May = 6.97,
             June = 7.51,
             July = 5.29)
```

There are four parts in this exercise. Feel free either to (1) build up and keep modifying a single R script; or (2) when you are done with each part create a new script for the next part (you can do some copy/pasting to save a little time).

## Part 1: Create a basic barplot using rectangles

Our first goal is to create an empty plot that we can add to. But in order to do that we need to be able to tell R what the dimensions of our plotting region should be. Often when we create a figure (e.g., ```plot(x,y)```) R does this automatically by calculating the ranges of the variables ```x``` and ```y```. In this case however we will not be feeding R any variables at all.  Thus we will directly specify ranges for the x and y dimensions. We are creating barplots so the y axis should start at zero and go to the top of the tallest error bar. We will be plotting the x axis at locations 1, 2 and 3 so we can simply make the x axis range from 0 to 4. Copy the following code into R to get the appropriate ranges for your plot.
```
yrg <- c(0, max(catchEst + catchSD)) # y range will be 0 and the absolute max
xrg <- range(0:4)                    # run the x axis range from 0 to 4
```
Now we can create an empty plot which we will then add bars to. We will use the x and y ranges we just specified.
```
plot(x = NA,       # NA means that nothing will be plotted
     xlim = xrg,   # specify the x axis plotting limits
     ylim = yrg)   # specify the y axis plotting limits
```
This gives us an empty plot:

![emptyPlot](/images/emptyPlot.jpeg)

Next let's add the first error bar using the ```rect()``` function we learned about earlier. We can specify whatever width we want -- let's go with 0.4. Since the first bar will be centered around 1.0 we will make the x range extend from 0.8 to 1.2.
```
# Plot the three bars using the rect() function
rect(xleft = 0.8,        # minimum in the x direction
     ybottom = 0,        # minimum in the y direction
     xright = 1.2,       # maximum in the x direction
     ytop = catchEst[1]) # maximum in the y direction will be the estimated
                         # value for catch in May
```

![oneBar](/images/oneBar.jpeg)

Now add the other two error bars to the figure. For each of the next two calls to ```rect()``` you will have to change:
1. the **xleft** and **xright** values so that they are centered on 2.0 and 3.0; and
2. **ytop** so that it reflects the correct index (i.e., the **[ ]**) of ```catchEst``` (it will be 2 and then 3)

Once you add the other two rectangles you will have a figure that looks like this

![oneBar](/images/threeBars.jpeg)

Way to go you have completed the first part of the exercise! Now let's try and refine this basic plot to make it look a little nicer...


## Part 2: Practice using vectors and simple modifications

In the last section we made the three bars using three separate calls to ```rect()```. The primary goal of Part 2 is to demonstrate that instead of three separate calls to ```rect()``` we can just make a single call to the function and give it vectors instead of single values. Numerous R functions work this way so it is an important concept to understand. We will also rotate the y axis labels and make the bars look a little nicer.

The first step in Part 2 is a simple modification. The **las** argument to ```plot()``` governs the orientation of the tick mark labels. In the ```plot()``` function, add an argument specifying **las=1** and you will get labels that are easier to read.

Recall that in Part 1 we made three separate calls to ```rect()```. This time we will create all three bars using one call.  All we have to do is combine each of the arguments from the three separate calls into vectors that we feed each of the arguments to ```rect()```. Below **xleft** is filled in; you can do the rest by replacing the **??** below!
In addition we want to make these bars look a little nicer. Let's change the color to gray by adding an extra argument to the ```rect()``` function that specifies **col = 'gray'**.
```
# Plot the three bars using the rect() function
rect(xleft = c(0.8, 1.8, 2.8)
     ybottom = ??,
     xright = ??,
     ytop = ??,
     col = 'gray')
```
Successful completion of Part 2 yields a plot that looks like

![part2Complete](/images/part2Complete.jpeg)

## Part 3: Adding the error bars

Just like in our discussion earlier we will use the ```arrows()``` function to create error bars for our barplot. This function essentially draws a line segment and puts an arrow head on the end (our arrow head will be flat though so not very arrow-like). Since our "arrows" will be vertical the starting and ending x locations (i.e., **x0** and **x1**) will be the same -- 1.0, 2.0 and 3.0. In fact, given this we could even exclude an argument for **x1** altogether but sometimes it is a good idea to leave things in for clarity. Copy the code below into your script. The x values as well as arguments for the arrow type and the angle are all included so you just need to fill in **y0** and **y1**. Keep in mind that the "arrow" will start at the top of the bar (i.e., at the landings values) and finish at the landings values + the standard deviations.
```
# The arrows() function here will display the sd associated with each of
# the landings values
arrows(x0 = c(1, 2, 3),          # starting x location for each arrow
       y0 = ??,            # starting y location for each arrow
       x1 = c(1, 2, 3),          # ending x location for each arrow
       y1 = ??,  # ending y location for each arrow
       code = 2,                 # code=2 specifies arrow head on end
       angle = 90)               # arrow head angle: 90 for flat
```
Successful completion of Part 2 yields a plot that looks like

![part3Complete](/images/part3Complete.jpeg)

## Part 4: Clean up

As you can see we have come a long way and the structure of the plot is there! All that remains is to make some minor modifications so that the plot looks a little more professional. We will
1. Supress plotting of the x axis and create a more informative one using the ```axis()``` function;
2. Supress the x and y axis labels in ```plot()``` and make better ones using ```mtext()```;
3. Change the style of the y axis so that it starts at exactly zero and we remove the empty space below the bars; and
4. Make the hats on the error bars a little smaller

The first thing we have to discuss is changing the style of the y axis. In order to remove the white space below the bars we want to tell ```plot()``` to start *exactly* at 0. As a consequence, this means that the maximum value for our y axis will end at *exactly* the value we specify. Ending exactly at the maximum is not ideal because the top of our tallest error bar will overlap with the top of the plotting region. We can get around this by adding a bit to the maximum when we specify ```yrg```. In your code, replace what you had already for ```yrg``` with
```
yrg <- c(0, max( (catchEst + catchSD) * 1.04 ))
```
This will add an additional 4% on to the maximum value in the plot. Now we are ready to make some additional modifications. In your call to ```plot()```:
1. Supress plotting both the x and y axis labels by providing an empty value for the arguments **xlab** and **ylab** (e.g., **xlab = ' '**) ;
2. Supress plotting the x axis using **xaxt = 'n'**; and
3. Tell R that you want the values you specify for the y range (i.e., in **ylim**) to be treated as the *exact* minimum and maximum for the plot using the argument **yaxs = 'i'**.

If you run ```plot()``` with these arguments in place you should now have something that looks like

![part4Initial](/images/part4Initial.jpeg)

Note that the y axis now starts exactly at zero.

Next we want to create an x axis for the plot that is nicely labeled. We will specify **side = 1** to indicate that we want the axis to be at the bottom of the plot. In addition we will give locations and labels for each of the tick marks.
```
axis(side = 1,         # which side do you want the axis on (1 for bottom)
     at = c(1, 2, 3),  # where do you want the ticks and labels to be
     labels = c('May', 'Jun', 'Jul'))  # text for the labels
```
![part4Axis](/images/part4Axis.jpeg)

Now we are ready to add the rectangles (```rect()```) and error bars (```arrows()```). The only difference from our previous code is that we want to add an additional argument to the ```arrows()``` function -- **length** -- which controls the length of the arrow head. In your code set **length = 0.1**.

![part4BarsArrows](/images/part4BarsArrows.jpeg)

Our final task is to specify axis labels. For this we will use the function ```mtext()```. We need to make labels for the x (Month) and y (Landings) axes.  Add a label for each axis using either one or two calls to ```mtext()``` and using the code prompts below. If you need more information you can look at the help file by typing ```?mtext``` into the R console.
```
mtext(text = ??,     # What should the label be
      side = ??,     # Which side of the plot
      line = ??,     # How far away from the axis should the text go
      cex = ??)      # How large should the text be
```

After completing all these steps your final plot should look like this:

![part4Final](/images/part4Final.jpeg)

Way to go you are done! Feel free to contact me if you have any questions.
