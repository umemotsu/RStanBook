data {
  int N_1;
  int N_2;
  real Y_1[N_1];
  real Y_2[N_2];
}

parameters {
  real mu_1;
  real mu_2;
  real<lower=0> sigma;
}

model {
  for (n in 1:N_1) {
    Y_1[n] ~ normal(mu_1, sigma);
  }

  for (n in 1:N_2) {
    Y_2[n] ~ normal(mu_2, sigma);
  }
}
