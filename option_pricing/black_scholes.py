import numpy as np
from scipy.stats import norm

def black_scholes_call(S, K, r, sigma, T):
    """
    European Call option pricing(Black-Scholes)
    S: spot
    K: strike
    r: risk-free rate
    sigma: volatility
    T: time to maturity (in years)
    """
    if T <= 0 or sigma <= 0 or S <= 0 or K <= 0:
        raise ValueError("Inputs must be positive and T, sigma > 0.")

    d1 = (np.log(S / K) + (r + 0.5 * sigma**2) * T) / (sigma * np.sqrt(T))
    d2 = d1 - sigma * np.sqrt(T)
    call_price = S * norm.cdf(d1) - K * np.exp(-r * T) * norm.cdf(d2)
    return call_price