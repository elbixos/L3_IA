from scipy.special import softmax

out = [-12, 2, 3.5, 0.2]
outNorm = softmax(out)
print (outNorm)
