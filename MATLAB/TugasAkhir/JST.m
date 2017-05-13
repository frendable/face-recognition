classdef JST < handle
    properties
        % Default for input tansig = sigmoid bipolar range [-1 1]
        rMax = 0.9
        rMin = 0.1
        Max
        Min
        Net
        Matriks
        TingkatAkurasi
    end
    
    methods (Static = true)  
        function value = createTargetMatriks(conn)
            jumlahData = Mahasiswa.getJumlahData(conn);
            jumlahTotalWajah = Mahasiswa.getJumlahTotalWajah(conn);
            dataNPM = Mahasiswa.getDataNPM(conn);
            matriks = zeros(jumlahData, jumlahTotalWajah);
            step = 0;
            for i=1:jumlahData
                matriks(i, step+1:step+Mahasiswa.getTotalWajah(conn, dataNPM{i})) = 1;
                step = step + Mahasiswa.getTotalWajah(conn, dataNPM{i});
            end
            value = matriks;
        end
    end
    
    methods (Access = private)
        function value = transformValueMatriks(obj, matriks)
            value = (((obj.rMax-obj.rMin) * (matriks - obj.Min)) / (obj.Max - obj.Min)) + obj.rMin;
        end
    end
    
    methods
        
        function obj = Create(obj, matriks, outputCount, epoch, goal, minGrad, learnRate, time)
            obj.Min = min(matriks(:));
            obj.Max = max(matriks(:));
            obj.Matriks = transformValueMatriks(obj, matriks);
            obj.Matriks = obj.Matriks';
            obj.Net = newff(minmax(obj.Matriks), [450, 500, outputCount], {'logsig', 'logsig', 'logsig'}, 'traingdx');
            %obj.Net = feedforwardnet([450, 500, outputCount],minmax(obj.Matriks));
      
            
            obj.Net.trainParam.epochs = epoch;
            obj.Net.trainParam.goal = goal;
            obj.Net.trainParam.min_grad = minGrad;
            obj.Net.trainParam.lr = learnRate;
            obj.Net.trainParam.time = time;
        end
        
        function obj = Load(obj)
            if (exist('net.mat', 'file') == 2)
                temp = load('net.mat');
                obj.Net = temp.obj.Net;
                obj.Matriks = temp.obj.Matriks;
                obj.rMax = temp.obj.rMax;
                obj.rMin = temp.obj.rMin;
                obj.Max = temp.obj.Max;
                obj.Min = temp.obj.Min;
            else
                errordlg('Gagal Load JST', 'Data Tidak Ada');
            end
        end
        
        function obj = Train(obj, target)
            if (~isempty(obj.Net))
                obj.Net = train(obj.Net, obj.Matriks, target);
                save('net.mat', 'obj', '-mat');
            else
                errordlg('Variabel net masih kosong !', 'Data');
            end
        end
        
        function value = CekKemiripan(obj, MatrikBobotUjiCoba, Label)
            if (~isempty(obj.Net))
                % Cari keluaran dari jaringan
                % Normalisasi / Transformasi matrik ke range [-1 1]
                %save('mbuc.mat', 'MatrikBobotUjiCoba', '-mat');
                %save('label.mat', 'Label', '-mat');
                MatrikBobotUjiCoba = transformValueMatriks(obj, MatrikBobotUjiCoba);
                MatrikBobotUjiCoba = MatrikBobotUjiCoba';
                %save('mbuc.mat', 'MatrikBobotUjiCoba', '-mat');
                try
                    JST = sim(obj.Net, MatrikBobotUjiCoba);
                catch exception
                    errordlg('JST belum ditraining', 'Data');
                    throw(exception);
                end
                    
                %-------Cek Kemiripan-------------
                [MaxJST, index] = max(JST);
                %Tampilkan Tingkat Akurasi
                %disp(MaxJST);
                obj.TingkatAkurasi = MaxJST;
                if (MaxJST > 0.7)
                    % Pakai kurung kurawal pada index label karena bertipe
                    % cell untuk variable Label
                    value = Label{index,:};
                else
                    value = 'wrong';
                end
            else
                errordlg('Variabel net masih kosong !', 'Data');
            end 
        end
        
        % Getter and setter region
        function value = getNet(obj)
            if (~isempty(obj.Net))
                value = obj.Net;
            else
                errordlg('Variabel net masih kosong !', 'Data');
            end
        end
        
        function value = getTingkatAkurasi(obj)
            value = obj.TingkatAkurasi;
        end
        
        %function obj = setrMax(obj, max)
        %    obj.rMax = max;
        %end
        
        %function obj = setrMin(obj, min)
        %    obj.rMin = min;
        %end
        
        %function value = getrMax(obj)
        %    value = obj.rMax;
        %end
        
        %function value = getrMin(obj)
        %    value = obj.rMin;
        %end
        
        %function value = getMax(obj)
        %    value = obj.Max;
        %end
        % End getter and setter region
    end
end

