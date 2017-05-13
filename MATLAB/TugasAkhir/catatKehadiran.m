function catatKehadiran()
    % Create waitbar
    wait = waitbar(0, 'Please Wait...',...
                    'Name', 'Now Loading...');
    steps = 12;
    step = 0;   
    
    % Create figure form catat kehadiran
    catatKehadiranfh = figure('MenuBar', 'none',...
         'Color', [0.941 0.941 0.941],...
         'Visible', 'on',...
         'NumberTitle', 'off',...
         'Name', 'Frendface - Simulation System Face Recognition and Detection',...
         'Position', [280,130,800,500],...
         'Resize', 'off',...
         'visible','off',...
         'CloseRequestFcn',@catatKehadiran_CloseRequestFcn);
    
   
     
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']); 
     
    % Buat button main menu
    btnMainMenu(catatKehadiranfh);
    
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']); 
    
    % Buat static text
    uicontrol(catatKehadiranfh, 'Style', 'text',...
                            'String', '© 2012 Final Project Created By Frendy Priandi (2009130009)',...
                            'FontName', 'Times New Roman',...
                            'FontSize', 12,...
                            'Position',[400 0 400 20]);
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
    
    %Buat panel camera
    handles.cameraph = uipanel(catatKehadiranfh,'Title','Camera Preview',...
                        'Units', 'Pixels',...
                        'BorderType', 'beveledin',...
                        'Position',[50 150 360 280]);
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
                    
    % Buat camera axes
    handles.cameraah = axes('Parent', handles.cameraph,...
                    'Box', 'on',...
                    'Units', 'Pixels',...
                    'Position', [18 15 320 240],...
                    'XTickMode','manual', 'YTickMode','manual', ...
                    'XTick',[], 'YTick',[], 'XTickLabelMode', 'manual', ...
                    'XTickLabel', [], 'YTickLabelMode', 'manual', 'YTickLabel', []);  
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
    
    
    % Buat static text information
    handles.informationh = uicontrol(catatKehadiranfh, 'Style', 'text',...
                                    'String', 'Ready to start camera',...
                                    'FontName', 'Times New Roman',...
                                    'FontSize', 10,...
                                    'Position',[25 115 400 20]);
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
    
    % Buat panel button action camera
    handles.panelpreviewh = uipanel(catatKehadiranfh, 'Title', 'Action',...
                                'Units', 'Pixels',...
                                'Position',[165 50 125 60]);
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
                            
    % Buat button startstop camera
    handles.btnStartStopCamerah = uicontrol(handles.panelpreviewh, 'Style', 'Push Button',...
                                    'String', 'Start Camera',...
                                    'Position', [10 10 100 30],...
                                    'FontName', 'Century Schoolbook',...
                                    'FontSize', 10,...
                                    'Callback', @btnStartStopCamerah_callback);
    % Buat button open dialog
    handles.btnDialog = uicontrol(catatKehadiranfh, 'Style', 'Push Button',...
                                    'String', 'Open Picture',...
                                    'Position', [10 10 100 30],...
                                    'FontName', 'Century Schoolbook',...
                                    'FontSize', 10,...
                                    'Callback', @btnDialogh_callback);
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
    
    % Buat panel identifikasi
    panelidentifikasih = uipanel(catatKehadiranfh, 'Title', 'Identifikasi',...
                                'Units', 'Pixels',...
                                'Position',[450 30 320 410]);
    
    % Buat camera axes
    handles.identifikasih = axes('Parent', panelidentifikasih,...
                    'Box', 'on',...
                    'Units', 'Pixels',...
                    'Position', [105 240 110 110],...
                    'XTickMode','manual', 'YTickMode','manual', ...
                    'XTick',[], 'YTick',[], 'XTickLabelMode', 'manual', ...
                    'XTickLabel', [], 'YTickLabelMode', 'manual', 'YTickLabel', []);
                
    % Buat static text identifikasi
    uicontrol(panelidentifikasih, 'Style', 'text',...
                                    'String', 'IDENTIFIKASI',...
                                    'FontName', 'Times New Roman',...
                                    'FontSize', 12,...
                                    'Position',[10 365 300 20]);
    % Buat static text identifikasi
    uicontrol(panelidentifikasih, 'Style', 'text',...
                                    'String', 'NPM',...
                                    'FontName', 'Times New Roman',...
                                    'FontSize', 10,...
                                    'Position',[1 195 160 20]);
    uicontrol(panelidentifikasih, 'Style', 'text',...
                                    'String', 'NAMA',...
                                    'FontName', 'Times New Roman',...
                                    'FontSize', 10,...
                                    'Position',[1 155 160 20]);
    uicontrol(panelidentifikasih, 'Style', 'text',...
                                    'String', 'ALAMAT',...
                                    'FontName', 'Times New Roman',...
                                    'FontSize', 10,...
                                    'Position',[1 115 160 20]);
    uicontrol(panelidentifikasih, 'Style', 'text',...
                                    'String', 'TELEPON',...
                                    'FontName', 'Times New Roman',...
                                    'FontSize', 10,...
                                    'Position',[1 75 160 20]);
    uicontrol(panelidentifikasih, 'Style', 'text',...
                                    'String', 'EMAIL',...
                                    'FontName', 'Times New Roman',...
                                    'FontSize', 10,...
                                    'Position',[1 35 160 20]);
    uicontrol(panelidentifikasih, 'Style', 'text',...
                                    'String', 'TINGKAT KEMIRIPAN',...
                                    'FontName', 'Times New Roman',...
                                    'FontSize', 10,...
                                    'Position',[1 10 160 20]);
    % Buat dinamis text identifikasi
    handles.npm = uicontrol(panelidentifikasih, 'Style', 'text',...
                                    'String', '',...
                                    'FontName', 'Times New Roman',...
                                    'FontSize', 10,...
                                    'Position',[157 195 160 20]);
    handles.nama = uicontrol(panelidentifikasih, 'Style', 'text',...
                                    'String', '',...
                                    'FontName', 'Times New Roman',...
                                    'FontSize', 10,...
                                    'Position',[157 155 160 20]);
    handles.alamat = uicontrol(panelidentifikasih, 'Style', 'text',...
                                    'String', '',...
                                    'FontName', 'Times New Roman',...
                                    'FontSize', 10,...
                                    'Position',[157 115 160 20]);
    handles.telepon = uicontrol(panelidentifikasih, 'Style', 'text',...
                                    'String', '',...
                                    'FontName', 'Times New Roman',...
                                    'FontSize', 10,...
                                    'Position',[157 75 160 20]);
    handles.email = uicontrol(panelidentifikasih, 'Style', 'text',...
                                    'String', '',...
                                    'FontName', 'Times New Roman',...
                                    'FontSize', 10,...
                                    'Position',[157 35 160 20]);
    handles.tingkatakurasi = uicontrol(panelidentifikasih, 'Style', 'text',...
                                    'String', '',...
                                    'ForegroundColor', [0 0.6 0],...
                                    'FontName', 'Arial Black',...
                                    'FontSize', 10,...
                                    'Position',[157 10 160 20]);
    

    
    % Buat video input camera
    handles.vid = videoinput('winvideo', 1, 'YUY2_320x240');
    triggerconfig(handles.vid, 'manual');
    % Set banyaknya frame per trigger
    set(handles.vid,'FramesPerTrigger',1);
    % Set banyaknya trigger
    set(handles.vid,'TriggerRepeat',Inf);
    % Set warna pengembalian frame yang dicapture
    set(handles.vid,'ReturnedColorSpace','rgb');
    
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
    
    % Create a cascade detector object.
    handles.faceDetector = vision.CascadeObjectDetector;
    %handles.boxInserter  = vision.ShapeInserter('BorderColor','Custom',...
    %                                        'CustomBorderColor',[0 255 0]);
   
    set(handles.vid,'TimerPeriod', 0.01, ...
                        'Tag', 'Image Acquisition Face Detector', ...
                        'TimerFcn', @localFrame_Callback);
    
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);                
            
    
    % Text for preview name detection
    handles.name = uicontrol('Parent', handles.cameraph, 'Style', 'text',...
                                    'String', 'test',...
                                    'BackgroundColor', 'white',...
                                    'FontName', 'Arial Bold',...
                                    'FontSize', 10,...
                                    'Position',[215 115 70 20],...
                                    'ForegroundColor', [0 0 0.8],...
                                    'Visible', 'off');
    
    
    % Buat koneksi
    handles.conn = database('tgsakhir','root','','MySQL','jdbc:mysql://localhost:3306/');
    
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
    
    % Buat mahasiswa untuk load data
    handles.mhs = Mahasiswa;
    
    % Buat eigenface
    handles.eigen = EigenFace(handles.conn);
  
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
    
    % Save to current figure
    guidata(gcf, handles);
    
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
    
    delete(wait);
     % Set figure visible
    set(catatKehadiranfh, 'visible', 'on');
