library("rwunderground")
library("dplyr")
library("httr")
library("countrycode")
library("ggplot2")
local_location <- set_location(zip_code = "07760")

Rumson_History <- almanac(location)

#   Set the API Key
set_api_key("949e2fee88ed30ad")

tide_data <- tide(location = local_location, key = get_api_key(), raw = FALSE, message = TRUE)

ggplot(tide_data, aes(date, height)) + geom_bar(stat="identity") + xlab("Date") + ylab("Daily Tide")

astronomy(location = local_location)

a <- forecast10day(location = local_location, key = get_api_key())


bye <- history_daily(location = local_location, date = "20161006")


t <- satellite(location, key = get_api_key(), raw = FALSE, message = TRUE)



library(weatherData)
library(ggplot2)
library(scales)
library(plyr)

w2014 <- getWeatherForYear("EWR", 2014)

w2015$shortdate <- strftime(w2015$Date, format = "%m-%d")

meanTemp <- ddply(.data = w2015, .variables = .(shortdate), .fun = summarize, mean_T = mean(Mean_TemperatureF))

meanTemp$shortdate <- as.Date(meanTemp$shortdate, format = "%m-%d")

ggplot(meanTemp, aes(shortdate, mean_T)) + geom_line() +
  scale_x_date(labels = date_format("%m/%d")) + xlab("") + ylab("Mean Temp deg F") +
  ggtitle("2013 Average Daily Temperature at Newark")
