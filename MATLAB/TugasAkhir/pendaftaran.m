function pendaftaran()
    % Buat waitbar
    wait = waitbar(0, 'Please Wait...',...
                    'Name', 'Now Loading...');
    steps = 14;
    step = 0;
    
    % Buat figure form pendaftaran
    pendaftaranfh = figure('MenuBar', 'none',...
         'Color', [0.941 0.941 0.941],...
         'Visible', 'on',...
         'NumberTitle', 'off',...
         'Name', 'Frendface - Simulation System Face Recognition and Detection',...
         'Position', [280,130,800,500],...
         'Resize', 'off',...
         'visible','off',...
         'CloseRequestFcn',@pendaftaran_CloseRequestFcn);
     
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
     
    % Buat button main menu
    btnMainMenu(pendaftaranfh);
    
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
    
    % Buat static text
    uicontrol(pendaftaranfh, 'Style', 'text',...
                            'String', '© 2012 Final Project Created By Frendy Priandi (2009130009)',...
                            'FontName', 'Times New Roman',...
                            'FontSize', 12,...
                            'Position',[400 0 400 20]);
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
                        
    %Buat panel camera
    handles.cameraph = uipanel(pendaftaranfh,'Title','Camera Preview',...
                        'Units', 'Pixels',...
                        'BorderType', 'beveledin',...
                        'Position',[240 150 360 280]);
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

                    
    % Buat panel preview camera
    %previewhandles.cameraph = uipanel(pendaftaranfh, 'Title', 'Preview',...
    %                            'Units', 'Pixels',...
    %                            'Position',[50 50 230 60]);
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
                            
    % Buat button start preview
    %handles.btnStartPreviewh = uicontrol(previewhandles.cameraph, 'Style', 'Push Button',...
    %                                'String', 'Start Preview',...
    %                                'Position', [10 10 100 30],...
    %                                'FontName', 'Century Schoolbook',...
    %                                'FontSize', 10,...
    %                                'Callback', @btnStartPreviewh_callback);
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
                                
    % Buat button stop preview
    %handles.btnStopPreviewh = uicontrol(previewhandles.cameraph, 'Style', 'Push Button',...
    %                                'String', 'Stop Preview',...
    %                                'Position', [115 10 100 30],...
    %                                'FontName', 'Century Schoolbook',...
    %                                'FontSize', 10,...
    %                                'Enable', 'off',...
    %                                'Callback', @btnStopPreviewh_callback);
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
    
    % Buat panel acquire camera
    acquirehandles.cameraph = uipanel(pendaftaranfh, 'Title', 'Acquire',...
                                'Units', 'Pixels',...
                                'Position',[180 50 475 60]);
    %                            'Position',[300 50 475 60]);
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
                            
    % Buat button start acquisition
    handles.btnStartAcquisitionh = uicontrol(acquirehandles.cameraph, 'Style', 'Push Button',...
                                    'String', 'Start Acquisition',...
                                    'Position', [10 10 110 30],...
                                    'FontName', 'Century Schoolbook',...
                                    'FontSize', 10,...
                                    'Callback', @btnStartAcquisitionh_callback);
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
                                
    % Buat button capture
    handles.btnCaptureh = uicontrol(acquirehandles.cameraph, 'Style', 'Push Button',...
                                    'String', 'Capture',...
                                    'Position', [125 10 110 30],...
                                    'FontName', 'Century Schoolbook',...
                                    'FontSize', 10,...
                                    'Enable', 'off',...
                                    'Callback', @btnCaptureh_callback);
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
                                
    % Buat button stop acquisition
    handles.btnStopAcquisitionh = uicontrol(acquirehandles.cameraph, 'Style', 'Push Button',...
                                    'String', 'Stop Acquisition',...
                                    'Position', [240 10 110 30],...
                                    'FontName', 'Century Schoolbook',...
                                    'FontSize', 10,...
                                    'Enable', 'off',...
                                    'Callback', @btnStopAcquisitionh_callback);
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
                                
    % Buat button save image
    handles.btnSaveImageh = uicontrol(acquirehandles.cameraph, 'Style', 'Push Button',...
                                    'String', 'Save Image',...
                                    'Position', [355 10 110 30],...
                                    'FontName', 'Century Schoolbook',...
                                    'FontSize', 10,...
                                    'Enable', 'off',...
                                    'Callback', @btnSaveImageh_callback);
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
    
    % Buat static text information
    handles.informationh = uicontrol(pendaftaranfh, 'Style', 'text',...
                                    'String', 'Ready to start preview or acquisition.',...
                                    'FontName', 'Times New Roman',...
                                    'FontSize', 10,...
                                    'Position',[215 115 400 20]);   
                               
    % inspect(pendaftaranfh);
    
    % Buat video input camera
    handles.vid = videoinput('winvideo', 1, 'YUY2_320x240');
    triggerconfig(handles.vid, 'manual');
    % Set banyaknya frame per trigger
    set(handles.vid,'FramesPerTrigger',1);
    % Set banyaknya trigger
    set(handles.vid,'TriggerRepeat',Inf);
    % Set warna pengembalian frame yang dicapture
    set(handles.vid,'ReturnedColorSpace','rgb');

        
    % Text for preview frame acquired
    handles.t = uicontrol('Parent', pendaftaranfh, 'Style', 'text',...
                                    'String', 'test',...
                                    'BackgroundColor', 'white',...
                                    'FontName', 'Arial',...
                                    'FontSize', 10,...
                                    'Position',[215 115 70 20],...
                                    'Visible', 'off');  
    
    % save GUI Data
    guidata(gcf, handles);
   
    step=step+1;
    waitbar(step / steps, wait, ['Loading Component : ', int2str(step/steps*100), ' %']);
    delete(wait);
     % Set figure visible
    set(pendaftaranfh, 'visible', 'on');
