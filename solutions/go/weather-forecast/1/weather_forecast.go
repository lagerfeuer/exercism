// Package weather prints weather forecasts.
package weather

// CurrentCondition: current weather condition.
var CurrentCondition string
// CurrentLocation: current user location.
var CurrentLocation string

// Forecast: returns the current location and current weather condition.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
