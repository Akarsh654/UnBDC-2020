
library(ggplot2)
library(plotly)
library(data.table)
library(caTools)

# Read the data 
kenya <- fread("Kenya.csv",drop=c(1,4))

# Scatter Plot with regression line
pl <- ggplot(kenya,aes(x=total_flights,y=total_cases))
pl <- pl + geom_point() + geom_smooth(method = "lm", se = FALSE) + theme_bw() 
pl <- ggplotly(pl)
print(pl)

# Set a Seed
set.seed(101)

# Split up sample 
sample <- sample.split(kenya$total_flights,SplitRatio = 0.7)

# Training Data
train <- subset(kenya, sample==TRUE)
# Testing Data
test <- subset(kenya,sample==FALSE) 

# Train and build model
model <- lm(total_cases~.,data=train)
print(summary(model))

# Residual
res <- residuals(model)
res <- as.data.frame(res)

# Predictions
cases <- predict(model,test)










