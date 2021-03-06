function editData(param)
    editDatafh = figure('MenuBar', 'none',...
         'Color', [0.941 0.941 0.941],...
         'NumberTitle', 'off',...
         'Name', 'Edit Data',...
         'Position', [480,200,400,350],...
         'Resize', 'off',...
         'WindowStyle', 'modal',...
         'Visible','off');
    handlesparam=guidata(param);
    handles.mhs = handlesparam.mhs;
    handles.conn = handlesparam.conn;
    handles.selectedKeyData = handlesparam.selectedKeyData;
    
    
    % Panel form data
    handles.formph = uipanel(editDatafh, 'Title', 'Form Edit Data',...
                                'Units', 'Pixels',...
                                'Position',[50 70 300 270]);
    uicontrol(handles.formph, 'Style', 'text',...
                            'String', 'NPM : ',...
                            'FontName', 'Times New Roman',...
                            'FontSize', 12,...
                            'HorizontalAlignment', 'left',...
                            'Position',[20 210 100 30]);
    uicontrol(handles.formph, 'Style', 'text',...
                            'String', 'PASSWORD : ',...
                            'FontName', 'Times New Roman',...
                            'FontSize', 12,...
                            'HorizontalAlignment', 'left',...
                            'Position',[20 170 100 30]);
    uicontrol(handles.formph, 'Style', 'text',...
                            'String', 'NAMA : ',...
                            'FontName', 'Times New Roman',...
                            'FontSize', 12,...
                            'HorizontalAlignment', 'left',...
                            'Position',[20 130 100 30]);
    uicontrol(handles.formph, 'Style', 'text',...
                            'String', 'ALAMAT : ',...
                            'FontName', 'Times New Roman',...
                            'FontSize', 12,...
                            'HorizontalAlignment', 'left',...
                            'Position',[20 90 100 30]);  
    uicontrol(handles.formph, 'Style', 'text',...
                            'String', 'TELEPON : ',...
                            'FontName', 'Times New Roman',...
                            'FontSize', 12,...
                            'HorizontalAlignment', 'left',...
                            'Position',[20 50 100 30]);
    uicontrol(handles.formph, 'Style', 'text',...
                            'String', 'EMAIL : ',...
                            'FontName', 'Times New Roman',...
                            'FontSize', 12,...
                            'HorizontalAlignment', 'left',...
                            'Position',[20 10 100 30]);
	handles.editNPM = uicontrol(handles.formph, 'Style', 'edit',...
                                'BackgroundColor', 'white',...
                                'Position', [130 215 150 30]);
	handles.editPassword = uicontrol(handles.formph, 'Style', 'edit',...
                                'BackgroundColor', 'white',...
                                'Position', [130 175 150 30]);
	handles.editNama = uicontrol(handles.formph, 'Style', 'edit',...
                                'BackgroundColor', 'white',...
                                'Position', [130 135 150 30]);
	handles.editAlamat = uicontrol(handles.formph, 'Style', 'edit',...
                                'BackgroundColor', 'white',...
                                'Position', [130 95 150 30]);
	handles.editTelepon = uicontrol(handles.formph, 'Style', 'edit',...
                                'BackgroundColor', 'white',...
                                'Position', [130 55 150 30]);
	handles.editEmail = uicontrol(handles.formph, 'Style', 'edit',...
                                'BackgroundColor', 'white',...
                                'Position', [130 15 150 30]);
    % Buat button action
    uicontrol(editDatafh, 'Style', 'Push Button',...
                                'String', 'Save',...
                                'Position', [50 20 110 30],...
                                'FontName', 'Century Schoolbook',...
                                'FontSize', 10,...
                                'Enable', 'on',...
                                'Callback', @btnUpdateh_callback);
    uicontrol(editDatafh, 'Style', 'Push Button',...
                                'String', 'Cancel',...
                                'Position', [240 20 110 30],...
                                'FontName', 'Century Schoolbook',...
                                'FontSize', 10,...
                                'Enable', 'on',...
                                'Callback', @btnCancelh_callback);                     
    set(editDatafh, 'Visible', 'on');
    % save GUI Data
    guidata(gcf, handles);
    
    % Load data mahasiswa
    handles.mhs.load(handles.conn, handles.selectedKeyData);
    set(handles.editNPM, 'String', handles.mhs.getNPM);
    set(handles.editPassword, 'String', handles.mhs.getPassword);
    set(handles.editNama, 'String', handles.mhs.getNama);
    set(handles.editAlamat, 'String', handles.mhs.getAlamat);
    set(handles.editTelepon, 'String', handles.mhs.getTelepon);
    set(handles.editEmail, 'String', handles.mhs.getEmail);
end

function btnUpdateh_callback(~, ~)
    handles = guidata(gcf);
    handles.mhs.setNPM(get(handles.editNPM, 'String'));
    handles.mhs.setPassword(get(handles.editPassword, 'String'));
    handles.mhs.setNama(get(handles.editNama, 'String'));
    handles.mhs.setAlamat(get(handles.editAlamat, 'String'));
    handles.mhs.setTelepon(get(handles.editTelepon, 'String'));
    handles.mhs.setEmail(get(handles.editEmail, 'String'));
    handles.mhs.update(handles.conn, handles.selectedKeyData);
    msgbox('Data Berhasil Diupdate', 'Data');
end

function btnCancelh_callback(~, ~)
    delete(gcbf);
end