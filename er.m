k = 12; %2^k is the number of modes


B = logical(repmat([1 0 0 1; 0 0 0 0; 0 0 0 0; 1 0 0 1],2^(k-1),2^(k-1)));
cov = covarianceMatrix(2^k);
for n = 0:k-1
    clear U;
    U = quantumCircuit(2^(k-n), ~n);
    covOut = U * cov * U';

    sprintf('Scale: %d\n', n+1)
    covOut(2:3,2:3)

    cov = reshape(covOut(B),2^(k-n),2^(k-n));
    B = B(1:2^(k-n),1:2^(k-n));
end
