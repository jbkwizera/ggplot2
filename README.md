# Elegant Graphics for Data Analysis
Here I write my notes and express any creative thoughts on visualization as I go through Hadley Wickham's <i>Elegant Graphics for Data Analysis, 2nd Ed.</i> book detailing the R's ```ggplot2``` package.

## 2. Getting Started with ggplot2
### 2.2. Fuel Economy Data
#### 2.2.1. Exercises
4. - Some rows in the data set are similar (same values across all columns, i.e ```nrow(mpg) != nrow(unique(mpg))```). So it may be necessary to run ```unique``` before any operations.
   - After removing the 2wd, 4wd, awd, and quattro drive train specifications from the model name, the number of models per manufacturer stays the same. The number of variations in a model also stays the same except for a4 and a4 quattro models that become the same -- decreasing the total number of models by 1. This inertia is due to the fact that the models have a lot of variations in other parameters that make up for droping drive train. For instance, once all the parameters (variations) are ignored, manufacturers like Toyota and Dodge drop from having 34 and 31 unique models to 6 and 4, respectively. In this case, the respective ratios 34:6 and 31:4 for Toyota and Dodge could be a measure of the amount of variations per model the two manufacturers have introduced from 1999 to 2008.

### 2.3. Key Components
#### 2.3.1. Exercises
2. Setting ```stat = identity``` on ```geom_bar``` helps customize the y-axis value, which is by default the count or frequency of what's on the x-axis.

### 2.4. Aesthetic Attributes
#### 2.4.1. Exercises
3. - It should be expected that FWD have the best fuel efficiency, followed by the RWD, and lastly 4WD. Plotting side-by-side boxplots for each of the variables confirms the hypothesis, with FWD much better than other drives. We observe that at least 50% of all RWD have at least 15 mpg, whereas much less than 50% of all 4WD have 15 mpg. RWD are clearly better than both RWD and 4WD.
   - Since a small engine generally means high fuel efficiency (negative correlation between ```displ``` and ```cty```), and we can make a hypothesis on the relationship between a drive train and engine size based on the above observation. That is, FWD have the smallest engines whereas 4WD have the largest engines and RWD engines in the middle but closer to 4WD engines. However, while FWD have the smallest engines, doing the boxplots just as above shows that almost all of RWD have engine size ```displ``` bigger than 4.0 liters --which is about the median for 4WD. This is probably because more of the 4WD engines are turbocharged, which compensate for their small sizes, than the RWD engines.
   - We also find that SUVs, pickups and two seaters typically have a high displ and that they are all almost exclusively 4WD and RWD. On the other hand, an overwhelming majority of other classes are FWD, which a few 4WD and RWD. In summary, they are two clusters --almost exclusively RWD and 4WD pickups, SUVs and 2 seaters vs. majorily FWD and few 4WD compact, minivan, midsize, and subcompact.


## 3. Toolbox
### 3.5. Collective Geoms
#### 3.5.5. Exercises
1. Setting the ```group``` aesthetic helps apply aesthetics to individual sections of the data set in a clean manner. ```ggplot``` sees variables of ```integer``` class as continuous. So it doesn't interpret them as categorical and infer their groups, hence the need for ```group = cyl``` for the ```cyl``` variable to be seen as discrete (and allow us to draw boxplot for each of the group).
3. - Failure on not setting the ```group``` aesthetic results from implicit grouping being insufficient.
Each group created implicitly from ```factor(colour)``` is 1 point. Line segments which make up a ```geom_line``` are therefore not possible since the off-by-one principle underlying ```geom_line``` doesn't make much sense with just 1 observation. Setting ```aes(group = 1)``` instructs ```geom_line``` to assign all observations to one group, and draw just one line connecting the observations, with segments connecting the points in their order. Setting ```aes(group = 2)``` does the same thing --only the group is ```2 ~ c(2, 2, 2)``` now instead of ```1 ~ c(1, 1, 1).```
4. - There are three implicit groups corresponding to the three drive train categories. Therefore, we have 3 bars.
   - Each ```hwy``` group gets a bar. In total, there are ```mpg %>% group_by(drv, hwy) %>% count() %>% nrow()``` bars.
   - Compute in the same fashion as above. Should end up as ```nrow(mpg2)``` since ```group = id``` and ```id``` has no duplicate values.