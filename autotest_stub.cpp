#include <iostream>

extern "C" void _ZN3mcu15AutoTestHandler14phoneConnectedEi(int x) {
    std::cout << "[stub] phoneConnected(" << x << ") called\n";
}

// Stub for static global variable QCoreApplication::self
extern void* _ZN16QCoreApplication4selfE;
void* _ZN16QCoreApplication4selfE = nullptr;

extern "C" void _ZN3mcu15AutoTestHandler14setMedisSourceEiii(int, int, int) {
    std::cout << "[stub] setMedisSource(int, int, int) called\n";
}

