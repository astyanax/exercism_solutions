// Package weather provides weather forecasting related functionality.
package weather

// CurrentCondition contains the current weather conditions.
var CurrentCondition string

// CurrentLocation contains the current location.
var CurrentLocation string

// Forecast returns a string describing the weather conditions for the current location.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
