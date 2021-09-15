library(dslabs)
library(dplyr)
library(ggplot2)
library(ggrepel)
library(ggthemes)

args(ggplot)
data("murders")
# plotting of graph and various layers

p <- murders %>% mutate(rate = total/population * 10000) %>%ggplot(aes(population,total, label = abb, col = region))  + geom_point(size = 3)+ geom_abline(intercept = log10(r), lty = 2) + geom_text_repel() + xlab("Population in million (US)")+ylab("Total numbers of murdera(log10)") + ggtitle("US Gun Murders in US 2010")+scale_x_log10() + scale_y_log10() 

#line intercept

r <- murders %>% summarise(avg_rate = sum(total)/sum(population) )%>%.$avg_rate
print(r)

p + scale_color_discrete("Region")+ theme_economist()

