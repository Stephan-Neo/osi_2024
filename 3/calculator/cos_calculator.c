#include <stdio.h>
#include <math.h>

int main() {
    double x = 0.0;
    while(1) {
        printf("cos(%f) = %f\n", x, cos(x));
        x += 0.001;
    }
    return 0;
}