end




function btnStartStopCamerah_callback(~, ~)
    % Dapatkan data handles
    handles=guidata(gcf);
    % Start/Stop Camera
    if strcmp(get(handles.btnStartStopCamerah,'String'),'Start Camera')
        % Camera is off. Change button string and start camera.
        set(handles.btnStartStopCamerah,'String','Stop Camera')
        start(handles.vid);
        
        set(handles.npm, 'String', '');
        set(handles.nama, 'String', '');
        set(handles.alamat, 'String', '');
        set(handles.telepon, 'String', '');
        set(handles.email, 'String', '');
        set(handles.tingkatakurasi, 'String', '');
    else
        % Camera is on. Stop camera and change button string.
        set(handles.btnStartStopCamerah,'String','Start Camera')
        stop(handles.vid);
    end
end


function localFrame_Callback(~, ~)
    % Executed by the videoinput object callback 
    % to update the image display.

    % If the object has been deleted on us, 
    % or we're no longer running, do nothing.
        
        handles=guidata(gcf);
        frame = getsnapshot(handles.vid);
        
        %mulai=cputime;
        handles.bbox = step(handles.faceDetector, frame);
        %x = (cputime-mulai)/60  
        
        %image(picture);
        imshow(frame, 'parent', handles.cameraah);
            set(handles.npm, 'ForegroundColor', [1 0 0]);
            set(handles.npm, 'FontName', 'Arial Black');
            set(handles.npm, 'String', 'Tidak Terdeteksi Wajah');
            set(handles.nama, 'String', '');
            set(handles.alamat, 'String', '');
            set(handles.telepon, 'String', '');
            set(handles.email, 'String', '');
            set(handles.tingkatakurasi, 'String', '');
            set(handles.name, 'Visible', 'off');
        if (isempty(handles.bbox))
            children=get(handles.identifikasih, 'children');
            delete(children);
            return;
        else
            rectangle('Position',handles.bbox(1,:),'LineWidth',2,'EdgeColor',[0.5 1 0], 'parent', handles.cameraah);
            %test realtime recognition
            frame = imresize(imcrop(frame, handles.bbox(1,:)), [110 110]);
            if (~ strcmp(handles.eigen.CekWajah(frame), 'wrong'))
                handles.f = frame;
                % Update handles structure
                guidata(gcf, handles);
                Capture;
            else
                set(handles.name, 'Visible', 'off');
                set(handles.npm, 'ForegroundColor', [1 0 0]);
                set(handles.npm, 'FontName', 'Arial Black');
                set(handles.npm, 'String', 'Wajah Tidak Dikenali');
                children=get(handles.identifikasih, 'children');
                delete(children);
                return;
            end
        end
      
