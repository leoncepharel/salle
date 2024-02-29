/*
SQLyog Community v11.28 (64 bit)
MySQL - 10.4.28-MariaDB : Database - reservation_salle
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`reservation_salle` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `reservation_salle`;

/*Table structure for table `admi` */

DROP TABLE IF EXISTS `admi`;

CREATE TABLE `admi` (
  `id_adm` int(11) NOT NULL AUTO_INCREMENT,
  `nom_adm` varchar(30) DEFAULT NULL,
  `mdp` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_adm`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `admi` */

insert  into `admi`(`id_adm`,`nom_adm`,`mdp`) values (1,'TOTO','1234'),(2,'admin1','237');

/*Table structure for table `planing` */

DROP TABLE IF EXISTS `planing`;

CREATE TABLE `planing` (
  `id_prof` int(11) DEFAULT NULL,
  `id_sal` int(11) NOT NULL,
  `id_res` int(11) DEFAULT NULL,
  KEY `id_prof` (`id_prof`),
  KEY `id_sal` (`id_sal`),
  KEY `id_res` (`id_res`),
  CONSTRAINT `planing_ibfk_1` FOREIGN KEY (`id_prof`) REFERENCES `proff` (`id_prof`),
  CONSTRAINT `planing_ibfk_2` FOREIGN KEY (`id_sal`) REFERENCES `salle` (`id_salle`),
  CONSTRAINT `planing_ibfk_3` FOREIGN KEY (`id_res`) REFERENCES `salle_reserver` (`id_reserver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `planing` */

/*Table structure for table `proff` */

DROP TABLE IF EXISTS `proff`;

CREATE TABLE `proff` (
  `id_prof` int(11) NOT NULL AUTO_INCREMENT,
  `nom_prof` varchar(30) DEFAULT NULL,
  `matricul` varchar(30) NOT NULL,
  `specialiter` varchar(30) DEFAULT NULL,
  `mdp` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_prof`,`matricul`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `proff` */

insert  into `proff`(`id_prof`,`nom_prof`,`matricul`,`specialiter`,`mdp`) values (3,'toto','22v2343',NULL,'12'),(4,'jean','23v4444',NULL,'12'),(9,'jull','22V2341',NULL,'12'),(10,'jull','123','infirmier','123');

/*Table structure for table `proff1` */

DROP TABLE IF EXISTS `proff1`;

CREATE TABLE `proff1` (
  `id_prof1` int(11) NOT NULL DEFAULT 0,
  `nom_prof` varchar(30) DEFAULT NULL,
  `matricul` varchar(30) NOT NULL,
  `mdp` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_prof1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `proff1` */

insert  into `proff1`(`id_prof1`,`nom_prof`,`matricul`,`mdp`) values (1,'pharel','','1234'),(2,'loic','','1234'),(3,'jull','','1234'),(4,'toto','','1243');

/*Table structure for table `salle` */

DROP TABLE IF EXISTS `salle`;

CREATE TABLE `salle` (
  `id_salle` int(11) NOT NULL AUTO_INCREMENT,
  `nom_salle` varchar(30) NOT NULL,
  `capacite` int(30) DEFAULT NULL,
  `typ` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_salle`,`nom_salle`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `salle` */

insert  into `salle`(`id_salle`,`nom_salle`,`capacite`,`typ`) values (18,'S1',2,'salle d\'operation'),(19,'S2',4,'chambre'),(20,'S3',2,'salle d\'operation'),(21,'S4',2,'chambre'),(22,'S5',4,'chambre');

/*Table structure for table `salle_reserver` */

DROP TABLE IF EXISTS `salle_reserver`;

CREATE TABLE `salle_reserver` (
  `id_reserver` int(11) NOT NULL AUTO_INCREMENT,
  `id_prof` int(11) DEFAULT NULL,
  `id_salle` int(11) DEFAULT NULL,
  `planing` varchar(30) NOT NULL,
  `jour` int(11) NOT NULL,
  `mois` varchar(30) DEFAULT NULL,
  `anne` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_reserver`,`jour`,`planing`),
  KEY `id_salle` (`id_salle`),
  KEY `salle_reserver_ibfk_1` (`id_prof`),
  CONSTRAINT `salle_reserver_ibfk_1` FOREIGN KEY (`id_prof`) REFERENCES `proff1` (`id_prof1`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salle_reserver_ibfk_2` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id_salle`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `salle_reserver` */

insert  into `salle_reserver`(`id_reserver`,`id_prof`,`id_salle`,`planing`,`jour`,`mois`,`anne`) values (70,3,19,'7h30/9h30',2,'janvier',2023),(75,1,18,'07H-30/09H-30',1,'JANVIER',2024),(76,1,22,'13H-30/15H-30',4,'FEVRIER',2024);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
