def main(M):
    set_phi = {4 * mu for mu in M if -63 < mu < 80}
    set_e = M.union(set_phi)
    set_i = {6 * phi - phi**2 for phi in set_phi if phi > -12}
    set_xi = {eps + eps for eps in set_e for eps in set_e if -60 < eps <= 37}
    ixxi = [(t, xi) for t in set_i for xi in set_xi]
    cardinality = len(ixxi)
    sum_product = sum(t * xi for (t, xi) in ixxi)
    v = cardinality - sum_product
    return v