end

%-------------------------------------------------------------------------
% Callback main button

% Button start preview callback
function btnStartPreviewh_callback(~, ~)
    % Set callback kosong
    set(gcf, 'WindowButtonMotionFcn', '');
    
    handles=guidata(gcf);
    % Buat button start preview disable
    set(handles.btnStartPreviewh, 'Enable', 'off');
    % Buat button stop preview enable
    set(handles.btnStopPreviewh, 'Enable', 'on');
    % Set static text information
    set(handles.informationh, 'String', 'Ready to start acquisition.');
    
    vidRes = get(handles.vid, 'VideoResolution'); 
    nBands = get(handles.vid, 'NumberOfBands');
    hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
    preview(handles.vid, hImage); 
end

% Button stop preview callback
function btnStopPreviewh_callback(~, ~)
    handles=guidata(gcf);
    % Buat button stop preview disable
    set(handles.btnStopPreviewh, 'Enable', 'off');
    % Buat button start preview enable
    set(handles.btnStartPreviewh, 'Enable', 'on');
    % Set static text information
    set(handles.informationh, 'String', 'Ready to start preview or acquisition.');
    
    stoppreview(handles.vid);
end

% Button start acquisition callback
function btnStartAcquisitionh_callback(~, ~)
    % Set callback kosong
    set(gcf, 'WindowButtonMotionFcn', '');
    
    handles=guidata(gcf);
    % Buat button start acquisition disable
    set(handles.btnStartAcquisitionh, 'Enable', 'off');
    % Buat button stop preview disable
    % set(handles.btnStopPreviewh, 'Enable', 'off');
    % Buat button start preview disable
    % set(handles.btnStartPreviewh, 'Enable', 'off');
    % Buat button capture enable
    set(handles.btnCaptureh, 'Enable', 'on');
    % Buat button stop acquisition enable
    set(handles.btnStopAcquisitionh, 'Enable', 'on');
    
    
    % Preview
    vidRes = get(handles.vid, 'VideoResolution'); 
    nBands = get(handles.vid, 'NumberOfBands');
    hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
    preview(handles.vid, hImage);
    
    % Starting acquisition
    start(handles.vid);
    
    % Set static text information
    set(handles.informationh, 'String', 'Waiting for Capture.');
    set(handles.btnSaveImageh, 'Enable', 'off');
