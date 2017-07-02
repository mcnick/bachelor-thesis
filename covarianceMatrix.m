%only works for even N
function Matr = covarianceMatrix(N)
Matr = zeros(N);
if mod(N,4) == 0
    k1 = 1:N/4-1;
    k2 = N/4+1:N/2-1;
    for i = 1:N
        for j = 1:N
            Matr(i,j) = sum(-cos(k1*abs(i-j)*2*pi/N));
            Matr(i,j) = Matr(i,j) + sum(cos(k2*abs(i-j)*2*pi/N));
            
            if mod(abs(i-j),2) == 1
                Matr(i,j) = Matr(i,j) - 1;
            end
            if mod(abs(i-j),4) == 0
                Matr(i,j) = Matr(i,j) - 1;
            end
            if mod(abs(i-j),4) == 2
                Matr(i,j) = Matr(i,j) + 1;
            end
        end
    end
else
    k1 = 1:(N-2)/4;
    k2 = (N-2)/4+1:N/2-1;
    for i = 1:N
        for j = 1:N
            Matr(i,j) = sum(-cos(k1*abs(i-j)*2*pi/N));
            Matr(i,j) = Matr(i,j) + sum(cos(k2*abs(i-j)*2*pi/N));
            
            if mod(abs(i-j),2) == 1
                Matr(i,j) = Matr(i,j) - 1;
            end
        end
    end
end
Matr = 2*Matr/N;
Matr = kron(Matr,eye(2));
end
