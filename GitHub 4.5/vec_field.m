function [] = vec_field(A,B,C,X,Y,Z)
%Plot a vector field of the system of ODEs for parameters A,B,C over set of points X,Y,Z

    U = ((B-C)/A)*(Y.*Z);   %X-Component of vec field
    V = ((C-A)/B)*(X.*Z);   %Y-Component of vec field
    W = ((A-B)/C)*(X.*Y);   %Z-Component of vec field
    
    quiver3(X,Y,Z,U,V,W,0.5,'Color',[0.9290 0.6940 0.1250],'LineWidth',1)
end