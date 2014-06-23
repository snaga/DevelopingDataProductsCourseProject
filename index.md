---
title       : Choosing variables for the Linear Regression Model
subtitle    : An Interactive Way to Select Variables
author      : Satoshi Nagayasu
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Motivation
1. Choosing variables for a linear regression model is not easy and has many combination.
2. To study the process, more interactive way is needed.
3. 

--- .class #id 
## How It Works
1. This app uses the "mtcars" data set in R.
2. "mpg" is the outcome variable.
3. Other 10 variables are possible predicters for the model.

```r
data(mtcars)
names(mtcars)
```

```
##  [1] "mpg"  "cyl"  "disp" "hp"   "drat" "wt"   "qsec" "vs"   "am"   "gear"
## [11] "carb"
```

4. You can observe a summary of the model and the residuals as you change.

--- .class #id 

## How To Use

1. There are 10 checkbox items to choose variables on the left panel.
2. When you change your choice, a summary of the regression model and a plot of the residuals would be shown on the right panel.
3. You can remove a variable which meets two conditions: the highest and >0.05 p-value.
4. You can continue Step.3 until reaching all variables have <0.05 p-values.

--- .class #id 

## Future Works

1. Modify the app to allow multiple data sets.

