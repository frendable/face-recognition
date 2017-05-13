classdef EuclideanDistance
    methods (Static = true)
        function value = Cek(MB, MatrikBobotUjiCoba, Height, Label)
            % Hitung jarak terdekat matrik bobot ujicoba dengan pelatihan
            % dengan algoritma euclidian distance
            % Nearest Neighbor Euclidian Distance Rule
            %save MB;
            %save MatrikBobotUjiCoba;
            %save Label;
            ED = ones(1, Height);
            for i=1: Height
                EucDist=(MB(i,:)-MatrikBobotUjiCoba(1,:));
                EucDist=sum(EucDist.^2);
                EucDist=EucDist^0.5;
                ED(1,i)=EucDist;
            end;
            %-------Cek Kemiripan-------------
            [MinEuclid, index] = min(ED);
            [MaxEuclid, ~] = max(ED);
            % Set nilai Treshold
            % Set nilai minimal deteksi 0.8*MaxEuclidianDistance
            if (MinEuclid<0.8e008)
                if(MinEuclid<0.8*MaxEuclid)
                %if(MinEuclid<0.35e008)
                    value = Label(index,:);
                else
                    value = 'wrong';
                end
            else
                value = 'wrong';
            end
        end
        
        
    end
end