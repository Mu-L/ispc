#include "../test_static.isph"
// rule: skip on cpu=tgllp

int zero = 0;
void *gptr;

task void f_f(uniform float RET[], uniform float aFOO[]) {
    uniform double a[programCount];
    for (uniform int i = 0; i < programCount; ++i)
        a[i] = aFOO[i];
    
    int g = 0;
    double *ptr = (aFOO[0] == 1234) ? (double * varying)gptr : (a + programIndex);
    if (programIndex < 2) {
        #pragma ignore warning(perf)
        g = *ptr;
    }
    RET[programIndex] = g; 
}

task void result(uniform float RET[]) {
    RET[programIndex] = 0;
    RET[0] = 1;
    RET[1] = 2;
}
