function daftarKehadiran()

    % Buat figure form database wajah
     daftarKehadiranfh = figure('MenuBar', 'none',...
         'Color', [0.941 0.941 0.941],...
         'Visible', 'on',...
         'NumberTitle', 'off',...
         'Name', 'Frendface - Simulation System Face Recognition and Detection',...
         'Position', [280,130,800,500],...
         'Resize', 'off',...
         'Visible', 'off',...
         'CloseRequestFcn',@daftarKehadiran_CloseRequestFcn);

    % Buat button main menu
    btnMainMenu(daftarKehadiranfh);

    
    
    
    % Fetch data mahasiswa
    handles.conn = database('tgsakhir','root','','MySQL','jdbc:mysql://localhost:3306/');
    handles.mhs = Mahasiswa;
    dataNPM = handles.mhs.getDataNPM(handles.conn);
    dataNama = handles.mhs.getAllName(handles.conn);
    dataKehadiran = handles.mhs.getAllKehadiran(handles.conn);
    data = [dataNPM dataNama dataKehadiran];
    colnames = {'NPM', 'Nama', 'Kehadiran'};
    coledit = [false false false];
    colwdt = {100 150 100};

    
    % Buat table
    handles.htableData = uitable('Units', 'normalized',...
                 'BackgroundColor',  [1 1 1; 0.68 0.92 1],...
                 'Units', 'pixels',...
                 'Position', [200 200 400 150],...
                 'Data',  data,... 
                 'ColumnName', colnames,...
                 'ColumnWidth', colwdt,...
                 'ColumnEditable', coledit,...
                 'ToolTipString',...
                 'Select cells to highlight them on the plot',...
                 'CellSelectionCallback', @htableData_callback);       
             
             
    % Buat button action
    handles.btnReset = uicontrol(daftarKehadiranfh, 'Style', 'Push Button',...
                                'String', 'Reset Kehadiran',...
                                'Position', [350 150 110 30],...
                                'FontName', 'Century Schoolbook',...
                                'FontSize', 10,...
                                'Enable', 'off');
    set(handles.btnReset, 'Callback', @btnReseth_callback);
   
             
    % Set figure visible
    set(daftarKehadiranfh, 'Visible', 'on');
    % save GUI Data
    guidata(gcf, handles);
end




% Dieksekusi ketika cell table data dipilih
function htableData_callback(hObject, eventdata)
    % hObject    Handle to uitable1 (see GCBO)
    % eventdata  Currently selected table indices
    % Callback to erase and replot markers, showing only those
    % corresponding to user-selected cells in table. 
    % Repeatedly called while user drags across cells of the uitable
    handles=guidata(gcf);
    sel = eventdata.Indices;
    selrows = unique(sel(:,1));
    selcols = unique(sel(:,2));
    numrows = numel(selrows);
    numcols = numel(selcols);
    if ((numrows > 1) || (numcols > 1) || (numcols < 1) || (numrows < 1))
        set(handles.btnReset, 'Enable', 'off');
        return
    else
        set(handles.btnReset, 'Enable', 'on');
        table = get(hObject,'Data');
        handles.selectedKeyData = table(selrows, 1);
        handles.selectedKeyData = handles.selectedKeyData{1};
        % save GUI Data
        guidata(gcf, handles);
    end
end

function btnReseth_callback(~,~)
    handles=guidata(gcf);
    handles.mhs.resetKehadiran(handles.conn, handles.selectedKeyData);
    Refresh();
end

function Refresh()
    handles=guidata(gcf);
    data = get(handles.htableData, 'Data');
    dataNPM = data(:,1);
    dataNama = data(:,2);
    dataKehadiran = handles.mhs.getAllKehadiran(handles.conn);
    data = [dataNPM dataNama dataKehadiran];
    set(handles.htableData, 'Data', data);
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
                                    'FontSize', 10);                        
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
                                    'FontSize', 10,...
                                    'Enable', 'off');
    set(btnDaftarKehadiranh, 'Callback', @btnDaftarKehadiranh_callback);
    btnKeluarh = uicontrol(currentfig, 'Style', 'Push Button',...
                            'String', 'Keluar',...
                            'Position', [580 440 120 60],...
                            'FontName', 'Century Schoolbook',...
                            'FontSize', 10);
    set(btnKeluarh, 'Callback', @btnKeluarh_callback);      
end







% Dieksekusi ketika tombol pendaftaran ditekan
function btnPendaftaranh_callback(~, ~)
    % Buat figure form pendaftaran
    % pendaftaranfh = figure;
    delete(gcbf);
    delete(imaqfind);
    clear imaqfind;
    pendaftaran;
end

% Dieksekusi ketika tombol catat kehadiran ditekan
function btnCatatKehadiranh_callback(~, ~)
    delete(gcbf);
    delete(imaqfind);
    clear imaqfind;
    catatKehadiran;
end

% Dieksekusi ketika tombol database wajah ditekan
function btnDatabaseWajahh_callback(~, ~)
    % Buat figure form database wajah
    delete(gcbf);
    delete(imaqfind);
    clear imaqfind;
    databaseWajah;
end

% Dieksekusi ketika tombol exit ditekan
function btnKeluarh_callback(~, ~)
    close(gcbf);
end

% Dijalankan ketika figure diclose
function daftarKehadiran_CloseRequestFcn(hObject, ~)
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
    delete(hObject);
    delete(gcbf);
    clear gcbf;
end