classdef ImageProcessing
    methods (Static = true)
        function value = Processing(image)
            
            try
                img = rgb2gray(image);
                img = histeq(img);
                %img = imadjust(img);
                value = img;
            catch exception
                errordlg('Image gagal diproses', 'Image');
                throw(exception);
            end
            
        end
    end
end