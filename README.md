Introduction
============
This project is my final project for my scholar degree.
The motivation of this project is to implement algorithm (Principal Component Analysis) for face recognition feature extraction step.
For face recognition this project used based on Euclidean Distance Principle and Neural Network Backpropagation (Use matlab toolbox)

Running the Code
================
1. First you must install MATLAB R2012a or above
2. Your computer must installed MySql server or bundle server MySql like xampp don't forget to start the mysql server as service
3. Copy "MATLAB" folder to path "C:\"
4. Configure your connector setting using administrator privilage, open tutorial file "How to Setting Up JDBC Data Sources.txt"
   or copy "classpath.txt" file into "matlabroot/MATLAB Compiler Runtime/v717/toolbox/local/classpath.txt" and "matlabroot/R2012a/toolbox/local/classpath.txt" and replace the existing file
5. Extract the database using tools like phpmyadmin, EMS software or other software.
6. Open your MATLAB software, goto folder "C:\MATLAB\TugasAkhir"
7. type "mainMenu" in matlab command window and program will be started

Starting
========
1. After program running choose "Pendaftaran" button, you must insert your data first, also your face data with camera (the program will automatically activated notebook/desktop camera, take a pic more than one with different style)
2. Choose "Database Wajah" button for training JST
3. For live recognition choose "Catat Kehadiran" button
4. Program will detect your name in live recognition

Finally
=======
Hope this source code can help to understand PCA algorithm
Regards
Frendy Priandi ^^

18-Feb-2013