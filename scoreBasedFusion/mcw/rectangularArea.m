function RA=rectangularArea(V)
    % V=sim;
    genuine=[];
    imposter=[];
    for i=1:size(V)
        for j=1:size(V)
            if i==j
                genuine=[genuine;[V(i,j)]];
            else
                imposter=[imposter;[V(i,j)]];
            end
        end
    end
    mus=mean(genuine);
    mud=mean(imposter);
    vars=var(genuine);
    vard=var(imposter);
    di=abs(mus-mud)/sqrt((vars+vard)/2);
    [EER,OP,FAR,FRR,x]=EER_DET_conf(genuine,imposter,0.1,10000);
    zFAR=-1;
    zFRR=-1;
    for i=1:size(FAR,2)
        if FAR(1,i)==0
            zFAR=x(i);
            break;
        end
    end
    if zFAR==-1
        for i=1:size(FAR,2)
            if round(FAR(1,i))==0
                zFAR=x(i);
                break;
            end
        end
    end
    for i=1:size(FRR,2)
        if FRR(1,i)~=0
            zFRR=x(i-1);
            break;
        end
    end
    if zFRR==-1
        for i=1:size(FRR,2)
            if round(FRR(1,i))~=0
                zFRR=x(i-1);
                break;
            end
        end
    end
    RA=EER*(zFAR-zFRR);
end
