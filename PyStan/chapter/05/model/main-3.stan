data {
  int N;
  int<lower=0, upper=1> A[N];
  real<lower=0, upper=1> S[N];
  real<lower=0, upper=1> Y[N];
}

parameters {
  real b_1;
  real b_2;
  real b_3;
  real<lower=0> sigma;
}

transformed parameters {
  real mu[N];

  for (n in 1:N) {
    mu[n] = b_1 + b_2 * A[n] + b_3 * S[n];
  }
}

model {
  for (n in 1:N) {
    Y[n] ~ normal(mu[n], sigma);
  }
}

generated quantities {
  real Y_pred[N];

  for (n in 1:N) {
    Y_pred[n] = normal_rng(mu[n], sigma);
  }
}
