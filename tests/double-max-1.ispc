#include "../test_static.isph"
// rule: skip on cpu=tgllp

task void f_f(uniform float RET[], uniform float aFOO[]) {
    double a = aFOO[programIndex];
    double b = -2. * a;
    RET[programIndex] = max(a,b);
}

task void result(uniform float RET[]) {
    RET[programIndex] = 1 * (1 + programIndex);
}
