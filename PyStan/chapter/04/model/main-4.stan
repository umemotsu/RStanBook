data {
  int N;
  real x[N];
  real y[N];

  int N_new;
  real x_new[N_new];
}

parameters {
  real a;
  real b;
  real<lower=0> sigma;
}

transformed parameters {
  real y_base[N];

  for (n in 1:N) {
    y_base[n] = a + b * x[n];
  }
}

model {
  for (n in 1:N) {
    y[n] ~ normal(y_base[n], sigma);
  }
}

generated quantities {
  real y_base_new[N_new];
  real y_new[N_new];

  for (n in 1:N_new) {
    y_base_new[n] = a + b * x_new[n];
    y_new[n] = normal_rng(y_base_new[n], sigma);
  }
}
