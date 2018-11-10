syms a;
syms b;
syms c;
syms d;
syms e;
syms f;
syms t0;
syms t1;
syms t2;
syms delta;

dt = exp(1i * delta);

a_t0 = - e*t0 + dt*e*t1 + 1i*f*t0 + 1i*dt*f*t0;
b_t1 = - f*t1 - dt*f*t2 + 1i*e*t1 + 1i*dt*e*t2;
a_t1 = - f*t1 - dt*e*t2 + 1i*f*t1 + 1i*dt*f*t2;
b_t0 =   f*t0 - dt*f*t1 + 1i*e*t0 + 1i*dt*e*t1;

final = a_t0 * b_t1 + a_t1 * b_t0;
result = expand(final);
disp(result);