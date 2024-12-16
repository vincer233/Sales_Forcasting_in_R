install.packages('forecast')
library('forecast')
class(AirPassengers)
AirPassengers
my_colors <- rainbow(12)
boxplot(split(AirPassengers, cycle(AirPassengers)),
        xlab = "Month", ylab = "Number of Passengers",
        col = my_colors,  # Assign colors to each box
        border = "black",  # Set the border color
        main = "Monthly Air Passenger Counts by Month",
        names = month.abb,  # Use abbreviated month names as labels
        outline = FALSE)  # Remove outliers
plot(AirPassengers)
data<-ts(AirPassengers, frequency=12)
d<-decompose(data, "multiplicative")
plot(d)
model<-auto.arima(AirPassengers)
summary(model)
f<-forecast(model, level=c(95), h=10*12)
plot(f)
