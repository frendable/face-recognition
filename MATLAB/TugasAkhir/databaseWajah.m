function databaseWajah()
    % Buat waitbar
    wait = waitbar(0, 'Please Wait...',...
                    'Name', 'Now Loading...');
    steps = 5;
    step = 0;

    % Buat figure form database wajah
     databaseWajahfh = figure('MenuBar', 'none',...
         'Color', [0.941 0.941 0.941],...
         'Visible', 'on',...
         'NumberTitle', 'off',...
         'Name', 'Frendface - Simulation System Face Recognition and Detection',...
         'Position', [280,130,800,500],...
         'Resize', 'off',...
         'Visible', 'off',...
         'CloseRequestFcn',@databaseWajah_CloseRequestFcn);
    
    % Buat button main menu
    btnMainMenu(databaseWajahfh);
       
    % Fetch data mahasiswa
    handles.conn = database('tgsakhir','root','','MySQL','jdbc:mysql://localhost:3306/');
    handles.mhs = Mahasiswa;
    data = handles.mhs.getAllData(handles.conn);
    [totaldata ~] = size(data);
    totalwajah = [];
    
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
    
    for i=1:totaldata
        totalwajah{i,1} = handles.mhs.getTotalWajah(handles.conn, data{i,1});
    end;
    data = [data totalwajah];
    colnames = {'NPM', 'Password', 'Nama', 'Alamat', 'Telepon', 'Email', 'Total Wajah'};
    coledit = [false false false false false false false];
    colwdt = {100 50 150 100 100 200 100};
    
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
    
    % Buat table
    handles.htableData = uitable('Units', 'normalized',...
                 'BackgroundColor',  [1 1 1; 0.68 0.92 1],...
                 'Units', 'pixels',...
                 'Position', [50 280 700 150],...
                 'Data',  data,... 
                 'ColumnName', colnames,...
                 'ColumnWidth', colwdt,...
                 'ColumnEditable', coledit,...
                 'ToolTipString',...
                 'Select cells to highlight them on the plot',...
                 'CellSelectionCallback', @htableData_callback);
             
    colnames = {'FileName', 'Path'};
    coledit = [false false];
    colwdt = {150 300};         
	handles.htableWajah = uitable('Units', 'normalized',...
                 'BackgroundColor',  [1 1 1; 0.8 0.8 1],...
                 'Units', 'pixels',...
                 'Position', [50 100 400 150],...
                 'ColumnName', colnames,...
                 'ColumnWidth', colwdt,...
                 'ColumnEditable', coledit,...
                 'ToolTipString',...
                 'Select cells to highlight them on the plot',...
                 'CellSelectionCallback', @htableWajah_callback);
    %inspect(htableWajah);
    
    
    % Buat button action
    handles.btnEdit = uicontrol(databaseWajahfh, 'Style', 'Push Button',...
                                'String', 'Edit',...
                                'Position', [100 20 110 30],...
                                'FontName', 'Century Schoolbook',...
                                'FontSize', 10,...
                                'Enable', 'off');
    set(handles.btnEdit, 'Callback', @btnEdith_callback);
    handles.btnDelete = uicontrol(databaseWajahfh, 'Style', 'Push Button',...
                                    'String', 'Delete',...
                                    'Position', [250 20 110 30],...
                                    'FontName', 'Century Schoolbook',...
                                    'FontSize', 10,...
                                    'Enable', 'off');                        
    set(handles.btnDelete, 'Callback', @btnDeleteh_callback); 
    btnRefresh = uicontrol(databaseWajahfh, 'Style', 'Push Button',...
                                    'String', 'Refresh',...
                                    'Position', [400 20 110 30],...
                                    'FontName', 'Century Schoolbook',...
                                    'FontSize', 10);                        
    set(btnRefresh, 'Callback', @btnRefreshh_callback); 
    btnJST = uicontrol(databaseWajahfh, 'Style', 'Push Button',...
                                    'String', 'Create JST',...
                                    'Position', [550 20 110 30],...
                                    'FontName', 'Century Schoolbook',...
                                    'FontSize', 10,...
                                    'Enable', 'off'); 
	set(btnJST, 'Callback', @btnJSTh_callback);
    % Cek jumlah data mahasiswa, jika kosong enable Create JST off                           
    if (handles.mhs.getJumlahData(handles.conn) > 0)
        set(btnJST, 'Enable', 'on');
    end
    
    
                        
    uicontrol(databaseWajahfh, 'Style', 'text',...
                            'String', '© 2012 Final Project Created By Frendy Priandi (2009130009)',...
                            'FontName', 'Times New Roman',...
                            'FontSize', 12,...
                            'Position',[400 0 400 20]);
                        
    % Panel preview picture
    previewph = uipanel(databaseWajahfh, 'Title', 'Preview',...
                                'Units', 'Pixels',...
                                'Position',[500 60 220 220]);    
    % Buat preview axes
    axes('Parent', previewph,...
                    'Box', 'on',...
                    'Units', 'Pixels',...
                    'Position', [13 10 190 190],...
                    'XTickMode','manual', 'YTickMode','manual', ...
                    'XTick',[], 'YTick',[], 'XTickLabelMode', 'manual', ...
                    'XTickLabel', [], 'YTickLabelMode', 'manual', 'YTickLabel', []);    
                
    % Buat checkbox
    handles.chb = uicontrol(databaseWajahfh,'Style','checkbox',...
                'String','Show GrayscaleImage',...
                'Value',0,'Position',[320 70 130 20],...
                'Enable', 'off',...
                'Callback', @checkbox_callback);        
    
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
            
    % Buat object eigen
    handles.eigen = EigenFace(handles.conn);
    
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
    
    %inspect(cbh);
    %propedit(btnPendaftaranh);
    
    % Set figure center position
    % movegui(mainmenufh, 'center');
    % Set figure visible
    set(databaseWajahfh, 'Visible', 'on');
    % save GUI Data
    guidata(gcf, handles);
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
    delete(wait);
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
                                    'FontSize', 10,...
                                    'Enable', 'off');
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
        set(handles.btnEdit, 'Enable', 'off');
        set(handles.btnDelete, 'Enable', 'off');
        return
    else
        set(handles.btnEdit, 'Enable', 'on');
        set(handles.btnDelete, 'Enable', 'on', 'String', 'Delete Data');
        table = get(hObject,'Data');
        handles.selectedKeyData = table(selrows, 1);
        handles.selectedKeyData = handles.selectedKeyData{1};
        % save GUI Data
        guidata(gcf, handles);
        displayTableWajah(handles.selectedKeyData);
    end
