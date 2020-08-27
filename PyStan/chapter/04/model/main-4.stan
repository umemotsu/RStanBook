data {
  int N;
  real X[N];
  real Y[N];

  int N_new;
  real X_new[N_new];
}

parameters {
  real a;
  real b;
  real<lower=0> sigma;
}

transformed parameters {
  real Y_base[N];

  for (n in 1:N) {
    Y_base[n] = a + b * X[n];
  }
}

model {
  for (n in 1:N) {
    Y[n] ~ normal(Y_base[n], sigma);
  }
}

generated quantities {
  real Y_base_new[N_new];
  real Y_new[N_new];

  for (n in 1:N_new) {
    Y_base_new[n] = a + b * X_new[n];
    Y_new[n] = normal_rng(Y_base_new[n], sigma);
  }
}
