# SQL Manager 2005 Lite for MySQL 3.7.6.2
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : tgsakhir


SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `tgsakhir`;

CREATE DATABASE `tgsakhir`
    CHARACTER SET 'latin1'
    COLLATE 'latin1_swedish_ci';

USE `tgsakhir`;

#
# Structure for the `mahasiswa` table : 
#

DROP TABLE IF EXISTS `mahasiswa`;

CREATE TABLE `mahasiswa` (
  `NPM` char(10) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Nama` varchar(40) NOT NULL,
  `Alamat` varchar(40) NOT NULL,
  `Telepon` varchar(40) NOT NULL,
  `Email` varchar(40) NOT NULL,
  PRIMARY KEY (`NPM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `citrapelatihan` table : 
#

DROP TABLE IF EXISTS `citrapelatihan`;

CREATE TABLE `citrapelatihan` (
  `NPM` char(10) NOT NULL,
  `FileName` varchar(50) NOT NULL,
  `Path` text NOT NULL,
  PRIMARY KEY (`NPM`,`FileName`),
  KEY `NPM` (`NPM`),
  CONSTRAINT `citrapelatihan_fk` FOREIGN KEY (`NPM`) REFERENCES `mahasiswa` (`NPM`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `kehadiran` table : 
#

DROP TABLE IF EXISTS `kehadiran`;

CREATE TABLE `kehadiran` (
  `NPM` char(10) NOT NULL,
  `kehadiran` int(11) NOT NULL,
  PRIMARY KEY (`NPM`),
  CONSTRAINT `kehadiran_fk` FOREIGN KEY (`NPM`) REFERENCES `mahasiswa` (`NPM`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `matrikspelatihan` table : 
#

DROP TABLE IF EXISTS `matrikspelatihan`;

CREATE TABLE `matrikspelatihan` (
  `NPM` char(10) NOT NULL,
  `FileName` varchar(50) NOT NULL,
  `Path` text NOT NULL,
  PRIMARY KEY (`NPM`,`FileName`),
  KEY `NPM` (`NPM`),
  CONSTRAINT `matrikspelatihan_fk` FOREIGN KEY (`NPM`) REFERENCES `mahasiswa` (`NPM`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `wajah` table : 
#

DROP TABLE IF EXISTS `wajah`;

CREATE TABLE `wajah` (
  `NPM` char(10) NOT NULL,
  `FileName` varchar(50) NOT NULL,
  `Path` text NOT NULL,
  PRIMARY KEY (`NPM`,`FileName`),
  KEY `NPM` (`NPM`),
  CONSTRAINT `wajah_fk` FOREIGN KEY (`NPM`) REFERENCES `mahasiswa` (`NPM`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

