data {
  int N;
  real x[N];
  real y[N];
}

parameters {
  real a;
  real b;
  real<lower=0> sigma;
}

model {
  for (n in 1:N) {
    y[n] ~ normal(a + b * x[n], sigma);
  }
}
