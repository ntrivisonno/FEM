% explicar num de cond y agregar a tips_matlab.org

A = magic(3)

[a,b] = eig(A)

lambda_max = max(max(b))
lambda_min = min(min(b))

num_cond = lambda_max/lambda_min

