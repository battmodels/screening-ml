function Cmat = constructC(lattice, coeffs )
%construcC Function to construct the C matrix from the minimal # of
%coefficients

if strcmp(lattice,'cubic')
    C1 = [coeffs(1), coeffs(2), coeffs(2), 0, 0, 0;...
        0, coeffs(1), coeffs(2), 0, 0, 0;...
        0, 0,coeffs(1), 0, 0, 0;...
        0, 0, 0, coeffs(3), 0, 0;...
        0, 0, 0, 0, coeffs(3), 0;...
        0, 0, 0, 0, 0, coeffs(3)];...
elseif strcmp(lattice,'hexagonal')
    C1 = [coeffs(1), coeffs(2), coeffs(3), 0, 0, 0;...
        0, coeffs(1), coeffs(3), 0, 0, 0;...
        0, 0, coeffs(4), 0, 0, 0;...
        0, 0, 0, coeffs(5), 0, 0;...
        0, 0, 0, 0, coeffs(5), 0;...
        0, 0, 0, 0, 0, (coeffs(1)-coeffs(2))/2];...
elseif strcmp(lattice,'monoclinic')
    C1 = [coeffs(1), coeffs(2), coeffs(3), 0, coeffs(4), 0;...
        0, coeffs(5), coeffs(6), 0, coeffs(7), 0;...
        0, 0, coeffs(8), 0, coeffs(9), 0;...
        0, 0, 0, coeffs(10), 0, coeffs(11);...
        0, 0, 0, 0, coeffs(12), 0;...
        0, 0, 0, 0, 0, coeffs(13)];...
elseif strcmp(lattice,'orthorhombic')
    C1 = [coeffs(1), coeffs(2), coeffs(3), 0, 0, 0;...
        0, coeffs(4), coeffs(5), 0, 0, 0;...
        0, 0, coeffs(6), 0, 0, 0;...
        0, 0, 0, coeffs(7), 0, 0;...
        0, 0, 0, 0, coeffs(8), 0;...
        0, 0, 0, 0, 0, coeffs(9)];...

elseif strcmp(lattice,'tetragonal-2')
    C1 = [coeffs(1), coeffs(2), coeffs(3), 0, 0, 0;...
        0, coeffs(1), coeffs(3), 0, 0, 0;...
        0, 0, coeffs(4), 0, 0, 0;...
        0, 0, 0, coeffs(5), 0, 0;...
        0, 0, 0, 0, coeffs(5), 0;...
        0, 0, 0, 0, 0, coeffs(6)];...

elseif strcmp(lattice,'trigonal-2')
    C1 = [coeffs(1), coeffs(2), coeffs(3), coeffs(6), 0, 0;...
        0, coeffs(1), coeffs(3), -coeffs(6), 0, 0;...
        0, 0, coeffs(4), 0, 0, 0;...
        0, 0, 0, coeffs(5), 0, 0;...
        0, 0, 0, 0, coeffs(5), coeffs(6);...
        0, 0, 0, 0, 0, (coeffs(1)-coeffs(2))/2];...

elseif strcmp(lattice,'triclinic')
    C1 = [coeffs(1), coeffs(2), coeffs(3), coeffs(4), coeffs(5), coeffs(6);...
        0, coeffs(7), coeffs(8), coeffs(9), coeffs(10), coeffs(11);...
        0, 0, coeffs(12), coeffs(13), coeffs(14), coeffs(15);...
        0, 0, 0, coeffs(16), coeffs(17), coeffs(18);...
        0, 0, 0, 0, coeffs(19), coeffs(20);...
        0, 0, 0, 0, 0, coeffs(21)];...
else
    error('Cannot find crystal class');
end

[n,~] = size(C1);
Cmat = C1' + C1;
Cmat(1:n+1:end) = diag(C1);

if Cmat~=Cmat'
    error('The C matrix is not symmetric');
end


end

