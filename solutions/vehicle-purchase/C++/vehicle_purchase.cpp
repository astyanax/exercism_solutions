#include "vehicle_purchase.h"

#include <cmath>

namespace vehicle_purchase {

    // needs_license determines whether a license is needed to drive a type of vehicle. Only "car" and "truck" require a license.
    bool needs_license(std::string kind){
        if (kind != "bike" && kind != "stroller" && kind != "e-scooter")
            return true;
        return false;
    }

    // choose_vehicle recommends a vehicle for selection. It always recommends the vehicle that comes first in lexicographical order.
    std::string choose_vehicle(std::string option1, std::string option2) {
        std::string choice = option2;
        if (option1 <= option2)
            choice = option1;
        return choice + " is clearly the better choice.";
    }

    // calculate_resell_price calculates how much a vehicle can resell for at a certain age.
    double calculate_resell_price(double original_price, double age) {
        float rate = 1.0f;
        if (age <= 3)
            rate = 0.8f;
        else if (age < 10)
            rate = 0.7f;
        else
            rate = 0.5f;
        return round(original_price * rate);
    }

}