end

function displayTableWajah(selectedKey)
    handles=guidata(gcf);
    data = handles.mhs.getWajah(handles.conn, selectedKey);
    set(handles.htableWajah, 'Data', data);
    % save GUI Data
    guidata(gcf, handles);
end

% Dieksekusi ketika cell table wajah dipilih
function htableWajah_callback(hObject, eventdata)
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
        set(handles.btnDelete, 'Enable', 'off');
        set(handles.chb, 'Enable', 'off');
        return
    else
        set(handles.btnDelete, 'Enable', 'on', 'String', 'Delete Wajah');
        set(handles.chb, 'Enable', 'on');
        table = get(hObject,'Data');
        path = table(selrows, 2);
        path = path{1};
        name = table(selrows, 1);
        name = name{1};
        handles.selectedKeyWajah = name;
        handles.selectedPathWajah = path;
        % save GUI Data
        guidata(gcf, handles);
        if (get(handles.chb,'Value') == 0)
            displayCitraWajah([path name]);
        else
            displayCitraWajah([path name(8:end)]);
        end
    end
end

function displayCitraWajah(selectedKey)
    if (exist(selectedKey, 'file') == 2)
        image = imread(selectedKey);
        imshow(imresize(image, [190 190]));
    else
        errordlg('Data Wajah Tidak Ada', 'Data');
    end
end

function checkbox_callback(hObject, ~)
    handles=guidata(gcf);
        if (get(hObject,'Value') == 0)
            displayCitraWajah([handles.selectedPathWajah handles.selectedKeyWajah]);
        else
            displayCitraWajah([handles.selectedPathWajah handles.selectedKeyWajah(8:end)]);
        end
end








function btnEdith_callback(~, ~)
    editData(gcf);
end

function btnDeleteh_callback(hObject, ~)
    handles=guidata(gcf);
    if (strcmp(get(hObject, 'String'), ('Delete Data')))
        selection = questdlg(['Delete Data NPM ' handles.selectedKeyData '?'],...
                ['Delete Data NPM ' handles.selectedKeyData '...'],...
                'Yes','No','Yes');
        if strcmp(selection,'No')
            return;
        end
        % Delete data
        handles.mhs.deleteData(handles.conn, handles.selectedKeyData);
        
    elseif (strcmp(get(hObject, 'String'), ('Delete Wajah')))
            disp(handles.selectedKeyWajah);
            selection = questdlg(['Delete data Wajah ' handles.selectedKeyWajah '?'],...
                ['Delete data Wajah ' handles.selectedKeyWajah '...'],...
                'Yes','No','Yes');
            if strcmp(selection,'No')
                return;
            end
            % Delete wajah
            handles.mhs.deleteSatuWajah(handles.conn, handles.selectedKeyData, handles.selectedKeyWajah);
    end
    % save GUI Data
    guidata(gcf, handles);
    btnRefreshh_callback();
end

function btnRefreshh_callback(~, ~)
    handles=guidata(gcf);
    data = handles.mhs.getAllData(handles.conn);
    [totaldata ~] = size(data);
    totalwajah = [];
    for i=1:totaldata
        totalwajah{i,1} = handles.mhs.getTotalWajah(handles.conn, data{i,1});
    end;
    data = [data totalwajah];
    set(handles.htableData, 'Data', data);
end

function btnJSTh_callback(~, ~)
    daftarJST(gcf);
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
    databaseWajah;
end

% Dieksekusi ketika tombol daftar kehadiran ditekan
function btnDaftarKehadiranh_callback(~, ~)
    delete(gcbf);
    daftarKehadiran;
end

% Dieksekusi ketika tombol exit ditekan
function btnKeluarh_callback(~, ~)
    close(gcbf);
end

% Dijalankan ketika figure diclose
function databaseWajah_CloseRequestFcn(hObject, ~)
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