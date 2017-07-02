%only works for even N
function U = quantumCircuit(N, initial)
N = 2*N;
n = N/4;
s = [0 1; 1 0];
id = eye(2);

%phase switching
P = ones(1,N);
P(2:4:end) = -P(2:4:end);
P(3:4:end) = -P(3:4:end);
P = diag(P);

%initial layer and circuit middle swaps
swap = repmat({s},1,2*n);
Swap = blkdiag(swap{:});
Swap = [Swap(:,2:end) Swap(:,1)];
Swap = [Swap(2:end,:); Swap(1,:)];

%circuit initial swaps
s1 = blkdiag(s,id);
s1 = repmat({s1},1,n);
S1 = blkdiag(s1{:});
S1 = [S1(:,2:end) S1(:,1)];
S1 = [S1(2:end,:); S1(1,:)];

%-pi/6 rotational matrix
r2 = rotationMatrix(-pi/6);
r2 = blkdiag(r2,r2');
r2 = repmat({r2},1,n);
R2 = blkdiag(r2{:});

%pi/12 rotational matrix
r1 = rotationMatrix(-pi/12);
r1 = blkdiag(r1,r1');
r1 = repmat({r1},1,n);
R1 = blkdiag(r1{:});

%final rotation
r = rotationMatrix(-pi/4);
r = blkdiag(1,r,1);
r = repmat({r},1,n);
R = blkdiag(r{:});

if initial
    U = R' * R1' * Swap * R2' * S1 * Swap * P;
else
    U = R' * R1' * Swap * R2' * S1;
end
end