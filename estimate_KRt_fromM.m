function [K,R,t] = estimate_KRt_fromM(M)
    A = M(1:3,1:3);
    b = M(:,4);
    lambda = 0;
    %% Calculating parameters in K
    C = A*A';
    %% Calculating lambda (absolute value)
    lambda = 1/sqrt(C(3,3));
    %% clculating the parameters
    xc = (lambda^2)*C(1,3);
    yc = (lambda^2)*C(2,3);
    fy = sqrt((lambda^2)*C(2,2)-yc^2);
    alpha = ((lambda^2)*C(1,2)-xc*yc)/fy;
    fx = sqrt((lambda^2)*C(1,1)-(alpha^2)-xc^2);
    K = [fx,alpha,xc;0,fy,yc;0,0,1];
    %% Calculating Matrix R
    R = lambda*(K\A);
    %% Checking if det(R) = 1
    detR = det(R);
    if ~(abs(detR - 1) < 0.001)
        R = -R;
    end
    %% Calculating t
    t = lambda*(K\b);
end