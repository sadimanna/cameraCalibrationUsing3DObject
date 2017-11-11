function imPoints2D_estim = estimatepoints2D(objectPoints3D,K,R,t)
    dim = size(objectPoints3D);
    M = K*[R,t];
    objPoints3D = [objectPoints3D,ones(dim(1),1)]';
    points = M*objPoints3D;
    points2D = points(1:2,:)./points(3,:);
    imPoints2D_estim = points2D';
end