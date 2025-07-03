#ifndef SPACE_AGE_H
#define SPACE_AGE_H

#include <cstdint>

namespace space_age {
	constexpr auto YEAR_IN_SECONDS = 60 * 60 * 24 * 365.25;
    constexpr double earth_mult    = YEAR_IN_SECONDS;
    constexpr double mercury_mult  = 0.2408467;
	constexpr double venus_mult    = 0.61519726;
	constexpr double mars_mult     = 1.8808158;
	constexpr double jupiter_mult  = 11.862615;
	constexpr double saturn_mult   = 29.447498;
	constexpr double uranus_mult   = 84.016846;
	constexpr double neptune_mult  = 164.79132;

	class space_age {
		private:
			uint_fast64_t age_in_seconds;

		public:
			space_age(uint_fast64_t age): age_in_seconds(age) {}

			uint_fast64_t seconds() const {
				return age_in_seconds;
			}

			double on_earth() const {
				return static_cast<double>(age_in_seconds) / earth_mult;
			}
			double on_mercury() const {
				return on_earth() / mercury_mult;
			}
			double on_venus() const {
				return on_earth() / venus_mult;
			}
			double on_mars() const {
				return on_earth() / mars_mult;
			}
			double on_jupiter() const {
				return on_earth() / jupiter_mult;
			}
			double on_saturn() const {
				return on_earth() / saturn_mult;
			}
			double on_uranus() const {
				return on_earth() / uranus_mult;
			}
			double on_neptune() const {
				return on_earth() / neptune_mult;
			}
	};
}

#endif