#include "triangle.h"
#include <vector>
#include <algorithm>

namespace triangle {
    flavor kind(double a, double b, double c) {
        std::vector<double> sides {a, b, c};
		std::sort(sides.begin(), sides.end());

        if (sides[0] <= 0)
			throw std::domain_error("All sides should have positive length");
		if (sides[0] + sides[1] < sides[2])
			throw std::domain_error("Illegal triange: Violates length inequality");
		if (sides[0] == sides[2])
			return flavor::equilateral;
		if (sides[0] == sides[1] || sides[1] == sides[2])
			return flavor::isosceles;
		return flavor::scalene;        
    }
}
