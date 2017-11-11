function M = estimateCameraProjectionMatrix(imPoints2D,objectPoints3D)
    %% Calculating P matrix
    dim = size(imPoints2D);
    P = [-1*objectPoints3D,-ones(dim(1),1),zeros(dim(1),4),imPoints2D(:,1).*objectPoints3D;...
        zeros(dim(1),4),-1*objectPoints3D,-ones(dim(1),1),imPoints2D(:,2).*objectPoints3D]
    %% Calculating the r matrix
    r = -1*[imPoints2D(:,1);imPoints2D(:,2)];
    %% Calculating the q matrix
    PTP = P'*P;
    iPTPPT = PTP\P';
    q = iPTPPT*r;
    %% Calculating the M matrix
    M = [q(1:4)';q(5:8)';q(9:11)',1];
end