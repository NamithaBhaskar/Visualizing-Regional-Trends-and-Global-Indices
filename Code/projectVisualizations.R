library("ggplot2")
library("readxl")
library("dplyr")

countries <- read_excel('/Users/namithabhaskar/Downloads/country_information(1).xlsx')

summary(countries)

# Define country lists for each category
developed <- c("Australia", "Austria", "Belgium", "Canada", "Denmark", "Finland", 
               "France", "Germany", "Iceland", "Ireland", "Israel", "Italy", 
               "Japan", "Netherlands", "New Zealand", "Norway", "Singapore", 
               "South Korea", "Sweden", "Switzerland", "UK", "United States")

developing <- c("Argentina", "Brazil", "China", "India", "Indonesia", "Mexico", 
                "Russia", "South Africa", "Turkey", "Malaysia", "Thailand", 
                "Philippines", "Vietnam", "Colombia", "Peru", "Chile", "Egypt", 
                "Iran", "Jordan", "Pakistan", "Saudi Arabia", "Sri Lanka", 
                "Ukraine", "Uzbekistan")

least_developed <- c("Afghanistan", "Burkina Faso", "Burundi", "Congo", 
                     "Ethiopia", "Gambia", "Guinea", "Haiti", "Liberia", 
                     "Madagascar", "Malawi", "Mali", "Nepal", "Niger", 
                     "Rwanda", "Senegal", "Sudan", "Tanzania", "Uganda", 
                     "Yemen", "Zimbabwe")

# Add a development status column
countries <- countries %>%
  mutate(Development_Status = case_when(
    country %in% developed ~ "Developed",
    country %in% developing ~ "Developing",
    country %in% least_developed ~ "Least Developed",
    TRUE ~ "Other"
  ))

# View the updated dataset
print(countries)

ggplot(countries, aes(x = effective_coverage_of_health_services_index, fill = factor(Development_Status))) +
  geom_density(alpha = 0.5) +
  labs(title = "Coverage of Health Services by Development Status", 
       x = "Effective Coverage of Health Services Index", 
       fill = "Development Status") +
  theme_minimal()
