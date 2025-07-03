#include "secret_handshake.h"

namespace secret_handshake {
    using namespace std;
    std::vector<std::string> commands(unsigned int number) {
        std::vector<std::string> handshake {};
        if (number & (1U << 0)) handshake.emplace_back("wink");
        if (number & (1U << 1)) handshake.emplace_back("double blink");
        if (number & (1U << 2)) handshake.emplace_back("close your eyes");
        if (number & (1U << 3)) handshake.emplace_back("jump");
        if (number & (1U << 4)) std::reverse(handshake.begin(), handshake.end());
        return handshake;  
    }
}