end

% Button capture callback
function btnCaptureh_callback(~, ~)
    handles=guidata(gcf);
    % Set static text information
    set(handles.informationh, 'String', ['Frames Acquired : ', num2str(handles.vid.FramesAcquired+1)]);
    % Capture image
    trigger(handles.vid);
end

% Button stop acquisition callback
function btnStopAcquisitionh_callback(~, ~)
    handles=guidata(gcf);
    % Buat button stop acquisition disable
    set(handles.btnStopAcquisitionh, 'Enable', 'off');
    % Buat button start acquisition enable
    set(handles.btnStartAcquisitionh, 'Enable', 'on');
    % Buat button capture disable
    set(handles.btnCaptureh, 'Enable', 'off');
    % Buat button start preview enable
    % set(handles.btnStartPreviewh, 'Enable', 'on');
    % Set static text information
    set(handles.informationh, 'String', 'Acquisition Stopped.');
    
    stoppreview(handles.vid);
    stop(handles.vid);
    
    if (handles.vid.FramesAcquired > 0)
        matrix = uint8(zeros(240, 320, 3));
        handles.images = getdata(handles.vid, handles.vid.FramesAcquired);
        % Create a cascade detector object.
        faceDetector = vision.CascadeObjectDetector;
        
        for i=1:handles.vid.FramesAcquired
            bbox = step(faceDetector, handles.images(:,:,:,i));
            try
                handles.image(:,:,:,i) = imresize(imcrop(handles.images(:,:,:,i), bbox(1,:)), [110 110]);
            catch
                blackframe = uint8(zeros(110, 110, 3));
                handles.image(:,:,:,i) = blackframe;
            end
        end
        
        % save GUI Data
        guidata(gcf, handles);
        
        if (handles.vid.FramesAcquired < 10)
            set(handles.informationh, 'String', 'Displaying All Frames');
            if (handles.vid.FramesAcquired == 1)
                %image(images);
                imshow(handles.images(:,:,:,1));
            else if (handles.vid.FramesAcquired == 2)
                    imshow([handles.images(:,:,:,1) handles.images(:,:,:,2)]);
                else if (handles.vid.FramesAcquired == 3)
                        imshow([handles.images(:,:,:,1) handles.images(:,:,:,2); handles.images(:,:,:,3) matrix;]);   
                    else if (handles.vid.FramesAcquired == 4)
                            imshow([handles.images(:,:,:,1) handles.images(:,:,:,2); handles.images(:,:,:,3) handles.images(:,:,:,4);]); 
                        else if (handles.vid.FramesAcquired == 5)
                                imshow([handles.images(:,:,:,1) handles.images(:,:,:,2); handles.images(:,:,:,3) handles.images(:,:,:,4); handles.images(:,:,:,5) matrix;]);
                            else if (handles.vid.FramesAcquired == 6)
                                    imshow([handles.images(:,:,:,1) handles.images(:,:,:,2); handles.images(:,:,:,3) handles.images(:,:,:,4); handles.images(:,:,:,5) handles.images(:,:,:,6);]);
                                else if (handles.vid.FramesAcquired == 7)
                                        imshow([handles.images(:,:,:,1) handles.images(:,:,:,2) handles.images(:,:,:,3); handles.images(:,:,:,4) handles.images(:,:,:,5) handles.images(:,:,:,6); handles.images(:,:,:,7) matrix matrix;]);
                                    else if (handles.vid.FramesAcquired == 8)
                                            imshow([handles.images(:,:,:,1) handles.images(:,:,:,2) handles.images(:,:,:,3); handles.images(:,:,:,4) handles.images(:,:,:,5) handles.images(:,:,:,6); handles.images(:,:,:,7) handles.images(:,:,:,8) matrix;]);
                                        else if (handles.vid.FramesAcquired == 9)
                                            	imshow([handles.images(:,:,:,1) handles.images(:,:,:,2) handles.images(:,:,:,3); handles.images(:,:,:,4) handles.images(:,:,:,5) handles.images(:,:,:,6); handles.images(:,:,:,7) handles.images(:,:,:,8) handles.images(:,:,:,9);]);
                                            end
                                        end
                                    end
                                end
                            end
                        end 
                    end
                end
            end
        else
            handles.v1 = 1;
            handles.v9 = handles.vid.FramesAcquired;
            handles.v5 = round(handles.v9/2);
            handles.v3 = round(((handles.v9/2)+handles.v1)/2);
            handles.v2 = round(((((handles.v9/2)+handles.v1)/2)+handles.v1)/2);
            handles.v4 = round(((handles.v9/2)+(((handles.v9/2)+handles.v1)/2))/2);
            handles.v7 = round(((handles.v9/2)+handles.v9)/2);
            handles.v6 = round(((handles.v9/2)+(((handles.v9/2)+handles.v9)/2))/2);
            handles.v8 = round((handles.v9+(((handles.v9/2)+handles.v9)/2))/2);
            % save GUI Data
            guidata(gcf, handles);
            set(handles.informationh, 'String', ['Displaying 9 of ' num2str(handles.vid.FramesAcquired) ' frames: ' num2str(handles.v1) ', ' num2str(handles.v2) ', ' num2str(handles.v3) ', ' num2str(handles.v4) ', ' num2str(handles.v5) ', ' num2str(handles.v6) ', ' num2str(handles.v7) ', ' num2str(handles.v8) ', ' num2str(handles.v9) '.']);
            imshow([handles.images(:,:,:,handles.v1) handles.images(:,:,:,handles.v2) handles.images(:,:,:,handles.v3); handles.images(:,:,:,handles.v4) handles.images(:,:,:,handles.v5) handles.images(:,:,:,handles.v6); handles.images(:,:,:,handles.v7) handles.images(:,:,:,handles.v8) handles.images(:,:,:,handles.v9);]);
        end
    else
        set(handles.informationh, 'String', 'Stop Acquisition');
    end
    
    if (handles.vid.FramesAcquired > 0)
        set(handles.btnSaveImageh, 'Enable', 'on');
    end
        % Panggil function move mouse, ketika mouse bergeser
        set(gcf, 'WindowButtonMotionFcn', @MouseMove);
    % save GUI Data
    guidata(gcf, handles);
