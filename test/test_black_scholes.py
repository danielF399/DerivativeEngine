from option_pricing.black_scholes import black_scholes_call

def test_black_scholes_call():
    price = black_scholes_call(S=100, K=100, r=0.01, sigma=0.2, T=1.0)

    assert 7 < price < 15