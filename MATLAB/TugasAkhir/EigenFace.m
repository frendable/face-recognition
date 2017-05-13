classdef EigenFace < handle
    properties (GetAccess = public, SetAccess = private)
        EigenValue
        EigenVector
        MatrikProyeksi
        MatrikBobot        
        LabelPelatihanED
        LabelPelatihanJST
        TrainingMatric
        HeightTrainingMatric
        WidthTrainingMatric
        jst
        TingkatAkurasi
    end % properties
    
    methods (Access = private)
        function obj = getTrainingMatric(obj, conn)
            try
                curs = exec(conn, 'select * from matrikspelatihan');
                setdbprefs('DataReturnFormat','cellarray');
                curs = fetch(curs);
                total = rows(curs);
                curs = get(curs, 'Data');
                label = [];
                matriks = [];
                for i=1:total
                    tmpmatriks = load([curs{i,3} curs{i,2}]);
                    tmpmatriks = tmpmatriks.matriks;
                    [height, ~] = size(tmpmatriks);
                    lbl = repmat(curs{i,1}, height, 1);
                    matriks = [matriks; tmpmatriks];
                    label = [label; lbl];
                end
                % Buat matriks training dari matriks wajah gabungan
                obj.TrainingMatric = matriks;
                [obj.HeightTrainingMatric, obj.WidthTrainingMatric] = size(matriks); 
                % Buat label pelatihan ED sebagai acuan index untuk
                % pencocokan wajah metode Euclidean Distance
                obj.LabelPelatihanED = label;
                % Buat label pelatihan JST sebagai acuan index untuk
                % pencocokan wajah metode JST
                obj.LabelPelatihanJST = Mahasiswa.getDataNPM(conn);
            catch exception
                errordlg('Training Matriks gagal dibuat', 'Data');
                throw(exception);
            end
        end
        
        function obj = PCA(obj, conn)
            TM = double(obj.TrainingMatric);
            % 1.Cari Rata-Rata dan gandakan
            Miu = repmat(mean(TM), obj.HeightTrainingMatric, 1);
            % 2.Hitung Zeromean
            ZeroMean = TM - Miu;
            % 3.Hitung Kovarian
            CovMatric = (ZeroMean) * ZeroMean'/(obj.HeightTrainingMatric-1);
            % 4.Hitung eigenvalue dan eigenvector
            [obj.EigenVector, obj.EigenValue] = eig(CovMatric);
            % 5.Hitung Eigenvectors dan Eigenvalues dan urutkan secara decreasing
            obj.EigenValue = diag(obj.EigenValue);
            [~, index] = sort(-obj.EigenValue);
            obj.EigenValue = obj.EigenValue(index);
            obj.EigenVector = obj.EigenVector(:, index);
            % 6.Turunkan Data Set Baru
            FinalData = transpose(ZeroMean)*obj.EigenVector;
            % 7.Hitung matrik proyeksi dipakai sebagai faktor pengali
            % dengan matrik testing disebut juga eigenface
            obj.MatrikProyeksi=transpose(FinalData);
            % 8.Hitung matrik bobot digunakan pembanding pada saat klasifikasi;
            obj.MatrikBobot=TM*FinalData;
        end
    end
    
    methods
        function obj = EigenFace(conn)
            obj.getTrainingMatric(conn);
            obj.PCA(conn);
            obj.jst = JST;
            obj.jst.Load;
            
        end
        
        function value = CekWajah(obj, matric)
            % Eigcount adalah banyaknya eigenface yang dipakai
            %if (eigcount > obj.HeightTrainingMatric)
                eigcount = obj.HeightTrainingMatric;
                %eigcount = obj.HeightTrainingMatric/4;
            %end
            % Buat matrik bobot dan proyeksi baru yang telah direduksi
            % diambil baris untuk MP
            MP = obj.MatrikProyeksi(1:eigcount, :);
            %save('MP.mat', 'MP');
            % diambil kolom untuk MB
            MB = obj.MatrikBobot(:, 1:eigcount);
            
            % Ubah matrik ujicoba menjadi matriks 1x(wxh)
            xTestingMatric = ImageProcessing.Processing(matric);
            [height width] = size(xTestingMatric);
            xTestingMatric = double(reshape(xTestingMatric, 1, height*width));
            % Hitung matrik bobot ujicoba
            MatrikBobotUjiCoba = xTestingMatric * transpose(MP);
            
            % Cek kemiripan euclidean distance
            %value = EuclideanDistance.Cek(MB, MatrikBobotUjiCoba, obj.HeightTrainingMatric, obj.LabelPelatihanED); 
            % Cek kemiripan JST
            value = obj.jst.CekKemiripan(MatrikBobotUjiCoba, obj.LabelPelatihanJST);
            
            obj.TingkatAkurasi = obj.jst.getTingkatAkurasi;
        end

    end
end