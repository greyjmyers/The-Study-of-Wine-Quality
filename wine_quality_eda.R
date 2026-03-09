red <- read_delim("~/Desktop/Stat Methods/winequality-red.csv", delim = ";")
summary(red)
red %>%
  ggplot() +
  geom_histogram(aes(x = `fixed acidity`), 
                 fill = "lightblue",color = "black")
red %>%
  ggplot() +
  geom_histogram(aes(x = `volatile acidity`), 
                 fill = "lightblue",color = "black")
red %>%
  ggplot() +
  geom_histogram(aes(x = `citric acid`), 
                 fill = "lightblue",color = "black")
red %>%
  ggplot() +
  geom_histogram(aes(x = `residual sugar`), 
                 fill = "lightblue",color = "black")
red %>%
  ggplot() +
  geom_histogram(aes(x = chlorides), 
                 fill = "lightblue",color = "black")
red %>%
  ggplot() +
  geom_histogram(aes(x = `free sulfur dioxide`), 
                 fill = "lightblue",color = "black")
red %>%
  ggplot() +
  geom_histogram(aes(x = `total sulfur dioxide`), 
                 fill = "lightblue",color = "black")

red %>%
  count(`total sulfur dioxide`) %>%
  arrange(desc(n))

red %>%
  ggplot() +
  geom_histogram(aes(x = density), 
                 fill = "lightblue",color = "black")
red %>%
  ggplot() +
  geom_histogram(aes(x = pH), 
                 fill = "lightblue",color = "black")
red %>%
  ggplot() +
  geom_histogram(aes(x = `volatile acidity`), 
                 fill = "lightblue",color = "black")
red %>%
  ggplot() +
  geom_histogram(aes(x = sulphates), 
                 fill = "lightblue",color = "black")
red %>%
  ggplot() +
  geom_histogram(aes(x = alcohol), 
                 fill = "lightblue",color = "black")
red %>%
  ggplot() +
  geom_histogram(aes(x = quality), 
                 fill = "lightblue",color = "black")

cor(red$alcohol, red$quality)
cor(red$`volatile acidity`, red$quality)

ggplot(red, aes(x = alcohol, y = `volatile acidity`, color = factor(quality))) +
  geom_point(alpha = 0.6) +
  labs(color = "Quality")


skewness(red$alcohol)
library(e1071)
