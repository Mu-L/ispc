#include "../test_static.isph"
// rule: skip on cpu=tgllp
bool ok(double x, double ref) { return (abs(x - ref) < 1d-5) || abs((x-ref)/ref) < 1d-4; }
task void f_du(uniform float RET[], uniform double aFOO[], uniform double b) {
  varying double arg = aFOO[programIndex] + b;
  varying double ref = sin((float)arg);
  varying double res = sin(arg);
  // native single precision sin on Xe is pretty imprecise
  RET[programIndex] = ok(res, ref) ? 0. : 1.;
}

task void result(uniform float RET[]) {
    RET[programIndex] = 0.0;
}
