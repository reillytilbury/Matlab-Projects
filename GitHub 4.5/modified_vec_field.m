function [] = modified_vec_field(A,B,C,k,X,Y,Z)
%Plot a vector field of the system of ODEs for parameters A,B,C over set of points X,Y,Z

    U = ((B-C)/A)*(Y.*Z)-k*X/A;   %X-Component of vec field
    V = ((C-A)/B)*(X.*Z)-k*Y/B;   %Y-Component of vec field
    W = ((A-B)/C)*(X.*Y)-k*Z/C;   %Z-Component of vec field
    
    quiver3(X,Y,Z,U,V,W,0.25,'Color',[0.9290 0.6940 0.1250],'LineWidth',1)
end