classdef Mahasiswa < handle
   properties (GetAccess = private, SetAccess = private)
      NPM       = '';
      Password  = '';
      Nama      = '';
      Alamat    = '';
      Telepon   = '';
      Email     = '';
   end % properties
   
   methods (Static = true)
       function value = getAllNPM(conn)
          try
              curs = exec(conn, 'select NPM from mahasiswa');
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              row = rows(curs);
              curs = get(curs, 'Data');
              value{1} = curs;
              value{2} = row;
              clear curs;
          catch exception
              errordlg('Data Gagal Diload', 'Data');
              throw(exception);
          end
       end
       
       function value = getDataNPM(conn)
          try
              curs = exec(conn, 'select NPM from mahasiswa');
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              curs = get(curs, 'Data');
              value = curs;
              clear curs;
          catch exception
              errordlg('Data Gagal Diload', 'Data');
              throw(exception);
          end
       end
       
       function value = getAllName(conn)
          try
              curs = exec(conn, 'select Nama from mahasiswa');
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              curs = get(curs, 'Data');
              value = curs;
              clear curs;
          catch exception
              errordlg('Data Gagal Diload', 'Data');
              throw(exception);
          end
       end
       
       function value = getAllKehadiran(conn)
          try
              curs = exec(conn, 'select kehadiran from kehadiran');
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              curs = get(curs, 'Data');
              value = curs;
              clear curs;
          catch exception
              errordlg('Data Gagal Diload', 'Data');
              throw(exception);
          end
       end
       
       function value = getKehadiran(conn, npm)
          try
              curs = exec(conn, ['select kehadiran from kehadiran where NPM=' '"' npm '"']);
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              curs = get(curs, 'Data');
              value = curs;
              clear curs;
          catch exception
              errordlg('Data Gagal Diload', 'Data');
              throw(exception);
          end
       end
       
       function updateKehadiran(conn, npm, kehadiran)
           try
              data = {npm, kehadiran}; 
              colnames = {'NPM', 'Kehadiran'};
              update(conn, 'kehadiran', colnames, data, ['where NPM=' '"' npm '"']);
           catch exception
              errordlg('Data Kehadiran Gagal Diupdate', 'Data');
              throw(exception);
           end
       end
       
       function resetKehadiran(conn, npm)
           try
              data = {npm, 0}; 
              colnames = {'NPM', 'Kehadiran'};
              update(conn, 'kehadiran', colnames, data, ['where NPM=' '"' npm '"']);
           catch exception
              errordlg('Data Kehadiran Gagal Diupdate', 'Data');
              throw(exception);
           end
       end
       
       function value = getAllData(conn)
          try
              curs = exec(conn, 'select * from mahasiswa');
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              curs = get(curs, 'Data');
              value = curs;
              clear curs;
          catch exception
              errordlg('Data Gagal Diload', 'Data');
              throw(exception);
          end
       end
       
       function value = getWajah(conn, npm)
          try
              curs = exec(conn, ['select FileName, Path from wajah where NPM=' '"' npm '"']);
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              curs = get(curs, 'Data');
              value = curs;
              clear curs;
          catch exception
              errordlg('Data Gagal Diload', 'Data');
              throw(exception);
          end
       end
       
       function value = getJumlahData(conn)
          try
              curs = exec(conn, 'select count(*) as count from mahasiswa');
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              curs = get(curs, 'Data');
              value = curs{1};
              clear curs;
          catch exception
              errordlg('Data Gagal Diload', 'Data');
              throw(exception);
          end
       end
       
       function value = getJumlahTotalWajah(conn)
          try
              curs = exec(conn, 'select count(*) as count from wajah');
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              curs = get(curs, 'Data');
              value = curs{1};
              clear curs;
          catch exception
              errordlg('Data Gagal Diload', 'Data');
              throw(exception);
          end
       end
       
       function value = getTotalWajah(conn, npm)
          try
              curs = exec(conn, ['select count(*) as count from wajah where NPM=' '"' npm '"']);
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              curs = get(curs, 'Data');
              value = curs{1};
              clear curs;
          catch exception
              errordlg('Data Gagal Diload', 'Data');
              throw(exception);
          end
       end
       
       function value = getCitraPelatihan(conn, npm)
          try
              curs = exec(conn, ['select FileName, Path from citraPelatihan where NPM=' '"' npm '"']);
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              curs = get(curs, 'Data');
              value = curs;
              clear curs;
          catch exception
              errordlg('Data Gagal Diload', 'Data');
              throw(exception);
          end
       end
       
       function value = getMatriksPelatihan(conn, npm)
          try
              curs = exec(conn, ['select FileName, Path from matriksPelatihan where NPM=' '"' npm '"']);
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              curs = get(curs, 'Data');
              curs = load([curs{1,2}, curs{1,1}]);
              value = curs.matriks;
              clear curs;
          catch exception
              errordlg('Data Gagal Diload', 'Data');
              throw(exception);
          end
       end    
      
       function value = isWajahExist(conn, path_name, file_name)
           curs = exec(conn, ['select count(*) as count from wajah where FileName=' '"' file_name '.bmp' '"']);
           setdbprefs('DataReturnFormat','cellarray');
           curs = fetch(curs);
           curs = get(curs, 'Data');
           value = curs{1};
       end
       
       
       
       function deleteData(conn, npm)
          try
              Mahasiswa.deleteWajah(conn, npm);
              Mahasiswa.deleteCitraPelatihan(conn, npm);
              Mahasiswa.deleteMatriksPelatihan(conn, npm);
              exec(conn, ['delete from mahasiswa where NPM=' '"' npm '"']);
              msgbox('Data Berhasil Dihapus', 'Data');
          catch exception
              errordlg('Data Gagal Dihapus', 'Data');
              throw(exception);
          end
       end
       
       function deleteWajah(conn, npm)
          try
              curs = exec(conn, ['select Path, FileName from wajah where NPM=' '"' npm '"']);
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              data = get(curs, 'Data');
              for i=1:rows(curs)
                  if (exist([data{i,1} data{i,2}], 'file') == 2)
                    delete([data{i,1} data{i,2}]);
                  end
              end
              clear data;
              clear curs;
          catch exception
              errordlg('Data Wajah Gagal Dihapus', 'Data');
              throw(exception);
          end
       end
       
       function deleteCitraPelatihan(conn, npm)
          try
              curs = exec(conn, ['select Path, FileName from citraPelatihan where NPM=' '"' npm '"']);
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              data = get(curs, 'Data');
              for i=1:rows(curs)
                  if (exist([data{i,1} data{i,2}], 'file') == 2)
                    delete([data{i,1} data{i,2}]);
                  end
              end
              clear data;
              clear curs;
          catch exception
              errordlg('Data Citra Pelatihan Gagal Dihapus', 'Data');
              throw(exception);
          end
       end
       
       function deleteMatriksPelatihan(conn, npm)
          try
              curs = exec(conn, ['select Path, FileName from matriksPelatihan where NPM=' '"' npm '"']);
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              data = get(curs, 'Data');
              if (exist([data{1,1} data{1,2}], 'file') == 2)
                delete([data{1,1} data{1,2}]);
              end
              clear data;
              clear curs;
          catch exception
              errordlg('Data Matriks Pelatihan Gagal Dihapus', 'Data');
              throw(exception);
          end
       end
       
       function deleteSatuWajah(conn, npm, filename)   
          try
              Mahasiswa.deleteSatuCitraPelatihan(conn, npm, filename(8:end));
              Mahasiswa.updateMatriksPelatihan(conn, npm);
              curs = exec(conn, ['select Path, FileName from wajah where NPM=' '"' npm '" and FileName= "' filename '"']);
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              data = get(curs, 'Data');
              if (exist([data{1,1} data{1,2}], 'file') == 2)
                delete([data{1,1} data{1,2}]);
              end
              exec(conn, ['delete from wajah where NPM=' '"' npm '" and FileName= "' filename '"']);
              clear data;
              clear curs;
              msgbox(['Data ' filename ' Berhasil Dihapus'], 'Data');
          catch exception
              errordlg('Data Wajah Gagal Dihapus', 'Data');
              throw(exception);
          end
       end
       
       function deleteSatuCitraPelatihan(conn, npm, filename)
           try
              curs = exec(conn, ['select Path, FileName from citrapelatihan where NPM=' '"' npm '" and FileName= "' filename '"']); 
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              data = get(curs, 'Data');
              if (exist([data{1,1} data{1,2}], 'file') == 2)
                delete([data{1,1} data{1,2}]);
              end
              exec(conn, ['delete from citrapelatihan where NPM=' '"' npm '" and FileName= "' filename '"']);
              clear data;
              clear curs;
           catch exception
              errordlg('Data Citra Pelatihan Gagal Dihapus', 'Data');
              throw(exception);
           end
       end
       
       function updateMatriksPelatihan(conn, npm)
           try
                % Buat matriks citra pelatihan baru
                % Make a connection database
                matriks = [];
                
                curs = exec(conn, ['select * from citrapelatihan where NPM=' '"' npm '"']);
                setdbprefs('DataReturnFormat','cellarray');
                curs = fetch(curs);
                total = rows(curs);
                curs = get(curs, 'Data');
                image = imread([curs{1,3} curs{1,2}]);
                [height width] = size(image);
                for i=1:total
                    image = imread([curs{i,3} curs{i,2}]);
                    image = reshape(image, 1, width*height);
                    matriks = [matriks; image];
                end
                curs = exec(conn, ['select * from matrikspelatihan where NPM=' '"' npm '"']);
                setdbprefs('DataReturnFormat','cellarray');
                curs = fetch(curs);
                curs = get(curs, 'Data');
                save([curs{1,3} curs{1,2}], 'matriks');
                clear curs;
                clear matriks;
                clear total;
                clear image;
           catch exception
               errordlg('Data Matriks Pelatihan Gagal Dihapus', 'Data');
               throw(exception);
           end
       end
       
   end
   
   
   % Methods normal region
   methods       
       function obj=load(obj, conn, npm)
          try
              curs = exec(conn, ['select * from mahasiswa where NPM=' '"' npm '"']);
              setdbprefs('DataReturnFormat','cellarray');
              curs = fetch(curs);
              curs = get(curs, 'Data');

              obj.NPM = curs{1,1};
              obj.Password = curs{1,2};
              obj.Nama = curs{1,3};
              obj.Alamat = curs{1,4};
              obj.Telepon = curs{1,5};
              obj.Email = curs{1,6};
              clear curs;
          catch exception
              errordlg('Data Gagal Diload', 'Data');
              throw(exception);
          end
       end 
       
       function save(obj, conn)
          try
              data = {obj.NPM, obj.Password, obj.Nama, obj.Alamat, obj.Telepon, obj.Email};
              colnames = {'NPM', 'Password', 'Nama', 'Alamat', 'Telepon', 'Email'};
              fastinsert(conn, 'mahasiswa', colnames, data);
              data = {obj.NPM, 0};
              colnames = {'NPM', 'Kehadiran'};
              fastinsert(conn, 'kehadiran', colnames, data);
              clear colnames;
              clear data;
          catch exception
              errordlg('Data Mahasiswa Gagal Disimpan', 'Data');
              throw(exception);
          end
       end
       
       function update(obj, conn, npm)
           try
              data = {obj.NPM, obj.Password, obj.Nama, obj.Alamat, obj.Telepon, obj.Email}; 
              colnames = {'NPM', 'Password', 'Nama', 'Alamat', 'Telepon', 'Email'};
              update(conn, 'mahasiswa', colnames, data, ['where NPM=' '"' npm '"']);
           catch exception
              errordlg('Data Mahasiswa Gagal Diupdate', 'Data');
              throw(exception);
           end
       end
       
       function saveAllCitra(obj, conn, frameCount, image, path_name, file_name)
           try
              colnames = {'NPM', 'FileName', 'Path'};
              matriks = [];
              counter = 0;
              for i=1:frameCount
                  imshow(imresize(image(:,:,:,i), [190 190]));
                        % insert ke table wajah
                        if (i<10)
                            imwrite(image(:,:,:,i), [path_name 'backup_' file_name '_00' num2str(i) '.bmp'] , 'bmp');
                            data = {obj.NPM, ['backup_' file_name '_00' num2str(i) '.bmp'], path_name};
                        else
                            imwrite(image(:,:,:,i), [path_name 'backup_' file_name '_0' num2str(i) '.bmp'] , 'bmp');
                            data = {obj.NPM, ['backup_' file_name '_0' num2str(i) '.bmp'], path_name};
                        end
                        fastinsert(conn, 'wajah', colnames, data);
                        % Insert ke table citra pelatihan
                        % sebelumnya diikuti dengan konversi ke grayscale
                        % dan perataan histogram citra
                        conv = ImageProcessing.Processing(image(:,:,:,i));
                        
                        if (i<10)
                            imwrite(conv, [path_name file_name '_00' num2str(i) '.bmp'] , 'bmp');
                            data = {obj.NPM, [file_name '_00' num2str(i) '.bmp'], path_name};
                        else
                            imwrite(conv, [path_name file_name '_0' num2str(i) '.bmp'] , 'bmp');
                            data = {obj.NPM, [file_name '_0' num2str(i) '.bmp'], path_name};
                        end
                        
                        fastinsert(conn, 'citraPelatihan', colnames, data);
                        [width height] = size(conv);
                        conv = reshape(conv, 1, width*height);
                        matriks = [matriks; conv];
                        counter = counter + 1;
              end
              save([path_name file_name], 'matriks');
              data = {obj.NPM, [file_name '.mat'], path_name};
              fastinsert(conn, 'matriksPelatihan', colnames, data);     
           catch exception
              errordlg('Data Citra Gagal Disimpan', 'Data');
              throw(exception);
           end
       end
       
       
       function updateData(obj, conn, image, currentFrame, path_name, file_name)
                % Save file backup / original
                imwrite(image(:,:,:,currentFrame), [path_name file_name '.bmp'], 'bmp');
                % Save file citra pelatihan (convert gray, and histeq)
                imwrite(ImageProcessing.Processing(image(:,:,:,currentFrame)), [path_name file_name(8:end) '.bmp'], 'bmp');
                
                colnames = {'NPM', 'FileName', 'Path'};
                data = {obj.NPM, [file_name '.bmp'], path_name};
                
                if (Mahasiswa.isWajahExist(conn, path_name, file_name) == 0)
                    % Insert ke table wajah file backup / original
                    fastinsert(conn, 'wajah', colnames, data);
                    % Insert ke table citra pelatihan
                    data = {obj.NPM, [file_name(8:end) '.bmp'], path_name};
                    fastinsert(conn, 'citraPelatihan', colnames, data);
                end
                
                % Buat matriks citra pelatihan baru
                % Make a connection database
                matriks = [];
                
                curs = exec(conn, ['select * from citrapelatihan where NPM=' '"' obj.NPM '"']);
                setdbprefs('DataReturnFormat','cellarray');
                curs = fetch(curs);
                total = rows(curs);
                curs = get(curs, 'Data');
                image = imread([curs{1,3} curs{1,2}]);
                [width height] = size(image);
                for i=1:total
                    image = imread([curs{i,3} curs{i,2}]);
                    image = reshape(image, 1, width*height);
                    matriks = [matriks; image];
                end
                curs = exec(conn, ['select * from matrikspelatihan where NPM=' '"' obj.NPM '"']);
                setdbprefs('DataReturnFormat','cellarray');
                curs = fetch(curs);
                curs = get(curs, 'Data');
                save([curs{1,3} curs{1,2}], 'matriks');
                
                %destructor
                clear data;
                clear curs;
                clear matriks;
                clear total;
                clear image;
       end
       

       
       % Getter and setter region
       function value = getNPM(obj)
           value = obj.NPM;
       end
       
       function obj = setNPM(obj, npm)
           obj.NPM = npm;
       end
       
       function value = getPassword(obj)
           value = obj.Password;
       end
       
       function obj = setPassword(obj, password)
           obj.Password = password;
       end
       
       function value = getNama(obj)
           value = obj.Nama;
       end
       
       function obj = setNama(obj, nama)
           obj.Nama = nama;
       end
       
       function value = getAlamat(obj)
           value = obj.Alamat;
       end
       
       function obj = setAlamat(obj, alamat)
           obj.Alamat = alamat;
       end
       
       function value = getTelepon(obj)
           value = obj.Telepon;
       end
       
       function obj = setTelepon(obj, telepon)
           obj.Telepon = telepon;
       end
       
       function value = getEmail(obj)
           value = obj.Email;
       end
       
       function obj = setEmail(obj, email)
           obj.Email = email;
       end
       % End getter and setter region
       
       function value = showProperties(obj)
           temp = {};
           temp = [temp; obj.NPM];
           temp = [temp; obj.Password];
           temp = [temp; obj.Nama];
           temp = [temp; obj.Alamat];
           temp = [temp; obj.Telepon];
           temp = [temp; obj.Email];
           value = temp;
       end
       
   end% methods
end% classdef