end

% Button save image callback
function btnSaveImageh_callback(~, ~)
    % Set callback kosong
    %set(gcf, 'WindowButtonMotionFcn', '');
    saveData(gcf);
end

% End callback main button
%-------------------------------------------------------------------------



% Function membuat button main menu
function btnMainMenu(currentfig)
    btnPendaftaranh = uicontrol(currentfig, 'Style', 'Push Button',...
                                'String', 'Pendaftaran',...
                                'Position', [100 440 120 60],...
                                'FontName', 'Century Schoolbook',...
                                'FontSize', 10,...
                                'Enable', 'off');
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
                                    'FontSize', 10);
    set(btnDaftarKehadiranh, 'Callback', @btnDaftarKehadiranh_callback);
    btnKeluarh = uicontrol(currentfig, 'Style', 'Push Button',...
                            'String', 'Keluar',...
                            'Position', [580 440 120 60],...
                            'FontName', 'Century Schoolbook',...
                            'FontSize', 10);
    set(btnKeluarh, 'Callback', @btnKeluarh_callback);      
end





function MouseMove(~, ~)
    handles=guidata(gcf);
    %get the position of the mouse:
    F = get(gcf,'currentpoint');
    Poscameraph = get(handles.cameraph, 'Position');
    Poscameraah = get(handles.cameraah, 'Position');
    
    % look if the mouse is inside the axe
    x1 = Poscameraph(1)+Poscameraah(1);
    x2 = Poscameraph(1)+Poscameraah(1)+Poscameraah(3);
    y1 = Poscameraph(2)+Poscameraah(2);
    y2 = Poscameraph(2)+Poscameraah(2)+Poscameraah(4);
    test1 = x1 <= F(1) && F(1) <= x2;
    test2 = y1 <= F(2) && F(2) <= y2;
    
    
    if test1 && test2 && (handles.vid.FramesAcquired > 1)
        set(handles.t, 'Visible', 'on');
        pos = get(gcf,'currentpoint');
        set(handles.t, 'Position', [pos(1) pos(2) 70 12]);
        if (handles.vid.FramesAcquired == 2)
            if ((F(1)<((x1+x2)/2)) && (F(2)>(((y1+y2)/2)+y1)/2) && (F(2)<((((y1+y2)/2)+y2)/2)) )
                set(handles.t, 'String', 'Frame 1');
            else if ((F(2)>(((y1+y2)/2)+y1)/2) && (F(2)<((((y1+y2)/2)+y2)/2)))
                    set(handles.t, 'String', 'Frame 2');
                else
                	set(handles.t, 'Visible', 'off');
                end
            end
        else if ((handles.vid.FramesAcquired == 3) || (handles.vid.FramesAcquired == 4))
                if ((F(1)<((x1+x2)/2)) && (F(2)>((y1+y2)/2)))
                     set(handles.t, 'String', 'Frame 1');
                else if ((F(1)>((x1+x2)/2)) && (F(2)>((y1+y2)/2)))
                        set(handles.t, 'String', 'Frame 2');
                    else if ((F(1)<((x1+x2)/2)) && (F(2)<((y1+y2)/2)))
                            set(handles.t, 'String', 'Frame 3');
                        else if (handles.vid.FramesAcquired == 4)
                                set(handles.t, 'String', 'Frame 4');
                            else
                                set(handles.t, 'Visible', 'off');
                            end
                        end
                    end
                end
            else if ((handles.vid.FramesAcquired == 5) || (handles.vid.FramesAcquired == 6))
                    if ( (F(1)<((x1+x2)/2)) && (F(2)>((((y2-y1)/3)*2)+y1)) && (F(1)>(x1+53)))
                        set(handles.t, 'String', 'Frame 1');
                    else if ( (F(1)>((x1+x2)/2)) && (F(2)>((((y2-y1)/3)*2)+y1)) && (F(1)<(x2-53)))
                            set(handles.t, 'String', 'Frame 2');
                        else if ( (F(1)<((x1+x2)/2)) && (F(2)>((((y2-y1)/3))+y1)) && (F(2)<((((y2-y1)/3)*2)+y1)) && (F(1)>(x1+53)))
                                set(handles.t, 'String', 'Frame 3');
                            else if ( (F(1)>((x1+x2)/2)) && (F(2)>((((y2-y1)/3))+y1)) && (F(2)<((((y2-y1)/3)*2)+y1)) && (F(1)<(x2-53)))
                                    set(handles.t, 'String', 'Frame 4');
                                else if ( (F(1)<((x1+x2)/2)) && (F(2)>y1) && (F(2)<((((y2-y1)/3))+y1)) && (F(1)>(x1+53)))
                                       set(handles.t, 'String', 'Frame 5'); 
                                    else if ((handles.vid.FramesAcquired == 6) && (F(1)<(x2-53)) && (F(1)>((x1+x2)/2)))
                                             set(handles.t, 'String', 'Frame 6');
                                        else
                                            set(handles.t, 'Visible', 'off');
                                        end
                                    end
                                end
                            end
                        end
                    end
                else 
                        if ((F(1)<(((x2-x1)/3)+x1)) && (F(2)>((((y2-y1)/3)*2)+y1)))
                            if (handles.vid.FramesAcquired < 10)
                                set(handles.t, 'String', 'Frame 1');
                            else
                                set(handles.t, 'String', ['Frame ' num2str(handles.v1)]);
                            end
                        else if ((F(1)<(((x2-x1)/3*2)+x1)) && (F(1)>(((x2-x1)/3)+x1)) && (F(2)>((((y2-y1)/3)*2)+y1)))
                                if (handles.vid.FramesAcquired < 10)
                                    set(handles.t, 'String', 'Frame 2');
                                else
                                    set(handles.t, 'String', ['Frame ' num2str(handles.v2)]);
                                end
                            else if ((F(1)>(((x2-x1)/3*2)+x1)) && (F(2)>((((y2-y1)/3)*2)+y1)))
                                    if (handles.vid.FramesAcquired < 10)
                                        set(handles.t, 'String', 'Frame 3');
                                    else
                                        set(handles.t, 'String', ['Frame ' num2str(handles.v3)]);
                                    end
                                else if ((F(1)<(((x2-x1)/3)+x1)) && (F(2)>((((y2-y1)/3))+y1)))
                                        if (handles.vid.FramesAcquired < 10)
                                            set(handles.t, 'String', 'Frame 4');
                                        else
                                            set(handles.t, 'String', ['Frame ' num2str(handles.v4)]);
                                        end
                                    else if ((F(1)>(((x2-x1)/3)+x1)) && (F(1)<(((x2-x1)/3*2)+x1)) && (F(2)>((((y2-y1)/3))+y1)))
                                            if (handles.vid.FramesAcquired < 10)
                                                set(handles.t, 'String', 'Frame 5');
                                            else
                                                set(handles.t, 'String', ['Frame ' num2str(handles.v5)]);
                                            end
                                        else if ((F(1)>(((x2-x1)/3*2)+x1)) && (F(2)>((((y2-y1)/3))+y1)))
                                                if (handles.vid.FramesAcquired < 10)
                                                    set(handles.t, 'String', 'Frame 6');
                                                else
                                                    set(handles.t, 'String', ['Frame ' num2str(handles.v6)]);
                                                end
                                            else if ((F(1)<(((x2-x1)/3)+x1)) && (F(2)<((((y2-y1)/3))+y1)))
                                                    if (handles.vid.FramesAcquired < 10)
                                                        set(handles.t, 'String', 'Frame 7');
                                                    else
                                                        set(handles.t, 'String', ['Frame ' num2str(handles.v7)]);
                                                    end
                                                else if ((handles.vid.FramesAcquired>7) && ((F(1)<(((x2-x1)/3*2)+x1))))
                                                        if (handles.vid.FramesAcquired < 10)
                                                            set(handles.t, 'String', 'Frame 8');
                                                        else
                                                            set(handles.t, 'String', ['Frame ' num2str(handles.v8)]);
                                                        end
                                                    else if (handles.vid.FramesAcquired>8)
                                                            if (handles.vid.FramesAcquired < 10)
                                                                set(handles.t, 'String', 'Frame 9');
                                                            else
                                                                set(handles.t, 'String', ['Frame ' num2str(handles.v9)]);
                                                            end
                                                        else
                                                            set(handles.t, 'Visible', 'off');
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end

                end
            end
        end
    else
        set(handles.t, 'Visible', 'off');
    end
end


%-------------------------------------------------------------------------
% Callback Main Menu

% Dieksekusi ketika tombol pendaftaran ditekan
function btnPendaftaranh_callback(~, ~)
    % Buat figure form pendaftaran
    delete(gcbf);
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
function pendaftaran_CloseRequestFcn(~, ~)
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