end


function Capture
    % hObject    handle to captureImage (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % frame = getsnapshot(handles.video);
    % frame = get(get(handles.cameraAxes,'children'),'cdata'); % The current displayed frame
    handles=guidata(gcf);
        % Camera is on. Stop camera and change button string.
            %set(handles.btnStartStopCamerah,'String','Start Camera');
            %%stoppreview(handles.vid);
            %stop(handles.vid);
            %%frame = getsnapshot(handles.vid);
            %%frame = imresize(imcrop(frame, handles.bbox(1,:)), [110 110]);
            frame = handles.f;
            imshow(frame, 'parent', handles.identifikasih);
            
        if (~strcmp(handles.eigen.CekWajah(frame), 'wrong'))
            handles.mhs.load(handles.conn, handles.eigen.CekWajah(frame));
            %kehadiran = handles.mhs.getKehadiran(handles.conn, handles.mhs.getNPM);
            %kehadiran = kehadiran{1};
            %kehadiran = kehadiran + 1;
            %handles.mhs.updateKehadiran(handles.conn, handles.mhs.getNPM, kehadiran);
            %clear kehadiran;
            %%disp(handles.eigen.CekWajah(frame));
            set(handles.npm, 'ForegroundColor', [0 0 0])
            set(handles.npm, 'FontName', 'Times New Roman')
            set(handles.npm, 'String', handles.mhs.getNPM);
            set(handles.nama, 'String', handles.mhs.getNama);
            set(handles.alamat, 'String', handles.mhs.getAlamat);
            set(handles.telepon, 'String', handles.mhs.getTelepon);
            set(handles.email, 'String', handles.mhs.getEmail);
            set(handles.tingkatakurasi, 'String', [int2str(handles.eigen.TingkatAkurasi*100), ' %']);
            set(handles.name, 'Visible', 'on');
            len = length(handles.mhs.getNama)*8;
            x = handles.bbox(1,3)+16;
            if len < x
                x = handles.bbox(1,1)+16+(handles.bbox(1,3)-len)/2;
            else
                x = handles.bbox(1,1)+16-(len-handles.bbox(1,3))/2;
            end
            set(handles.name, 'Position', [x 240-handles.bbox(1,2)-handles.bbox(1,4)-12 len 12]);
            set(handles.name, 'String', handles.mhs.getNama);
            %web(['http://localhost/tugasakhir/loginauto.php?npm=' handles.mhs.getNPM], '-browser');
        end
end






























% Function membuat button main menu
function btnMainMenu(currentfig)
    btnPendaftaranh = uicontrol(currentfig, 'Style', 'Push Button',...
                                'String', 'Pendaftaran',...
                                'Position', [100 440 120 60],...
                                'FontName', 'Century Schoolbook',...
                                'FontSize', 10);
    set(btnPendaftaranh, 'Callback', @btnPendaftaranh_callback);
    btnCatatKehadiranh = uicontrol(currentfig, 'Style', 'Push Button',...
                                    'String', 'Catat Kehadiran',...
                                    'Position', [220 440 120 60],...
                                    'FontName', 'Century Schoolbook',...
                                    'FontSize', 10,...
                                    'Enable', 'off');                        
    set(btnCatatKehadiranh, 'Callback', @btnCatatKehadiranh_callback);         
    btnDatabaseWajahh = uicontrol(currentfig, 'Style', 'Push Button',...
                                    'String', 'Database Wajah',...
                                    'Position', [340 440 120 60],...
                                    'FontName', 'Century Schoolbook',...
                                    'FontSize', 10);
    set(btnDatabaseWajahh, 'Callback', @btnDatabaseWajahh_callback);
    btnDaftarKehadiranh = uicontrol(currentfig, 'Style', 'Push Button',...
                                    'String', 'Daftar Kehadiran',...
                                    'Position', [460 440 120 60],...
                                    'FontName', 'Century Schoolbook',...
                                    'FontSize', 10);
    set(btnDaftarKehadiranh, 'Callback', @btnDaftarKehadiranh_callback);
    btnKeluarh = uicontrol(currentfig, 'Style', 'Push Button',...
                            'String', 'Keluar',...
                            'Position', [580 440 120 60],...
                            'FontName', 'Century Schoolbook',...
                            'FontSize', 10);
    set(btnKeluarh, 'Callback', @btnKeluarh_callback);      
end



%-------------------------------------------------------------------------
% Callback Main Menu

% Dieksekusi ketika tombol pendaftaran ditekan
function btnPendaftaranh_callback(~, ~)
    % Buat figure form pendaftaran
    delete(gcbf);
    delete(imaqfind);
    clear imaqfind;
    pendaftaran;
end

% Dieksekusi ketika tombol database wajah ditekan
function btnDatabaseWajahh_callback(~, ~)
    delete(gcbf);
    delete(imaqfind);
    clear imaqfind;
    databaseWajah;
end

% Dieksekusi ketika tombol daftar kehadiran ditekan
function btnDaftarKehadiranh_callback(~, ~)
    delete(gcbf);
    delete(imaqfind);
    clear imaqfind;
    daftarKehadiran;
end

% Dieksekusi ketika tombol exit ditekan
function btnKeluarh_callback(~, ~)
    close(gcbf);
end

% End Callback Main Menu
%-------------------------------------------------------------------------

% Dijalankan ketika figure diclose
function catatKehadiran_CloseRequestFcn(~, ~)
% hObject    handle to myCameraGUI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
    selection = questdlg(['Close ' get(gcbf,'Name') '?'],...
                ['Close ' get(gcbf,'Name') '...'],...
                'Yes','No','Yes');
    if strcmp(selection,'No')
        return;
    end
 
    delete(imaqfind);
    clear imaqfind;
    delete(gcbf);
end

function [file_name, path_name] = getDialogBox(title_name)
        [file_name, path_name] = uigetfile({'*.jpg;*.bmp;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' },title_name,...
          'D:\Matlab\TugasAkhir\Database\newfile.bmp');
end

function btnDialogh_callback(~, ~)
    handles=guidata(gcf);
    [file_name, path_name] = getDialogBox('Choose Picture');
    
    if (file_name ~= 0)
        npm = handles.eigen.CekWajah(imread([path_name file_name]))
    if (~ strcmp(npm, 'wrong'));
            handles.mhs.load(handles.conn, npm);
            kehadiran = handles.mhs.getKehadiran(handles.conn, handles.mhs.getNPM);
            kehadiran = kehadiran{1};
            kehadiran = kehadiran + 1;
            handles.mhs.updateKehadiran(handles.conn, handles.mhs.getNPM, kehadiran);
            clear kehadiran;
            %disp(handles.eigen.CekWajah(frame));
            set(handles.npm, 'String', handles.mhs.getNPM);
            set(handles.nama, 'String', handles.mhs.getNama);
            set(handles.alamat, 'String', handles.mhs.getAlamat);
            set(handles.telepon, 'String', handles.mhs.getTelepon);
            set(handles.email, 'String', handles.mhs.getEmail);
            set(handles.tingkatakurasi, 'String', [int2str(handles.eigen.TingkatAkurasi*100), ' %']);
    else
        set(handles.npm, 'String', 'Tidak Terdeteksi Wajah');
            set(handles.nama, 'String', '');
            set(handles.alamat, 'String', '');
            set(handles.telepon, 'String', '');
            set(handles.email, 'String', '');
            set(handles.tingkatakurasi, 'String', '');
    end
    end
end
