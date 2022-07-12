# Elegant Graphics for Data Analysis
Here I write my notes and express any creative thoughts on visualization as I go through Hadley Wickham's <i>Elegant Graphics for Data Analysis, 2nd Ed.</i> book detailing the R's ```ggplot2``` package.

## 2. Getting Started with ggplot2
### 2.2. Fuel Economy Data
#### 2.2.1. Exercises
4. - Some rows in the data set are similar (same values across all columns, i.e ```nrow(mpg) != nrow(unique(mpg))```). So it may be necessary to run ```unique``` before any operations.
   - After removing the 2wd, 4wd, awd, and quattro drive train specifications from the model name, the number of models per manufacturer stays the same. The number of variations in a model also stays the same except for a4 and a4 quattro models that become the same -- decreasing the total number of models by 1. This inertia is due to the fact that the models have a lot of variations in other parameters that make up for droping drive train. For instance, once all the parameters (variations) are ignored, manufacturers like Toyota and Dodge drop from having 34 and 31 unique models to 6 and 4, respectively. In this case, the respective ratios 34:6 and 31:4 for Toyota and Dodge could be a measure of the amount of variations per model the two manufacturers have introduced from 1999 to 2008.

### 2.3. Key Components
### 2.3.1. Exercises
2. Setting ```stat = identity``` on ```geom_bar``` helps customize the y-axis value, which is by default the count or frequency of what's on the x-axis.