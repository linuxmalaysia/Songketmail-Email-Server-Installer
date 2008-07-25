-- MySQL dump 10.11
--
-- Host: localhost    Database: db_nagiosql_v2
-- ------------------------------------------------------
-- Server version	5.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_checkcommand`
--

DROP TABLE IF EXISTS `tbl_checkcommand`;
CREATE TABLE `tbl_checkcommand` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `command_name` varchar(60) NOT NULL default '',
  `command_line` text NOT NULL,
  `active` enum('0','1') NOT NULL default '1',
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `access_rights` varchar(8) default NULL,
  `config_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `config_name` (`command_name`,`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_checkcommand`
--

LOCK TABLES `tbl_checkcommand` WRITE;
/*!40000 ALTER TABLE `tbl_checkcommand` DISABLE KEYS */;
INSERT INTO `tbl_checkcommand` VALUES (1,'check-fast-alive','/usr/lib/nagios/plugins/check_fping -H $HOSTADDRESS$','1','2008-07-16 05:20:56',NULL,0),(2,'check-host-alive','$USER1$/check_ping -H $HOSTADDRESS$ -w 3000.0,80% -c 5000.0,100% -p 1','1','2008-07-16 05:20:56',NULL,0),(3,'check-imap','/usr/lib/nagios/plugins/check_imap -H $HOSTADDRESS$','1','2008-07-16 05:20:56',NULL,0),(4,'check-nfs','/usr/lib/nagios/plugins/check_rpc -H $HOSTADDRESS$ -C nfs -c2,3','1','2008-07-16 05:20:56',NULL,0),(5,'check-printer-alive','/usr/lib/nagios/plugins/check_ping -H $HOSTADDRESS$ -w 5000,100% -c 5000,100% -p 1','1','2008-07-16 05:20:56',NULL,0),(6,'check-router-alive','/usr/lib/nagios/plugins/check_ping -H $HOSTADDRESS$ -w 5000,100% -c 5000,100% -p 1','1','2008-07-16 05:20:56',NULL,0),(7,'check-rpc','/usr/lib/nagios/plugins/check_rpc -H $HOSTADDRESS$ -C $ARG1$','1','2008-07-16 05:20:56',NULL,0),(8,'check-switch-alive','/usr/lib/nagios/plugins/check_ping $HOSTADDRESS$ -w 5000,100% -c 5000,100% -p 1','1','2008-07-16 05:20:56',NULL,0),(9,'check_disk','/usr/lib/nagios/plugins/check_disk -w 85% -c 95% -p $ARG1$','1','2008-07-16 05:20:56',NULL,0),(10,'check_dns','/usr/lib/nagios/plugins/check_dns -H www.yahoo.com -s $HOSTADDRESS$','1','2008-07-16 05:20:56',NULL,0),(11,'check_flexlm','/usr/lib/nagios/plugins/check_flexlm -F $ARG1$','1','2008-07-16 05:20:56',NULL,0),(12,'check_ftp','/usr/lib/nagios/plugins/check_ftp -H $HOSTADDRESS$','1','2008-07-16 05:20:56',NULL,0),(13,'check_hpjd','/usr/lib/nagios/plugins/check_hpjd -H $HOSTADDRESS$ -C public','1','2008-07-16 05:20:56',NULL,0),(14,'check_http','/usr/lib/nagios/plugins/check_http -H $HOSTADDRESS$ -I $HOSTADDRESS$','1','2008-07-16 05:20:56',NULL,0),(15,'check_http2','/usr/lib/nagios/plugins/check_http -H $ARG1$ -I $HOSTADDRESS$ -w $ARG2$ -c $ARG3$','1','2008-07-16 05:20:56',NULL,0),(16,'check_ifoperstatus_ifdescr','/usr/lib/nagios/plugins/check_ifoperstatus -H $HOSTADDRESS$ -C public -d $ARG1$','1','2008-07-16 05:20:56',NULL,0),(17,'check_ifoperstatus_ifindex','/usr/lib/nagios/plugins/check_ifoperstatus -H $HOSTADDRESS$ -C public -k $ARG1$','1','2008-07-16 05:20:56',NULL,0),(18,'check_ifstatus','/usr/lib/nagios/plugins/check_ifstatus -H $HOSTADDRESS$ -C public','1','2008-07-16 05:20:56',NULL,0),(19,'check_load','/usr/lib/nagios/plugins/check_load $ARG1$ $ARG2$ $ARG3$ $ARG4$ $ARG5$ $ARG6$','1','2008-07-16 05:20:56',NULL,0),(20,'check_local_disk','$USER1$/check_disk -w $ARG1$ -c $ARG2$ -p $ARG3$','1','2008-07-16 05:20:56',NULL,0),(21,'check_local_load','$USER1$/check_load -w $ARG1$ -c $ARG2$','1','2008-07-16 05:20:56',NULL,0),(22,'check_local_procs','$USER1$/check_procs -w $ARG1$ -c $ARG2$ -s $ARG3$','1','2008-07-16 05:20:56',NULL,0),(23,'check_local_users','$USER1$/check_users -w $ARG1$ -c $ARG2$','1','2008-07-16 05:20:56',NULL,0),(24,'check_mrtg','/usr/lib/nagios/plugins/check_mrtg $ARG1$ 10 AVG $ARG2$ $ARG3$ $ARG4$ $ARG5$ $ARG6$','1','2008-07-16 05:20:56',NULL,0),(25,'check_netware_15load','/usr/lib/nagios/plugins/check_nwstat -H $HOSTADDRESS$ -v \"LOAD15\" -w 70 -c 90','1','2008-07-16 05:20:56',NULL,0),(26,'check_netware_1load','/usr/lib/nagios/plugins/check_nwstat -H $HOSTADDRESS$ -v \"LOAD1\" -w 70 -c 90','1','2008-07-16 05:20:56',NULL,0),(27,'check_netware_5load','/usr/lib/nagios/plugins/check_nwstat -H $HOSTADDRESS$ -v \"LOAD5\" -w 70 -c 90','1','2008-07-16 05:20:56',NULL,0),(28,'check_netware_abend','/usr/lib/nagios/plugins/check_nwstat -H $HOSTADDRESS$ -v \"ABENDS\" -w 10 -c 30','1','2008-07-16 05:20:56',NULL,0),(29,'check_netware_logins','/usr/lib/nagios/plugins/check_nwstat -H $HOSTADDRESS$ -v \"LOGINS\" -w $ARG1$ -c $ARG2$','1','2008-07-16 05:20:56',NULL,0),(30,'check_nmap','/usr/lib/nagios/plugins/check_nmap -H $HOSTADDRESS$ -t 30 -p $ARG1$','1','2008-07-16 05:20:56',NULL,0),(31,'check_nmap_optional','/usr/lib/nagios/plugins/check_nmap -H $HOSTADDRESS$ -t 60 -p $ARG1$ -o $ARG2$','1','2008-07-16 05:20:56',NULL,0),(32,'check_nmap_opt_range','/usr/lib/nagios/plugins/check_nmap -H $HOSTADDRESS$ -t 60 -p $ARG1$ -o $ARG2$ -r$ARG3$','1','2008-07-16 05:20:56',NULL,0),(33,'check_nmap_range','/usr/lib/nagios/plugins/check_nmap -H $HOSTADDRESS$ -t 60 -p $ARG1$ -r $ARG2$','1','2008-07-16 05:20:56',NULL,0),(34,'check_nntp','/usr/lib/nagios/plugins/check_nntp -H $HOSTADDRESS$','1','2008-07-16 05:20:56',NULL,0),(35,'check_ntp','/usr/lib/nagios/plugins/check_ntp -H $HOSTADDRESS$','1','2008-07-16 05:20:56',NULL,0),(36,'check_ntp_ntpq','/usr/lib/nagios/plugins/check_ntp -H $HOSTADDRESS$ -j 10 -k 15','1','2008-07-16 05:20:56',NULL,0),(37,'check_nwstat_conns','/usr/lib/nagios/plugins/check_nwstat -H $HOSTADDRESS$ -v CONNS -w $ARG1$ -c $ARG2$','1','2008-07-16 05:20:56',NULL,0),(38,'check_nwstat_csprocs','/usr/lib/nagios/plugins/check_nwstat -H $HOSTADDRESS$ -v CSPROCS -w $ARG1$ -c $ARG2$','1','2008-07-16 05:20:56',NULL,0),(39,'check_nwstat_dsdb','/usr/lib/nagios/plugins/check_nwstat -H $HOSTADDRESS$ -v DSDB','1','2008-07-16 05:20:56',NULL,0),(40,'check_nwstat_ltch','/usr/lib/nagios/plugins/check_nwstat -H $HOSTADDRESS$ -v LTCH -w $ARG1$ -c $ARG2$','1','2008-07-16 05:20:56',NULL,0),(41,'check_nwstat_puprb','/usr/lib/nagios/plugins/check_nwstat -H $HOSTADDRESS$ -v PUPRB -w $ARG1$ -c $ARG2$','1','2008-07-16 05:20:56',NULL,0),(42,'check_nwstat_vol_k','/usr/lib/nagios/plugins/check_nwstat -H $HOSTADDRESS$ -v VKF$ARG1$ -w $ARG2$ -c $ARG3$','1','2008-07-16 05:20:56',NULL,0),(43,'check_nwstat_vol_p','/usr/lib/nagios/plugins/check_nwstat -H $HOSTADDRESS$ -v VPF$ARG1$ -w $ARG2$ -c $ARG3$','1','2008-07-16 05:20:56',NULL,0),(44,'check_pgsql','/usr/lib/nagios/plugins/check_pgsql -H $HOSTADDRESS$','1','2008-07-16 05:20:56',NULL,0),(45,'check_ping','/usr/lib/nagios/plugins/check_ping -H $HOSTADDRESS$ -w 10:20% -c 60:100%','1','2008-07-16 05:20:56',NULL,0),(46,'check_pop','/usr/lib/nagios/plugins/check_pop -H $HOSTADDRESS$','1','2008-07-16 05:20:56',NULL,0),(47,'check_procs','/usr/lib/nagios/plugins/check_procs -w $ARG1$ -c $ARG2$','1','2008-07-16 05:20:56',NULL,0),(48,'check_procs_httpd','/usr/lib/nagios/plugins/check_procs -w 5:$ARG1$ -c 1:$ARG2$ -C httpd','1','2008-07-16 05:20:56',NULL,0),(49,'check_procs_vsz','/usr/lib/nagios/plugins/check_procs -w 8096 -c 16182 -C httpd --metric VSZ','1','2008-07-16 05:20:56',NULL,0),(50,'check_procs_zombie','/usr/lib/nagios/plugins/check_procs -w $ARG1$ -c $ARG2$ -s Z','1','2008-07-16 05:20:56',NULL,0),(51,'check_quake','/usr/lib/nagios/plugins/check_game qs $HOSTADDRESS$','1','2008-07-16 05:20:56',NULL,0),(52,'check_radius','/usr/lib/nagios/plugins/check_radius $ARG1$ $ARG2$ $HOSTADDRESS$ 1812 $ARG3$','1','2008-07-16 05:20:56',NULL,0),(53,'check_real','/usr/lib/nagios/plugins/check_real $HOSTADDRESS$ -p $ARG1$ -wt $ARG2$ -ct $ARG3$ -to 5','1','2008-07-16 05:20:56',NULL,0),(54,'check_real_url','/usr/lib/nagios/plugins/check_real $HOSTADDRESS$ -p $ARG1$ -wt $ARG2$ -ct $ARG3$ -to 5 -u $ARG4$','1','2008-07-16 05:20:56',NULL,0),(55,'check_smtp','/usr/lib/nagios/plugins/check_smtp -H $HOSTADDRESS$','1','2008-07-16 05:20:56',NULL,0),(56,'check_snmp_bgpstate','/usr/lib/nagios/plugins/check_bgpstate -H $HOSTADDRESS$ -C public','1','2008-07-16 05:20:56',NULL,0),(57,'check_squid','/usr/lib/nagios/plugins/check_http -H $HOSTADDRESS$ -p $ARG1$ -u $ARG2$ -e \'HTTP/1.0 200 OK\'','1','2008-07-16 05:20:56',NULL,0),(58,'check_tcp','/usr/lib/nagios/plugins/check_tcp -H $HOSTADDRESS$ -p $ARG1$','1','2008-07-16 05:20:56',NULL,0),(59,'check_telnet','/usr/lib/nagios/plugins/check_tcp -H $HOSTADDRESS$ -p 23','1','2008-07-16 05:20:56',NULL,0),(60,'check_udp','/usr/lib/nagios/plugins/check_udp -H $HOSTADDRESS$ -p $ARG1$','1','2008-07-16 05:20:56',NULL,0),(61,'check_unreal','/usr/lib/nagios/plugins/check_game uns $HOSTADDRESS$ -p $ARG1$ -pf 8','1','2008-07-16 05:20:56',NULL,0),(62,'check_ups','/usr/lib/nagios/plugins/check_ups -H $HOSTADDRESS$ -u $ARG1$','1','2008-07-16 05:20:56',NULL,0),(63,'check_users','/usr/lib/nagios/plugins/check_users -w $ARG1$ -c $ARG2$','1','2008-07-16 05:20:56',NULL,0),(64,'process-host-perfdata','/usr/bin/printf \"%b\" \"$LASTHOSTCHECK$t$HOSTNAME$t$HOSTSTATE$t$HOSTATTEMPT$t$HOSTSTATETYPE$t$HOSTEXECUTIONTIME$t$HOSTOUTPUT$t$HOSTPERFDATA$n\" >> /var/log/nagios/host-perfdata.out','1','2008-07-16 05:20:56',NULL,0),(65,'process-service-perfdata','/usr/bin/printf \"%b\" \"$LASTSERVICECHECK$t$HOSTNAME$t$SERVICEDESC$t$SERVICESTATE$t$SERVICEATTEMPT$t$SERVICESTATETYPE$t$SERVICEEXECUTIONTIME$t$SERVICELATENCY$t$SERVICEOUTPUT$t$SERVICEPERFDATA$n\" >> /var/log/nagios/service-perfdata.out','1','2008-07-16 05:20:56',NULL,0),(66,'snmp_cpustats','/usr/lib/nagios/plugins/check_snmp -H $HOSTADDRESS$ -C $ARG1$ -o .1.3.6.1.4.1.2021.11.9.0,.1.3.6.1.4.1.2021.11.10.0,.1.3.6.1.4.1.2021.11.11.0 -l \'CPU usage (user system idle)\' -u \'%\'','1','2008-07-16 05:20:56',NULL,0),(67,'snmp_disk','/usr/lib/nagios/plugins/check_snmp -H $HOSTADDRESS$ -C $ARG1$ -o 1.3.6.1.4.1.2021.9.1.7.$ARG1$,1.3.6.1.4.1.2021.9.1.9.$ARG1$ -w $ARG2$:,:$ARG3$ -c $ARG4$:,:$ARG5$ -u \'kB free (\',\'% used)\' -l \'disk space\'','1','2008-07-16 05:20:56',NULL,0),(68,'snmp_disk2','/usr/lib/nagios/plugins/check_snmp -H $HOSTADDRESS$ -C $ARG1$ -o host.hrStorage.hrStorageTable.hrStorageEntry.hrStorageUsed.$ARG2$ -w $ARG3$ -c $ARG4$','1','2008-07-16 05:20:56',NULL,0),(69,'snmp_load','/usr/lib/nagios/plugins/check_snmp -H $HOSTADDRESS$ -C $ARG1$ -o .1.3.6.1.4.1.2021.10.1.5.1,.1.3.6.1.4.1.2021.10.1.5.2,.1.3.6.1.4.1.2021.10.1.5.3 -w :$ARG2$,:$ARG3$,:$ARG4$ -w :$ARG5$,:$ARG6$,:$ARG7$ -l load','1','2008-07-16 05:20:56',NULL,0),(70,'snmp_mem','/usr/lib/nagios/plugins/check_snmp -H $HOSTADDRESS$ -C $ARG1$ -o .1.3.6.1.4.1.2021.4.6.0,.1.3.6.1.4.1.2021.4.5.0 -w $ARG2$: -c $ARG3$:','1','2008-07-16 05:20:56',NULL,0),(71,'snmp_mem2','/usr/lib/nagios/plugins/check_snmp -H $HOSTADDRESS$ -C $ARG1$ -o host.hrStorage.hrStorageTable.hrStorageEntry.hrStorageUsed.101,host.hrStorage.hrStorageTable.hrStorageEntry.hrStorageSize.101 -w $ARG2$ -c $ARG3$','1','2008-07-16 05:20:56',NULL,0),(72,'snmp_mem3','/usr/lib/nagios/plugins/check_snmp -H $HOSTADDRESS$ -C $ARG1$ -o host.hrStorage.hrStorageTable.hrStorageEntry.hrStorageUsed.101,host.hrStorage.hrStorageTable.hrStorageEntry.hrStorageSize.101 -w $ARG2$ -c $ARG3$','1','2008-07-16 05:20:56',NULL,0),(73,'snmp_procname','/usr/lib/nagios/plugins/check_snmp -H $HOSTADDRESS$ -C $ARG1$ -o 1.3.6.1.4.1.2021.2.1.5.$ARG2$ -w $ARG3$:$ARG4$ -c $ARG5$:$ARG6$','1','2008-07-16 05:20:56',NULL,0),(74,'snmp_procs','/usr/lib/nagios/plugins/check_snmp -H $HOSTADDRESS$ -C $ARG1$ -o host.hrSystem.hrSystemProcesses -w :$ARG2$ -c :$ARG3$ -l processes','1','2008-07-16 05:20:56',NULL,0),(75,'snmp_swap','/usr/lib/nagios/plugins/check_snmp -H $HOSTADDRESS$ -C $ARG1$ -o .1.3.6.1.4.1.2021.4.4.0,.1.3.6.1.4.1.2021.4.3.0 -w $ARG2$: -c $ARG3$:','1','2008-07-16 05:20:56',NULL,0),(76,'snmp_swap2','/usr/lib/nagios/plugins/check_snmp -H $HOSTADDRESS$ -C $ARG1$ -o host.hrStorage.hrStorageTable.hrStorageEntry.hrStorageUsed.102,host.hrStorage.hrStorageTable.hrStorageEntry.hrStorageSize.102 -w $ARG2$ -c $ARG3$','1','2008-07-16 05:20:56',NULL,0),(77,'snmp_swap3','/usr/lib/nagios/plugins/check_snmp -H $HOSTADDRESS$ -C $ARG1$ -o host.hrStorage.hrStorageTable.hrStorageEntry.hrStorageUsed.102,host.hrStorage.hrStorageTable.hrStorageEntry.hrStorageSize.102 -w $ARG2$ -c $ARG3$','1','2008-07-16 05:20:56',NULL,0),(78,'snmp_tcpopen','/usr/lib/nagios/plugins/check_snmp -H $HOSTADDRESS$ -C $ARG1$ -o tcp.tcpCurrEstab.0 -w $ARG2$ -c $ARG3$','1','2008-07-16 05:20:56',NULL,0),(79,'snmp_tcpstats','/usr/lib/nagios/plugins/check_snmp -H $HOSTADDRESS$ -C $ARG1$ -o tcp.tcpActiveOpens.0,tcp.tcpPassiveOpens.0,tcp.tcpInSegs.0,tcp.tcpOutSegs.0,tcp.tcpRetransSegs.0 -l \'TCP stats\'','1','2008-07-16 05:20:56',NULL,0),(80,'snmp_users','/usr/lib/nagios/plugins/check_snmp -H $HOSTADDRESS$ -C $ARG1$ -o host.hrSystem.hrSystemNumUsers -w :$ARG2$ -c :$ARG3$ -l users','1','2008-07-16 05:20:56',NULL,0),(81,'ssh_disk','/usr/lib/nagios/plugins/check_by_ssh -H $HOSTADDRESS$ -C \'/usr/lib/nagios/plugins/check_disk -w 85% -c 95% -p $ARG1$\'','1','2008-07-16 05:20:56',NULL,0),(82,'traffic_average','/usr/lib/nagios/plugins/check_mrtgtraf $ARG1$ 10 AVG $ARG2$ $ARG3$ $ARG4$ $ARG5$','1','2008-07-16 05:20:56',NULL,0),(83,'check_dns_opendns','/usr/lib/nagios/plugins/check_dns -H $HOSTNAME$ -s 208.67.222.222','1','2008-07-16 06:05:59',NULL,0);
/*!40000 ALTER TABLE `tbl_checkcommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contact`
--

DROP TABLE IF EXISTS `tbl_contact`;
CREATE TABLE `tbl_contact` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `contact_name` varchar(60) NOT NULL default '',
  `alias` varchar(120) NOT NULL default '',
  `contactgroups` int(10) unsigned NOT NULL default '0',
  `host_notification_period` int(10) unsigned NOT NULL default '0',
  `service_notification_period` int(10) unsigned NOT NULL default '0',
  `host_notification_options` varchar(10) NOT NULL default '',
  `service_notification_options` varchar(10) NOT NULL default '',
  `host_notification_commands` int(10) unsigned NOT NULL default '0',
  `service_notification_commands` int(10) unsigned NOT NULL default '0',
  `email` varchar(60) default NULL,
  `pager` varchar(60) default NULL,
  `address1` varchar(60) default NULL,
  `address2` varchar(60) default NULL,
  `address3` varchar(60) default NULL,
  `address4` varchar(60) default NULL,
  `address5` varchar(60) default NULL,
  `active` enum('0','1') NOT NULL default '1',
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `access_rights` varchar(8) default NULL,
  `config_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `config_name` (`contact_name`,`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contact`
--

LOCK TABLES `tbl_contact` WRITE;
/*!40000 ALTER TABLE `tbl_contact` DISABLE KEYS */;
INSERT INTO `tbl_contact` VALUES (1,'nagios-admin','Nagios Admin',0,1,1,'d,r','w,u,c,r',1,1,'nagios-admin@localhost','','','','','','','1','2008-07-16 05:34:00',NULL,0),(2,'webmaster','webmaster',1,1,1,'d,u,r','w,u,c,r',1,1,'root@localhost','','','','','','','1','2008-07-16 06:01:45',NULL,0);
/*!40000 ALTER TABLE `tbl_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contactgroup`
--

DROP TABLE IF EXISTS `tbl_contactgroup`;
CREATE TABLE `tbl_contactgroup` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `contactgroup_name` varchar(60) NOT NULL default '',
  `alias` varchar(120) NOT NULL default '',
  `members` int(10) unsigned NOT NULL default '0',
  `active` enum('0','1') NOT NULL default '1',
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `access_rights` varchar(8) default NULL,
  `config_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `config_name` (`contactgroup_name`,`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contactgroup`
--

LOCK TABLES `tbl_contactgroup` WRITE;
/*!40000 ALTER TABLE `tbl_contactgroup` DISABLE KEYS */;
INSERT INTO `tbl_contactgroup` VALUES (1,'admins','Nagios Administrators',1,'1','2008-07-16 05:34:21',NULL,0),(3,'webmasters','Webmasters',1,'1','2008-07-16 06:01:38',NULL,0);
/*!40000 ALTER TABLE `tbl_contactgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_host`
--

DROP TABLE IF EXISTS `tbl_host`;
CREATE TABLE `tbl_host` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `host_name` varchar(255) NOT NULL default '',
  `alias` varchar(120) NOT NULL default '',
  `address` varchar(255) NOT NULL default '',
  `parents` int(10) unsigned NOT NULL default '0',
  `hostgroups` int(10) unsigned NOT NULL default '0',
  `check_command` text NOT NULL,
  `max_check_attempts` smallint(5) unsigned NOT NULL default '0',
  `check_interval` smallint(5) unsigned default NULL,
  `active_checks_enabled` enum('0','1') NOT NULL default '1',
  `passive_checks_enabled` enum('0','1') NOT NULL default '1',
  `check_period` int(10) unsigned NOT NULL default '0',
  `obsess_over_host` enum('0','1') NOT NULL default '1',
  `check_freshness` enum('0','1') NOT NULL default '1',
  `freshness_threshold` mediumint(8) unsigned default NULL,
  `event_handler` int(10) unsigned NOT NULL default '0',
  `event_handler_enabled` enum('0','1') NOT NULL default '1',
  `low_flap_threshold` smallint(5) unsigned default NULL,
  `high_flap_threshold` smallint(5) unsigned default NULL,
  `flap_detection_enabled` enum('0','1') NOT NULL default '1',
  `failure_prediction_enabled` enum('0','1') NOT NULL default '1',
  `process_perf_data` enum('0','1') NOT NULL default '0',
  `retain_status_information` enum('0','1') NOT NULL default '1',
  `retain_nonstatus_information` enum('0','1') NOT NULL default '1',
  `contact_groups` int(10) unsigned NOT NULL default '0',
  `notification_interval` mediumint(9) NOT NULL default '1',
  `notification_period` int(10) unsigned NOT NULL default '0',
  `notification_options` varchar(10) NOT NULL default '',
  `notifications_enabled` enum('0','1') NOT NULL default '1',
  `stalking_options` varchar(10) default NULL,
  `active` enum('0','1') NOT NULL default '1',
  `template` int(10) unsigned NOT NULL default '0',
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `access_rights` varchar(8) default NULL,
  `config_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `config_name` (`host_name`,`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_host`
--

LOCK TABLES `tbl_host` WRITE;
/*!40000 ALTER TABLE `tbl_host` DISABLE KEYS */;
INSERT INTO `tbl_host` VALUES (1,'localhost','localhost','127.0.0.1',0,0,'2',5,1,'1','1',1,'1','1',NULL,1,'1',NULL,NULL,'1','1','1','1','1',1,60,1,'d,u,r,f','1','o,d,u','1',0,'2008-07-16 05:29:30',NULL,0),(2,'www.oscc.org.my','OSCC Web Site','211.24.237.20',0,1,'14',15,5,'1','1',1,'1','1',NULL,0,'1',NULL,NULL,'1','1','1','1','1',1,60,1,'d,u,r,f','1','','1',0,'2008-07-16 06:02:26',NULL,0),(3,'www.mampu.gov.my','www.mampu.gov.my','202.75.7.80',0,0,'14',5,5,'1','1',1,'1','1',NULL,0,'1',NULL,NULL,'1','1','1','1','1',1,60,1,'d,u,r,f','1','','1',0,'2008-07-16 08:02:07',NULL,0);
/*!40000 ALTER TABLE `tbl_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_hostdependency`
--

DROP TABLE IF EXISTS `tbl_hostdependency`;
CREATE TABLE `tbl_hostdependency` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `config_name` varchar(60) NOT NULL default '',
  `dependent_host_name` int(10) unsigned NOT NULL default '0',
  `dependent_hostgroup_name` int(10) unsigned NOT NULL default '0',
  `host_name` int(10) unsigned NOT NULL default '0',
  `hostgroup_name` int(10) unsigned NOT NULL default '0',
  `inherits_parent` enum('0','1') NOT NULL default '0',
  `execution_failure_criteria` varchar(10) default NULL,
  `notification_failure_criteria` varchar(10) default NULL,
  `active` enum('0','1') NOT NULL default '1',
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `access_rights` varchar(8) default NULL,
  `config_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `config_name` (`config_name`,`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_hostdependency`
--

LOCK TABLES `tbl_hostdependency` WRITE;
/*!40000 ALTER TABLE `tbl_hostdependency` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_hostdependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_hostescalation`
--

DROP TABLE IF EXISTS `tbl_hostescalation`;
CREATE TABLE `tbl_hostescalation` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `config_name` varchar(60) NOT NULL default '',
  `host_name` int(10) unsigned NOT NULL default '0',
  `hostgroup_name` int(10) unsigned NOT NULL default '0',
  `contact_groups` int(10) unsigned NOT NULL default '0',
  `first_notification` smallint(5) unsigned NOT NULL default '0',
  `last_notification` smallint(5) unsigned NOT NULL default '0',
  `notification_interval` smallint(5) unsigned NOT NULL default '0',
  `escalation_period` int(10) unsigned NOT NULL default '0',
  `escalation_options` varchar(10) default NULL,
  `active` enum('0','1') NOT NULL default '1',
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `access_rights` varchar(8) default NULL,
  `config_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `config_name` (`config_name`,`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_hostescalation`
--

LOCK TABLES `tbl_hostescalation` WRITE;
/*!40000 ALTER TABLE `tbl_hostescalation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_hostescalation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_hostextinfo`
--

DROP TABLE IF EXISTS `tbl_hostextinfo`;
CREATE TABLE `tbl_hostextinfo` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `host_name` int(10) unsigned default '0',
  `notes` tinytext,
  `notes_url` tinytext,
  `action_url` tinytext,
  `statistik_url` tinytext,
  `icon_image` varchar(60) default NULL,
  `icon_image_alt` varchar(60) default NULL,
  `vrml_image` varchar(60) default NULL,
  `statusmap_image` varchar(60) default NULL,
  `2d_coords` varchar(40) default NULL,
  `3d_coords` varchar(60) default NULL,
  `active` enum('0','1') NOT NULL default '1',
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `access_rights` varchar(8) default NULL,
  `config_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `config_name` (`host_name`,`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_hostextinfo`
--

LOCK TABLES `tbl_hostextinfo` WRITE;
/*!40000 ALTER TABLE `tbl_hostextinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_hostextinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_hostgroup`
--

DROP TABLE IF EXISTS `tbl_hostgroup`;
CREATE TABLE `tbl_hostgroup` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `hostgroup_name` varchar(60) NOT NULL default '',
  `alias` varchar(120) NOT NULL default '',
  `members` int(10) unsigned NOT NULL default '0',
  `active` enum('0','1') NOT NULL default '1',
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `access_rights` varchar(8) default NULL,
  `config_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `config_name` (`hostgroup_name`,`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_hostgroup`
--

LOCK TABLES `tbl_hostgroup` WRITE;
/*!40000 ALTER TABLE `tbl_hostgroup` DISABLE KEYS */;
INSERT INTO `tbl_hostgroup` VALUES (1,'test','Test Servers',1,'1','2008-07-16 05:29:58',NULL,0),(2,'Web','Web Server OSCC MAMPU Group',1,'1','2008-07-16 08:03:16',NULL,0);
/*!40000 ALTER TABLE `tbl_hostgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_hosttemplate`
--

DROP TABLE IF EXISTS `tbl_hosttemplate`;
CREATE TABLE `tbl_hosttemplate` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `template_name` varchar(255) NOT NULL default '',
  `alias` varchar(120) NOT NULL default '',
  `check_command` text NOT NULL,
  `max_check_attempts` smallint(5) unsigned NOT NULL default '0',
  `check_interval` smallint(5) unsigned default NULL,
  `active_checks_enabled` enum('0','1') NOT NULL default '1',
  `passive_checks_enabled` enum('0','1') NOT NULL default '1',
  `check_period` int(10) unsigned NOT NULL default '0',
  `obsess_over_host` enum('0','1') NOT NULL default '1',
  `check_freshness` enum('0','1') NOT NULL default '1',
  `freshness_threshold` mediumint(8) unsigned default NULL,
  `event_handler` int(10) unsigned NOT NULL default '0',
  `event_handler_enabled` enum('0','1') NOT NULL default '1',
  `low_flap_threshold` smallint(5) unsigned default NULL,
  `high_flap_threshold` smallint(5) unsigned default NULL,
  `flap_detection_enabled` enum('0','1') NOT NULL default '1',
  `process_perf_data` enum('0','1') NOT NULL default '0',
  `retain_status_information` enum('0','1') NOT NULL default '1',
  `retain_nonstatus_information` enum('0','1') NOT NULL default '1',
  `contact_groups` int(10) unsigned NOT NULL default '0',
  `notification_interval` mediumint(9) NOT NULL default '1',
  `notification_period` int(10) unsigned NOT NULL default '0',
  `notification_options` varchar(10) NOT NULL default '',
  `notifications_enabled` enum('0','1') NOT NULL default '1',
  `stalking_options` varchar(10) default NULL,
  `active` enum('0','1') NOT NULL default '1',
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `access_rights` varchar(8) default NULL,
  `config_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `config_name` (`template_name`,`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_hosttemplate`
--

LOCK TABLES `tbl_hosttemplate` WRITE;
/*!40000 ALTER TABLE `tbl_hosttemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_hosttemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_language`
--

DROP TABLE IF EXISTS `tbl_language`;
CREATE TABLE `tbl_language` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `version` varchar(5) default NULL,
  `category` varchar(50) NOT NULL default '',
  `keyword` varchar(50) NOT NULL default '',
  `lang_de` text,
  `lang_en` text,
  `lang_xy` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `category` (`category`,`keyword`)
) ENGINE=MyISAM AUTO_INCREMENT=455 DEFAULT CHARSET=latin1 PACK_KEYS=0;

--
-- Dumping data for table `tbl_language`
--

LOCK TABLES `tbl_language` WRITE;
/*!40000 ALTER TABLE `tbl_language` DISABLE KEYS */;
INSERT INTO `tbl_language` VALUES (1,'1.00','menu','item_adm1','Hauptseite','Main page',NULL),(2,'1.00','menu','item_adm2','&Uuml;berwachung','Supervision',NULL),(3,'2.00','menu','item_adm3','Alarmierung','Alarming',NULL),(4,'1.00','menu','item_adm4','Befehle','Commands',NULL),(5,'1.00','menu','item_adm5','Spezialit&auml;ten','Specialties',NULL),(6,'1.00','menu','item_adm6','Werkzeuge','Tools',NULL),(7,'1.00','menu','item_adm7','Verwaltung','Administration',NULL),(8,'1.00','menu','item_admsub1','Hosts','Hosts',NULL),(9,'1.00','menu','item_admsub2','Zeitperioden','Time periods',NULL),(10,'1.00','menu','item_admsub3','Spezialbefehle','Misc commands',NULL),(11,'1.00','menu','item_admsub4','Pr&uuml;fbefehle','Check commands',NULL),(12,'1.00','menu','item_admsub5','Kontaktdaten','Contact data',NULL),(13,'1.00','menu','item_admsub6','Kontaktgruppen','Contact groups',NULL),(14,'1.00','menu','item_admsub7','Services','Services',NULL),(15,'1.00','menu','item_admsub8','Hostgruppen','Host groups',NULL),(16,'1.00','menu','item_admsub9','Servicegruppen','Service groups',NULL),(17,'1.00','menu','item_admsub10','Serv. Abh&auml;ngigk.','Serv. dependency',NULL),(18,'1.00','menu','item_admsub11','Serv. Eskalation','Serv. escalation',NULL),(19,'1.00','menu','item_admsub12','Host Abh&auml;ngigk.','Host dependency',NULL),(20,'1.00','menu','item_admsub13','Host Eskalation','Host escalation',NULL),(21,'1.00','menu','item_admsub14','Host AddOn','Host ext. info',NULL),(22,'1.00','menu','item_admsub15','Service AddOn','Serv. ext. info',NULL),(23,'1.00','menu','item_admsub16','Datenimport','Data import',NULL),(24,'1.00','menu','item_admsub17','Dateien l&ouml;schen','Delete files',NULL),(25,'1.00','menu','item_admsub18','Benutzer','User admin',NULL),(26,'1.00','menu','item_admsub19','Nagios steuern','Nagios control',NULL),(27,'1.00','menu','item_admsub20','Neues Passwort','New password',NULL),(28,'1.00','menu','item_admsub21','Logbuch','Logbook',NULL),(29,'1.00','menu','item_admsub22','Nagios Config','Nagios config',NULL),(30,'1.00','menu','item_admsub23','CGI Config','CGI config',NULL),(31,'1.00','menu','info10','Service Abh&auml;ngigkeiten','Service dependencies',NULL),(32,'1.00','menu','info11','Service Eskalationen','Service escalations',NULL),(33,'1.00','menu','info12','Host Abh&auml;ngigkeiten','Host dependencies',NULL),(34,'1.00','menu','info13','Host Eskalationen','Host escalations',NULL),(35,'1.00','menu','info14','Host Zusatzinformationen','Extended host info',NULL),(36,'1.00','menu','info15','Service Zusatzinformationen','Extended service info',NULL),(37,'1.00','menu','disable','Menu ausblenden','Hide menu',NULL),(38,'1.00','menu','enable','Menu einblenden','Show menu',NULL),(39,'1.00','common','yes_ok','Ja','Yes',NULL),(40,'1.00','common','no_nak','Nein','No',NULL),(41,'1.00','common','filedate','Letzte &Auml;nderung an der Konfigurationsdatei:','Last change of the configuration file:',NULL),(42,'1.00','common','older','Achtung: Konfigurationsdatei ist veraltet!','Warning: configuration file is out of date!',NULL),(43,'1.00','position','admin','Administration','Administration',NULL),(44,'2.00','title','main','NagiosQL','NagiosQL',NULL),(45,'1.00','title','login','Willkommen bei','Welcome to',NULL),(46,'2.00','title','adminmain','NagiosQL Administration','NagiosQL Administration',NULL),(47,'1.00','title','monitor','&Uuml;berwachung','Monitoring',NULL),(48,'1.00','title','alarming','Alarmierung','Alarming',NULL),(49,'1.00','title','tools','Verschiedene Werkzeuge','Different tools',NULL),(50,'1.00','title','command','Befehlsdaten','Check commands',NULL),(51,'1.00','title','special','Spezialdaten','Misc commands',NULL),(52,'1.00','title','host','Hosts definieren (hosts.cfg)','Define hosts (hosts.cfg)',NULL),(53,'1.00','title','service','Services definieren (services.cfg)','Define services (services.cfg)',NULL),(54,'1.00','title','timeperiod','Zeitperioden definieren (timeperiods.cfg)','Define time periods (timeperiods.cfg)',NULL),(55,'1.00','title','misccommands','Spezialefehle definieren (misccommands.cfg)','Define misc commands (misccommands.cfg)',NULL),(56,'1.00','title','checkcommands','Pr&uuml;fbefehle definieren (checkcommands.cfg)','Define check commands (checkcommands.cfg)',NULL),(57,'1.00','title','contacts','Kontakte definieren (contacts.cfg)','Define contacts (contacts.cfg)',NULL),(58,'1.00','title','contactgroups','Kontaktgruppen definieren (contactgroups.cfg)','Define contact groups (contactgroups.cfg)',NULL),(59,'1.00','title','hostgroups','Hostgruppen definieren (hostgroups.cfg)','Define host groups (hostgroups.cfg)',NULL),(60,'1.00','title','servicegroups','Servicegruppen definieren (servicegroups.cfg)','Define service groups (servicegroups.cfg)',NULL),(61,'1.00','title','servicedepend','Serviceabh&auml;ngigkeiten definieren (servicedependencies.cfg)','Define service dependencies (servicedependencies.cfg)',NULL),(62,'1.00','title','serviceescal','Service Eskalationen definieren (serviceescalations.cfg)','Define service escalations (serviceescalations.cfg)',NULL),(63,'1.00','title','hostdepend','Hostabh&auml;ngigkeiten definieren (hostdependencies.cfg)','Define host dependencies (hostdependencies.cfg)',NULL),(64,'1.00','title','hostescal','Host Eskalationen definieren (hostescalations.cfg)','Define host escalations (hostescalations.cfg)',NULL),(65,'1.00','title','hostextinfo','Host Zusatzinformationen definieren (hostextinfo.cfg)','Define extended host informations (hostextinfo.cfg)',NULL),(66,'1.00','title','serviceextinfo','Service Zusatzinformationen definieren (serviceextinfo.cfg)','Define extended service informations (serviceextinfo.cfg)',NULL),(67,'1.00','title','import','Datenimport','Data import',NULL),(68,'1.00','title','delbackup','Backupdateien l&ouml;schen','Delete backup files',NULL),(69,'1.00','title','verifyconfig','Geschriebene Konfigurationsdateien pr&uuml;fen','Check written configuration files',NULL),(70,'1.00','title','useradmin','Benutzeradministration','User administration',NULL),(71,'1.00','title','logbook','Logbuch einsehen','View logbook',NULL),(72,'1.00','title','administration','Verwaltungsfunktionen','Administration functions',NULL),(73,'1.00','title','nagiosconfig','Nagios Hauptkonfigurationsdatei','Nagios main configuration file',NULL),(74,'1.00','title','cgiconfig','CGI Konfigurationsdatei','CGI configuration file',NULL),(75,'1.00','user','username','Benutzername','Username',NULL),(76,'1.00','user','alias','Beschreibung','Description',NULL),(77,'1.00','user','password','Passwort','Password',NULL),(78,'1.00','user','password_again','Passwort best&auml;tigen','Confirm password',NULL),(79,'1.00','user','passwordwrong','Passwort zu kurz oder Passwortfelder ungleich!','Password too short or password fields unequally!',NULL),(80,'1.00','user','admin1','Nagios Konfiguration','Nagios Configuration',NULL),(81,'1.00','user','admin2','Import/Daemonsteuerung','Import/Daemon control',NULL),(82,'1.00','user','admin3','Benutzeradministration','User administration',NULL),(83,'1.00','user','login','Login','Login',NULL),(84,'1.00','user','loginfail','Login fehlgeschlagen!','Login failed!',NULL),(85,'1.00','user','loggedin','Eingeloggt:','Logged in:',NULL),(86,'1.00','user','errorsite','Fehlerseite','Error page',NULL),(87,'1.00','user','loginsite','Zur&uuml;ck zur Hauptseite','Back to the main page',NULL),(88,'1.00','user','norights','Sie besitzen keine Berechtigung f&uuml;r diese Seite!','You are not authorized to view this page!',NULL),(89,'1.00','user','passwdold','Altes Passwort','Old password',NULL),(90,'1.00','user','passwdnew','Neues Passwort','New password',NULL),(91,'1.00','user','pwchange','Passwort &auml;ndern','Change password',NULL),(92,'1.00','user','oldpwfailed','Altes Passwort falsch','Old password is wrong',NULL),(93,'1.00','admintable','tsname','Zeitperiode','Time period',NULL),(94,'1.00','admintable','friendly','Beschreibung','Description',NULL),(95,'1.00','admintable','active','Aktiv','Active',NULL),(96,'1.00','admintable','function','Funktion','Function',NULL),(97,'1.00','admintable','nodata','Keine Daten','No data',NULL),(98,'1.00','admintable','Monday','Montag','Monday',NULL),(99,'1.00','admintable','Tuesday','Dienstag','Thuesday',NULL),(100,'1.00','admintable','Wednesday','Mittwoch','Wednesday',NULL),(101,'1.00','admintable','Thursday','Donnerstag','Thursday',NULL),(102,'1.00','admintable','Friday','Freitag','Friday',NULL),(103,'1.00','admintable','Saturday','Samstag','Saturday',NULL),(104,'1.00','admintable','Sunday','Sonntag','Sunday',NULL),(105,'1.00','admintable','save','Speichern','Save',NULL),(106,'1.00','admintable','add','Hinzuf&uuml;gen','Add',NULL),(107,'1.00','admintable','abort','Abbrechen','Abort',NULL),(108,'1.00','admintable','marked','Markierte','Marked',NULL),(109,'1.00','admintable','write_conf','Konfigdatei schreiben','Write config file',NULL),(110,'1.00','admintable','write_conf_all','Alle Konfigdateien neu schreiben','Write all config files',NULL),(111,'1.00','admintable','delete','L&ouml;schen','Delete',NULL),(112,'1.00','admintable','duplicate','Kopieren','Copy',NULL),(113,'1.00','admintable','modify','Modifizieren','Modify',NULL),(114,'1.00','admintable','doit','Ausf&uuml;hren','Do it',NULL),(115,'1.00','admintable','import','Importieren','Import',NULL),(116,'1.00','admintable','importfile','Importdatei','Import file',NULL),(117,'1.00','admintable','overwrite','Eintr&auml;ge &uuml;berschreiben','Overwrite database',NULL),(118,'1.00','admintable','command','Befehlsname','Command name',NULL),(119,'1.00','admintable','commandline','Befehlszeile','Command line',NULL),(120,'1.00','admintable','contactgroup','Kontaktgruppe','Contact group',NULL),(121,'1.00','admintable','ctrlinfo','(F&uuml;r Mehrfachauswahl<br>CTRL dr&uuml;cken)','(Hold CTRL to select<br>more than one)',NULL),(122,'1.00','admintable','hostperiod','Zeitperiode Hosts','Time period hosts',NULL),(123,'1.00','admintable','serviceperiod','Zeitperiode Services','Time period services',NULL),(124,'1.00','admintable','hostoption','Hostoptionen','Host options',NULL),(125,'1.00','admintable','serviceoption','Serviceoptionen','Service options',NULL),(126,'1.00','admintable','hostcommand','Host Befehl','Host command',NULL),(127,'1.00','admintable','servicecommand','Service Befehl','Service command',NULL),(128,'1.00','admintable','email','E-Mail Adresse','EMail adress',NULL),(129,'1.00','admintable','pager','Pagernummer','Pager number',NULL),(130,'1.00','admintable','addonaddress','Zusatzadresse','Addon adress',NULL),(131,'1.00','admintable','contactname','Kontaktname','Contact name',NULL),(132,'1.00','admintable','contactgroups','Kontaktgruppen','Contact groups',NULL),(133,'1.00','admintable','members','Mitglieder','Members',NULL),(134,'1.00','admintable','configname','Konfigurationsname','Configuration name',NULL),(135,'1.00','admintable','warn_contacts','Achtung, noch keine Kontakte definiert!','Attention, no contacts defined!',NULL),(136,'1.00','admintable','warn_contgroups','Achtung, noch keine Kontaktgruppen definiert!','Attention, no contact groups defined!',NULL),(137,'1.00','admintable','warn_timeperiod','Achtung, noch keine Zeitperioden definiert!','Attention, no time periods defined!',NULL),(138,'1.00','admintable','warn_host','Achtung, noch keine Hosts definiert!','Attention, no hosts defined!',NULL),(139,'1.00','admintable','warn_host_gr','Achtung, noch keine Hosts und Hostgruppen definiert!','Attention, no hosts and no host groups defined!',NULL),(140,'1.00','admintable','warn_command','Achtung, noch keine Pr&uuml;fbefehle definiert!','Attention, no check commands defined!',NULL),(141,'1.00','admintable','warn_service','Achtung, noch keine Services definiert!','Attention, no services defined!',NULL),(142,'1.00','admintable','warn_serv1','Achtung, Host','Attention, host',NULL),(143,'1.00','admintable','warn_serv2',' hat noch keine Services definiert!\"',' has no services defined!',NULL),(144,'1.00','admintable','warn_save','Speichern nicht m&ouml;glich!','Saving not possible!',NULL),(145,'1.00','admintable','file','Datei','File',NULL),(146,'1.00','admintable','fil_ack','aktuell','File up-to-date',NULL),(147,'1.00','admintable','fil_nak','veraltet','File out-of-date',NULL),(148,'1.00','admintable','hostname','Hostname','Host name',NULL),(149,'1.00','admintable','hostnames','Hostnamen','Host names',NULL),(150,'1.00','admintable','configfilter','Filter nach Konfigurationsname','Config name filter',NULL),(151,'1.00','admintable','markall','Alle angezeigten Datens&auml;tze markieren','Mark all shown datasets',NULL),(152,'1.00','admintable','service','Servicename','Service name',NULL),(153,'1.00','admintable','services','Servicenamen','Service names',NULL),(154,'1.00','admintable','address','IP Adresse','IP Address',NULL),(155,'1.00','admintable','maxcheckatt','Max. Pr&uuml;fungen','Max check attempts',NULL),(156,'1.00','admintable','checkinterval','Pr&uuml;fintervall','Check interval',NULL),(157,'1.00','admintable','checkcmd','Pr&uuml;fbefehl','Check command',NULL),(158,'1.00','admintable','cmdargs','Befehlsargumente','Command arguments',NULL),(159,'1.00','admintable','hostgroups','Hostgruppen','Host groups',NULL),(160,'1.00','admintable','servicegroups','Servicegruppen','Service groups',NULL),(161,'1.00','admintable','checkperiod','Pr&uuml;fperiode','Check period',NULL),(162,'1.00','admintable','activechecks','Aktive Pr&uuml;fungen','Active checks',NULL),(163,'1.00','admintable','passivechecks','Passive Pr&uuml;fungen','Passive checks',NULL),(164,'1.00','admintable','obsess','Schlusspr&uuml;fung','Obsessing',NULL),(165,'1.00','admintable','parents','Vorgeschaltete Hosts','Parents',NULL),(166,'1.00','admintable','freshness','Aktualit&auml;tspr&uuml;fung','Check freshness',NULL),(167,'1.00','admintable','freshtresh','Aktualit&auml;sschwelle','Freshness treshold',NULL),(168,'1.00','admintable','performance','Performancedaten','Performance data',NULL),(169,'1.00','admintable','statusinfo','Erhalte Statusinfos','Keep Status info',NULL),(170,'1.00','admintable','nostatusinfo','Erhalte andere Infos','Keep No-status info',NULL),(171,'1.00','admintable','notifinterval','Wiederholungszeit','Notification interval',NULL),(172,'1.00','admintable','notifperiod','Zeitperiode','Notification period',NULL),(173,'1.00','admintable','notifoption','Optionen','Notification options',NULL),(174,'1.00','admintable','notifenable','Alarmierung','Enable notification',NULL),(175,'1.00','admintable','eventhandler','Ereignisbefehl','Event handler',NULL),(176,'1.00','admintable','eventenable','Ereignisbehandlung','Enable eventhandler',NULL),(177,'1.00','admintable','lowflap','Untere Schwelle','Low flap treshold',NULL),(178,'1.00','admintable','highflap','Obere Schwelle','High flap treshold',NULL),(179,'1.00','admintable','flapenable','Einschalten','Enable flap control',NULL),(180,'1.00','admintable','stalking','Stalking','Stalking',NULL),(181,'1.00','admintable','fullcmd','Kompletter Befehl','Full command',NULL),(182,'1.00','admintable','file_old','Veraltet','out-of-date',NULL),(183,'1.00','admintable','file_io','Aktuell','up-to-date',NULL),(184,'1.00','admintable','commontitle','Allgemeine Einstellungen','Common settings',NULL),(185,'1.00','admintable','checktitle','Pr&uuml;feinstellungen','Check settings',NULL),(186,'1.00','admintable','notiftitle','Alarmierungseinstellungen','Notification settings',NULL),(187,'1.00','admintable','eventtitle','Ereigniseinstellungen','Event settings',NULL),(188,'1.00','admintable','flaptitle','Flattereinstellungen (Flapping)','Flap control settings',NULL),(189,'1.00','admintable','divtitle','Verschiedene Einstellungen','Special settings',NULL),(190,'1.00','admintable','mustdata','* Pflichtfelder','* required',NULL),(191,'1.00','admintable','allconfigs','Alle Konfigurationen','All configs',NULL),(192,'1.00','admintable','retrycheckint','Pr&uuml;fintervall nicht-OK','Retry check interval',NULL),(193,'1.00','admintable','normcheckint','Pr&uuml;fintervall OK','Normal check interval',NULL),(194,'1.00','admintable','volatile','Ist volatil','Is volatile',NULL),(195,'1.00','admintable','parallelize','Parallele Pr&uuml;fungen','Parallelize',NULL),(196,'1.00','admintable','hostgroup','Hostgruppe','Host group',NULL),(197,'1.00','admintable','servicegroup','Servicegruppe','Service group',NULL),(198,'1.00','admintable','dependhosts','Abh&auml;ngige Hosts','Dependent hosts',NULL),(199,'1.00','admintable','dependservices','Abh&auml;ngige Services','Dependent services',NULL),(200,'1.00','admintable','dependhostgrs','Abh&auml;ngige Hostgruppen','Dependent host groups',NULL),(201,'1.00','admintable','dependsergrs','Abh&auml;ngige Servicegruppen','Dependent service groups',NULL),(202,'1.00','admintable','inherit','Vererbung','Inherit parents',NULL),(203,'1.00','admintable','execfailcrit','Pr&uuml;foptionen','Execution fail criteria',NULL),(204,'1.00','admintable','notiffailcrit','Alarmoptionen','Notification fail criteria',NULL),(205,'1.00','admintable','firstnotif','Erste Alarmierung','First notification',NULL),(206,'1.00','admintable','lastnotif','Letzte Alarmierung','Last notification',NULL),(207,'1.00','admintable','notifinterv','Alarmierungsintervall','Notification interval',NULL),(208,'1.00','admintable','escperiod','Eskalationszeit','Escalation period',NULL),(209,'1.00','admintable','escoption','Eskalationsoptionen','Escalation options',NULL),(210,'1.00','admintable','notes','Host Beschreibung','Host notes',NULL),(211,'1.00','admintable','notesurl','URL Infoseite','Notes URL',NULL),(212,'1.00','admintable','actionurl','URL Aktionsseite','Action URL',NULL),(213,'1.00','admintable','iconimage','Hostbild','Icon image',NULL),(214,'1.00','admintable','iconimagealt','Bildtext','Icon image alt',NULL),(215,'1.00','admintable','vrmlimage','VRML Bild','VRML image',NULL),(216,'1.00','admintable','statusimage','Statusmap Bild','Status image',NULL),(217,'1.00','admintable','2dcoords','2D Koordinaten','2d coords',NULL),(218,'1.00','admintable','3dcoords','3D Koordinaten','3d coords',NULL),(219,'1.00','admintable','servnotes','Service Zusatzinfo','Service notes',NULL),(220,'1.00','admintable','serviconimage','Servicebild','Service image',NULL),(221,'1.00','admintable','deleteok','Sollen die markierten Einträge wirklich gelöscht werden?','Do you really want to delete all marked entries?',NULL),(222,'1.00','admintable','deletesingle','Soll dieser Datenbankeintrag wirklich gelöscht werden:','Do you really want to delete this single database entry?',NULL),(223,'1.00','admintable','download','Download','Download',NULL),(224,'1.00','admintable','pages','Seiten:','Pages:',NULL),(225,'1.00','formchecks','fill_name','Bitte einen Befehlsnahmen eintragen!','Please fill in the command name!',NULL),(226,'1.00','formchecks','fill_command','Bitte ein Kommando eintragen!','Please fill in the command line!',NULL),(227,'1.00','formchecks','fill_cgname','Bitte einen Kontaktgruppennamen eintragen!','Please fill in the contact group name!',NULL),(228,'1.00','formchecks','fill_desc','Bitte eine Beschreibung eintragen!','Please fill in the description!',NULL),(229,'1.00','formchecks','fill_member','Bitte Mitglieder auswählen!','Please select at least one member!',NULL),(230,'1.00','formchecks','fill_ctname','Bitte einen Kontaktnamen eintragen!','Please fill in the contact name!',NULL),(231,'1.00','formchecks','fill_soption','Bitte die Serviceoptionen eintragen!','Please fill in the service options!',NULL),(232,'1.00','formchecks','fill_hoption','Bitte die Hostoptionen eintragen!','Please fill in the host options!',NULL),(233,'1.00','formchecks','fill_speriod','Bitte eine Servicezeitperiode auswählen!','Please select a service check period!',NULL),(234,'1.00','formchecks','fill_hperiod','Bitte eine Hostzeitperiode auswählen!','Please select a host check period!',NULL),(235,'1.00','formchecks','fill_dephost','Bitte mindestens einen abhängigen Host auswählen!','Please select at least one dependent host!',NULL),(236,'1.00','formchecks','fill_host','Bitte einen Host auswählen!','Please select a host!',NULL),(237,'1.00','formchecks','fill_hosts','Bitte mindestens einen Host auswählen!','Please select at least one host!',NULL),(238,'1.00','formchecks','fill_depserv','Bitte mindestens einen abhängigen Service auswählen!','Please select at least one dependent service!',NULL),(239,'1.00','formchecks','fill_serv','Bitte einen Service auswählen!','Please select a service!',NULL),(240,'1.00','formchecks','fill_servs','Bitte mindestens einen Service auswählen!','Please select at least one service!',NULL),(241,'1.00','formchecks','fill_deserv','Eine Host/Service Kombination kann nicht\\nvon sich selbst abhängig sein!','A host/service combination can not depend of itself!',NULL),(242,'1.00','formchecks','fill_firstnf','Bitte die erste Alarmierung eintragen!','Please fill in the first notification!',NULL),(243,'1.00','formchecks','fill_lastnf','Bitte die letzte Alarmierung eintragen!','Please fill in the last notification!',NULL),(244,'1.00','formchecks','fill_nfint','Bitte eine Wiederholungszeit für\\ndie Alarmierung eintragen!','Please fill in the notification interval',NULL),(245,'1.00','formchecks','fill_cgroup','Bitte mindestens eine Kontaktgruppe auswählen!','Please select at least one contact group!',NULL),(246,'1.00','formchecks','fill_hostgroup','Bitte einen Hostgruppennamen eintragen!','Please fill in the host group name!',NULL),(247,'1.00','formchecks','fill_servgroup','Bitte einen Servicegruppennamen eintragen!','Please fill in the service group name!',NULL),(248,'1.00','formchecks','fill_hostname','Bitte einen Hostnamen eintragen!','Please fill in the host name!',NULL),(249,'1.00','formchecks','fill_servname','Bitte einen Servicenamen eintragen!','Please fill in the service name!',NULL),(250,'1.00','formchecks','fill_address','Bitte eine IP Adresse eintragen!','Please fill in the IP address!',NULL),(251,'1.00','formchecks','fill_checkper','Bitte eine Prüfzeitperiode auswählen!','Please select a check period!',NULL),(252,'1.00','formchecks','fill_checkatt','Bitte die Anzahl maximaler Prüfungen\\nbis zur Alarmauslösung eintragen!','Please fill in the maximal check attempts!',NULL),(253,'1.00','formchecks','fill_notperiod','Bitte eine Alarmierungszeitperiode auswählen!','Please select a notification period!',NULL),(254,'1.00','formchecks','fill_noption','Bitte die Alarmierungsoptionen eintragen!','Please check the notification options!',NULL),(255,'1.00','formchecks','fill_nochkint','Bitte das OK Prüfintervall eintragen!','Please fill in the normal check interval!',NULL),(256,'1.00','formchecks','fill_rechkint','Bitte das nicht-OK Prüfintervall eintragen!','Please fill in the retry check interval!',NULL),(257,'1.00','formchecks','fill_chkcomm','Bitte einen Prüfbefehl auswählen','Please select a check command',NULL),(258,'1.00','formchecks','fill_tname','Bitte einen Zeitperiodennamen eintragen!','Please fill in the time period name!',NULL),(259,'1.00','formchecks','fill_config','Bitte einen Konfigurationsnamen eintragen!','Please fill in the configuration name!',NULL),(260,'1.00','formchecks','fill_host_gr','Bitte mindestens einen Hostnamen oder Hostgruppennamen auswählen!','Please select at least one host or host group!',NULL),(261,'1.00','formchecks','fill_hostorgr','Es können nur Hosts oder Hostgruppen verwendet werden, keine Kombinationen!','Only hosts or host groups can be selected - no combinations of them!',NULL),(262,'1.00','formchecks','fill_service_gr','Bitte mindestens einen Service oder Servicegruppennamen auswählem!','Please select at least one service or service group name!',NULL),(263,'1.00','formchecks','fill_servg_only','Servicegruppen können nur alleine, also nicht in Kombination\\nmit Hosts, Hostgruppen oder einzelnen Services ausgewählt werden!','Service groups can only be used alone - not in combination with hosts, host groups or single services!',NULL),(264,'1.00','formchecks','fill_hostorsgr','Bitte mindestens einen Host oder mindestens eine Servicegruppe auswählen!','Please select at least one host or service group!',NULL),(265,'1.00','formchecks','fill_depservgr','Bitte mindestens eine abhängige Servicegruppe auswählen!','Please select at least one dependent service group!',NULL),(266,'1.00','formchecks','fill_servgr','Bitte mindestens eine Servicegruppe auswählen!','Please select at least one service group!',NULL),(267,'1.00','formchecks','fill_dephostgr','Bitte mindestens eine abhängige Hostgruppe auswählen!','Please select at least one dependent host group!',NULL),(268,'1.00','formchecks','fill_hostgr','Bitte mindestens eine Hostgruppe auswählen!','Please select at least one host group!',NULL),(269,'1.00','formchecks','fill_circhost','Fehler in der Zirkularbeziehung:\\nEin Host kann nicht von sich selbst abhängig sein!','Failure in circular relation:\\na host cannot be depend on itself!',NULL),(270,'1.00','formchecks','fill_circhostgr','Fehler in der Zirkularbeziehung:\\nEine Hostgruppe kann nicht von sich selbst abhängig sein!','Failure in circular relation:\\na host group cannot be depend on itself!',NULL),(271,'1.00','formchecks','fill_username','Bitte einen Benutzernamen eintragen','Please fill in the username',NULL),(272,'1.00','formchecks','fill_password','Bitte ein Passwort eintragen','Please fill in the password',NULL),(273,'1.00','formchecks','fill_pwdnoteq','Passwörter sind ungleich!','The passwords are not equal!',NULL),(274,'1.00','formchecks','fill_pwdshort','Passwort ist zu kurz - mindestens 6 Zeichen sind nötig!','The password is too short - use at least 6 characters!',NULL),(275,'1.00','formchecks','fill_illeguser','Ungültige Zeichen im Benutzernamen!','The user name contains illegal characters!',NULL),(276,'1.00','formchecks','fill_oldpw','Bitte altes Passwort eintragen!','Please fill in the old password!',NULL),(277,'1.00','formchecks','fill_fieldempty','Konfiguration leer','Data field is empty',NULL),(278,'1.00','formchecks','fill_illegchar1','Das Feld','The field',NULL),(279,'1.00','formchecks','fill_illegchar2',' enthält unerlaubte Zeichen!',' contains illegal characters!',NULL),(280,'1.00','formchecks','fill_illegchar3',' darf nur Zahlen enthalten!',' contains non-numeric characters!',NULL),(281,'1.00','formchecks','fill_specials','[^a-zA-Z0-9_-]','[^a-zA-Z0-9_-]',NULL),(282,'1.00','db','success','Daten wurden erfolgreich in die Datenbank eingetragen!','Data were successfully inserted to the data base!',NULL),(283,'1.00','db','failed','Fehler beim Einf&uuml;gen der Daten in die Datenbank:','Error while inserting the data to the data base:',NULL),(284,'1.00','db','datamissing','Datenbankeintrag fehlgeschlagen! Nicht alle Pflichtfelder ausgef&uuml;llt!','Database entry failed! Not all necessary data filled in!',NULL),(285,'1.00','db','datamissornak','Datenbankeintrag fehlgeschlagen! Nicht alle Pflichtfelder ausgef&uuml;llt oder ung&uuml;ltige Datenfeldkombination!','Database entry failed! Not all necessary data filled in or invalid combination of data!',NULL),(286,'1.00','db','success_del','Die gew&auml;hlten Datens&auml;tze wurden erfolgreich gel&ouml;scht!','All selected data successfully deleted!',NULL),(287,'1.00','db','failed_del','Beim L&ouml;schen der Datens&auml;tze sind Fehler aufgetreten - bitte &uuml;berpr&uuml;fen!','Errors while deleting some of the data - please check!',NULL),(288,'1.00','db','last_modified','Letzte Datenbank&auml;nderung:','Last database update:',NULL),(289,'1.00','db','entry','Eintrag','Entry',NULL),(290,'1.00','db','inside',' in',' inside',NULL),(291,'1.00','db','exists',' existiert schon und wurde nicht &uuml;berschrieben',' exists and were not overwritten',NULL),(292,'1.00','db','insertnak',' konnte nicht eingetragen werden:',' could not be inserted:',NULL),(293,'1.00','db','insertok',' erfolgreich eingetragen',' successfully inserted',NULL),(294,'1.00','db','dberror','Fehler bei der Datenbankabfrage:','Error while selecting data from database:',NULL),(295,'1.00','file','failed','Kann Konfigurationsdatei nicht &ouml;ffnen/&uuml;berschreiben (Berechtigungen pr&uuml;fen)!','Cannot open/overwrite the configuration file (check the permissions)!',NULL),(296,'1.00','file','success','Konfigurationsdatei erfolgreich geschrieben!','Configuration file successfully written!',NULL),(297,'1.00','file','somefailed','Es konnten nicht alle Konfigurationsdateien geschrieben werden (Berechtigungen prfen)!','Could not open/overwrite some of the configuration files (check all permissions)!',NULL),(298,'1.00','file','allsuccess','Alle Konfigurationsdateien erfolgreich geschrieben!','All configuration files were successfully written!',NULL),(299,'1.00','file','tablefail1','Tabelle f&uuml;r Importdefinition','Table for import definition',NULL),(300,'1.00','file','tablefail2',' kann nicht zugeordnet werden!',' is not available!',NULL),(301,'1.00','file','notreadable','Datei konnte nicht gelesen werden (Dateiberechtigungen pr&uuml;fen)!','Cannot open the data file (check the permissions)!',NULL),(302,'1.00','file','delete','L&ouml;schen','Delete',NULL),(303,'1.00','file','backupfile','Backupdateien','Backup files',NULL),(304,'1.00','file','success_del','Die dazugeh&ouml;renden, nicht mehr benutzten Konfigurationsdateien wurden erfolgreich gel&ouml;scht!','The assigned, no longer used configuration files were deleted successfully!',NULL),(305,'1.00','file','failed_del','Beim L&ouml;schen der nicht mehr benutzten Konfigurationsdateien ist ein Fehler aufgetreten - bitte &uuml;berprfen','Errors while deleting the old configuration file - please check!',NULL),(306,'1.00','file','checkconfig','Konfigurationsdateien pr&uuml;fen:','Check configuration files:',NULL),(307,'1.00','file','check','Start','Do it',NULL),(308,'1.00','file','restart','Nagios neu starten:','Restart Nagios:',NULL),(309,'1.00','file','binaryfail','Nagios Binary nicht gefunden oder keine Rechte zum ausf&uuml;hren!','Cannot find the Nagios binary or no rights for execution!',NULL),(310,'1.00','file','configok','Geschriebene Konfigurationsdateien sind g&uuml;ltig, Nagios kann (neu) gestartet werden!','Written configuration files are valid, Nagios can be restarted!',NULL),(311,'1.00','file','warning','Achtung, vor einem Restart unbedingt Konfiguration pr&uuml;fen!','Warning, always check the configuration files before restart Nagios!',NULL),(312,'1.00','file','cmdfail','Nagios Commandfile nicht gefunden oder keine Rechte zum schreiben!','Nagios command file not found or no rights to write!',NULL),(313,'1.00','file','restartet','Restart Befehl wurde erfolgreich an Nagios gesendet','Restart command successfully send to Nagios',NULL),(314,'1.00','file','nodaemon','Nagios Daemon l&auml;uft nicht, Befehl kann nicht gesendet werden!','Nagios daemon is not running, cannot send restart command!',NULL),(315,'1.00','file','templateok','Template verwendet:','Template used:',NULL),(316,'1.00','file','templatenak','Template nicht gefunden:','Template not found:',NULL),(317,'1.00','file','deleteok',' erfolgreich gel&ouml;scht!',' successfully deleted!',NULL),(318,'1.00','file','deletefail',' konnte nicht gel&ouml;scht werden (Berechtigungen)!',' could not be deleted (check the permissions)!',NULL),(319,'1.00','admincontent','inactive','Inaktiv','Inactive',NULL),(320,'1.00','admincontent','group','Gruppe','Group',NULL),(321,'2.00','admincontent','admintext','Das Modul Administration erlaubt das Erstellen, Modifizieren und L&ouml;schen von Konfigurationsdaten innerhalb von Nagios. Die Daten werden in einer Datenbank verwaltet und erst auf Wunsch in die entsprechenden Konfigurationsdateien von Nagios geschrieben.','The module Nagios administration can be used to comfortable create, modify and delete configuration files for Nagios 2.0. The data will be stored in a MySQL database and can be written to the standard files directly at any time you want.',NULL),(322,'1.00','admincontent','contacttext','Definieren von Kontaktdaten, Kontaktgruppen und Zeitperioden.','To define contact data, contact groups and time periods.',NULL),(323,'1.00','admincontent','commandtext','Definieren von Pr&uuml;fbefehlen, Alarmierungsbefehlen und Spezialbefehlen.','To define check and misc commands, notification commands and special commands.',NULL),(324,'1.00','admincontent','monitortext','Definieren von Host- und Service&uuml;berwachungen sowie Host- und Servicegruppen.','To define host and service supervisions as well as host and service groups.',NULL),(325,'1.00','admincontent','specialtext','Definieren von Host- und Serviceabh&auml;ngigkeiten, Host- und Serviceeskalationen sowie Host- und Servicezusatzdaten.','To define host and service dependencies, host and service escalations as well as host and service additional data.',NULL),(326,'1.00','admincontent','toolstext','Verschiedene n&uuml;tzliche Funktionen wie Datenimport, Daemonsteuerung etc.','Useful functions for data import, main configuration, daemon control and so on.',NULL),(327,'2.00','admincontent','administration','Funktionen zum Steuern der NagiosQL V2 Umgebung.','Functions for administration the Nagios QL V2 application.',NULL),(328,'1.00','admincontent','statistic','Statistische Daten','Statistical datas',NULL),(329,'1.00','admincontent','consistency','Datenkonsistenz','Data consistency',NULL),(330,'1.00','admincontent','nocontacts','Keine Kontakte definiert','No contacts defined',NULL),(331,'1.00','admincontent','nocontactgroups','Keine Kontaktgruppen definiert','No contact groups defined',NULL),(332,'1.00','admincontent','notimeperiods','Keine Zeitperioden definiert','No time periods defined',NULL),(333,'1.00','admincontent','nomisccommands','Keine Spezialbefehle definiert','No misc commands defined',NULL),(334,'1.00','admincontent','nocheckcommands','Keine Pr&uuml;fbefehle definiert','No check commands defined',NULL),(335,'1.00','admincontent','nohosts','Keine Hosts definiert','No hosts defined',NULL),(336,'1.00','admincontent','noservices','Keine Services definiert','No services defined',NULL),(337,'1.00','admincontent','nohostgroups','Keine Hostgruppen definiert','No host groups defined',NULL),(338,'1.00','admincontent','noservicegroups','Keine Servicegruppen definiert','No service groups defined',NULL),(339,'1.00','admincontent','contactsok','Kontaktdaten sind konsistent!','Contacts data are consistent!',NULL),(340,'1.00','admincontent','cgroupssok','Kontaktgruppendaten sind konsistent!','Contact groups data are consistent!',NULL),(341,'1.00','admincontent','timeperiodsok','Zeitgruppendaten sind konsistent!','Time periods data are consistent!',NULL),(342,'1.00','admincontent','misccommandsok','Spezialbefehle sind konsistent!','Misc commands data are consistent!',NULL),(343,'1.00','admincontent','checkcommandsok','Pr&uuml;fbefehle sind konsistent!','Check commands data are consistent!',NULL),(344,'1.00','admincontent','hostsok','Hostdaten sind konsistent!','Hosts data are consistent!',NULL),(345,'1.00','admincontent','servicesok','Servicedaten sind konsistent!','Services data are consistent!',NULL),(346,'1.00','admincontent','hostgroupsok','Hostgruppen sind konsistent!','Host groups data are consistent!',NULL),(347,'1.00','admincontent','servicegroupsok','Servicegruppen sind konsistent!','Service groups data are consistent!',NULL),(348,'1.00','admincontent','contact','Kontakt','Contact',NULL),(349,'1.00','admincontent','contactgroup','Kontaktgruppe','Contact group',NULL),(350,'1.00','admincontent','timeperiod','Zeitgruppe','Time period',NULL),(351,'1.00','admincontent','misccommand','Spezialbefehl','Misc command',NULL),(352,'1.00','admincontent','checkcommand','Pr&uuml;fbefehl','Check command',NULL),(353,'1.00','admincontent','host','Host','Host',NULL),(354,'1.00','admincontent','service','Service','Service',NULL),(355,'1.00','admincontent','hostgroup','Hostgruppe','Host group',NULL),(356,'1.00','admincontent','servicegroup','Servicegruppe','Service group',NULL),(357,'1.00','admincontent','usednotexist','verwendet, ist aber nicht definiert!','is used, but not defined!',NULL),(358,'1.00','admincontent','usednotactive','verwendet, ist aber nicht aktiv!','is used, but not active!',NULL),(359,'1.00','admincontent','usedin','wird in','used in',NULL),(360,'1.00','admincontent','notused','ist aktiv, wird aber nicht verwendet!','is active, but not used!',NULL),(361,'1.00','logbook','successlogin','Login erfolgreich','Login successfull',NULL),(362,'1.00','logbook','faillogin','Login fehlgeschlagen','Login failed',NULL),(363,'1.00','logbook','timeout','Session timeout erreicht - Sekunden:','Session timeout reached - Seconds:',NULL),(364,'1.00','logbook','errorsite','Unerlaubte Seite aufgerufen:','Restricted site accessed:',NULL),(365,'1.00','logbook','userfail','User in Datenbank nicht gefunden','User not found in database',NULL),(366,'1.00','logbook','previous','vorherige 20 Eintr&auml;ge','previous 20 entries',NULL),(367,'1.00','logbook','next','n&auml;chste 20 Eintr&auml;ge','next 20 entries',NULL),(368,'1.00','logbook','time','Zeit','Time',NULL),(369,'1.00','logbook','user','Benutzer','User',NULL),(370,'1.00','logbook','message','Eintrag','Entry',NULL),(371,'1.00','logbook','newuser','Neuer Benutzer angelegt:','A new user added:',NULL),(372,'1.00','logbook','modifyuser','Benutzer modifizert:','User modified:',NULL),(373,'1.00','logbook','configcheck','Geschriebene Nagios Konfiguration &uuml;berprft - Warnungen/Fehler:','Written Nagios configuration checked - Warnings/Errors:',NULL),(374,'1.00','logbook','nagiosdown','Restart fehlgeschlagen - Nagios Daemon lief nicht','Restart failed - Nagios daemon was not running',NULL),(375,'1.00','logbook','restartok','Nagios Daemon erfolgreich neu gestartet','Nagios daemon successfully restartet',NULL),(376,'1.00','logbook','cmdfailed','Restart fehlgeschlagen - Nagios Commandfile nicht gefunden oder keine Rechte zum schreiben','Restart failed - Nagios command file not found or no rights to execute',NULL),(377,'1.00','logbook','pwdchanged','Passwort erfolgreich ge&auml;ndert','Passwort successfully modified',NULL),(378,'1.00','logbook','delfile','Datei gel&ouml;scht:','File deleted:',NULL),(379,'1.00','logbook','newchkcmd','Neuer Pr&uuml;fbefehl eingetragen:','New check command inserted:',NULL),(380,'1.00','logbook','modifychkcmd','Pr&uuml;fbefehl modifiziert:','Check command modified:',NULL),(381,'1.00','logbook','newcontgr','Neue Kontaktgruppe eingetragen:','New contact group inserted:',NULL),(382,'1.00','logbook','modifycontgr','Kontaktgruppe modifiziert:','Contact group modified:',NULL),(383,'1.00','logbook','newcontact','Neuer Kontakt eingetragen:','New contact inserted:',NULL),(384,'1.00','logbook','modifycontact','Kontakt modifiziert:','Contact modified:',NULL),(385,'1.00','logbook','download','Konfiguration heruntergeladen:','Configuration download:',NULL),(386,'1.00','logbook','newhostdep','Neue Hostabh&auml;ngigkeit eingetragen:','New host dependency inserted:',NULL),(387,'1.00','logbook','modifyhostdep','Hostabh&auml;ngigkeit modifiziert:','Host dependency modified:',NULL),(388,'1.00','logbook','newhostesc','Neue Hosteskalation eingetragen:','New host escalation inserted:',NULL),(389,'1.00','logbook','modifyhostesc','Hosteskalation modifiziert:','Host escalation modified:',NULL),(390,'1.00','logbook','newhostext','Neue Hostzusatzinfo eingetragen:','New host extended info inserted:',NULL),(391,'1.00','logbook','modifyhostext','Hostzusatzinfo modifiziert:','Host extended info modified:',NULL),(392,'1.00','logbook','newhostgr','Neue Hostgruppe eingetragen:','New host group inserted:',NULL),(393,'1.00','logbook','modifyhostgr','Hostgruppe modifiziert:','Host group modified:',NULL),(394,'1.00','logbook','newhost','Neuen Host eingetragen:','New host inserted:',NULL),(395,'1.00','logbook','modifyhost','Host modifiziert:','Host modified:',NULL),(396,'1.00','logbook','delhost','Hostdatei gel&ouml;scht:','Host file deleted:',NULL),(397,'1.00','logbook','import','Datei importiert - Datei [&Uuml;berschreibflag]:','File imported - File [overwite flag]:',NULL),(398,'1.00','logbook','newmisccmd','Neuen Spezialbefehl eingetragen:','New misc command inserted:',NULL),(399,'1.00','logbook','modifymisccmd','Spezialbefehl modifiziert:','Misc command modified:',NULL),(400,'1.00','logbook','newservdep','Neue Serviceabh&auml;ngigkeit eingetragen:','New service dependency inserted:',NULL),(401,'1.00','logbook','modifyservdep','Serviceabh&auml;ngigkeit modifiziert:','ervice dependency modified:',NULL),(402,'1.00','logbook','newservesc','Neue Serviceeskalation eingetragen:','New service escalation inserted:',NULL),(403,'1.00','logbook','modifyservesc','Serviceeskalation modifiziert:','Service escalation modified:',NULL),(404,'1.00','logbook','newservext','Neue Servicezusatzinfo eingetragen:','New service extended info inserted:',NULL),(405,'1.00','logbook','modifyservext','Servicezusatzinfo modifiziert:','Service extended info modified:',NULL),(406,'1.00','logbook','newservgr','Neue Servicegruppe eingetragen:','New service group inserted:',NULL),(407,'1.00','logbook','modifyservgr','Servicegruppe modifiziert:','Service group modified:',NULL),(408,'1.00','logbook','newservice','Neuen Service eingetragen:','New service inserted:',NULL),(409,'1.00','logbook','modifyservice','Service modifiziert:','Service modified:',NULL),(410,'1.00','logbook','delservice','Servicedatei gel&ouml;scht:','Service file deleted:',NULL),(411,'1.00','logbook','newtimep','Neue Zeitgruppe eingetragen:','New time period inserted:',NULL),(412,'1.00','logbook','modifytimep','Zeitgruppe modifiziert:','Time period modified:',NULL),(413,'1.00','logbook','deletedata','Eintrag aus Tabelle gel&ouml;scht - Tabelle [ID]:','Data set deleted - table [ID]:',NULL),(414,'1.00','logbook','deletedatafail','L&ouml;schen fehlgeschlagen - Tabelle [ID]:','Data set delete failed - table [ID]:',NULL),(415,'1.00','logbook','copydata','Daten in Tabelle kopiert - Tabelle [Neuer Name]:','Data set copied - table [new name]:',NULL),(416,'1.00','logbook','copydatafail','Kopieren fehlgeschlagen - Tabelle [Neuer Name]:','Data set copy failed - table [new name]:',NULL),(417,'1.00','logbook','config','Konfiguration erfolgreich geschrieben:','Configuration successfully written:',NULL),(418,'1.00','logbook','configfail','Schreiben der Konfiguration fehlgeschlagen:','Configuration write failed:',NULL),(419,'1.00','logbook','configfaildb','Schreiben der Konfiguration - Datenbankeintrag nicht gefunden','Configuration write failed - Dataset not found',NULL),(420,'2.00','admintable','keys','Zugriffsschl&uuml;ssel','Access keys',NULL),(421,'2.00','logbook','entries_before','L&ouml;sche Logbucheintr&auml;ge vor dem:','Delete logentries before:',NULL),(423,'2.00','logbook','year','Jahr:','Year:',NULL),(424,'2.00','logbook','month','Monat:','Month:',NULL),(425,'2.00','logbook','day','Tag:','Day:',NULL),(426,'2.00','logbook','log_delete','L&ouml;schen','Delete',NULL),(427,'2.00','menu','item_admsub24','Menu Zugriff','Menu access',NULL),(428,'2.00','title','menuaccess','Menu Zugriffsrechte festlegen','Define Menu Accessrights',NULL),(429,'2.00','admintable','submenu','Menuseite','Menu page',NULL),(430,'2.00','admintable','template','Templatedatei','Template file',NULL),(431,'2.00','admintable','noactivate','Eintrag kann nicht deaktiviert werden, da er als obligatorischer Eintrag in einer anderen Konfiguration verwendet wird','Entry cannot be deactivated because it is used by another configuration',NULL),(432,'2.00','logbook','menuaccess','Zugriffsrechte festgelegt f&uuml;r Menuitem:','Access keys set for menu item:',NULL),(433,'2.00','admintable','accessdescription','Damit ein Benutzer Zugriff hat, muss er zu jedem hier definieren Schl&uuml;sselloch einen Schl&uuml;ssel besitzen!','In order for a user to get access, he needs to have a key for each key hole defined here',NULL),(434,'2.00','admintable','keyholes','Zugriffsschl&uuml;ssell&ouml;cher','Access key holes',NULL),(435,'2.00','db','nodata_del','Keine Daten zum L&ouml;schen ausgew&auml;hlt oder gefunden','No data to delete selected or found',NULL),(436,'2.00','db','admindelete','Der Administratoraccount kann nicht gel&ouml;scht werden!','Admin account can\'t be deleted!',NULL),(437,'2.00','db','mustdata_del','Folgende Eintr&auml;ge k&ouml;nnen nicht gel&ouml;scht werden, weil sie in Mussfeldern anderer Konfigurationsdateien verwendet werden:','The following entries can\'t be deleted, because they are used in mandatory fields of other configuration files:',NULL),(438,'2.00','db','used_in_table','wird benutzt in Tabelle:','is used in table:',NULL),(439,'2.00','db','in_entry','in Eintrag:','inside entry:',NULL),(440,'2.00','db','usedin','wird noch in','is also used in',NULL),(441,'2.00','db','othertables','weiteren Tabellen/Eintr&auml;gen benutzt...','other tables/entries...',NULL),(442,'2.00','admintable','templatename','Templatename','Template name',NULL),(443,'2.00','menu','item_admsub25','Host Templates','Host templates',NULL),(444,'2.00','title','hosttemplate','Host Templates definieren','Define host templates',NULL),(445,'2.00','db','noactive_host','Host ist nicht aktiv gesetzt - Konfigurationsdatei nicht geschrieben','Host is not active - Configuration file not written',NULL),(446,'2.00','db','noactive_service','Service ist nicht aktiv gesetzt - Konfigurationsdatei nicht geschrieben','Service is not active - Configuration file not written',NULL),(447,'2.00','formchecks','fill_hostcmd','Bitte mindestens einen Host Befehl auswählen!','Please fill in at least one host command!',NULL),(448,'2.00','formchecks','fill_servcmd','Bitte mindestens einen Service Befehl auswählen!','Please fill in at least one service command!',NULL),(449,'2.00','admintable','warnmusthost','Achtung! Beim L&ouml;schen bestehender Hosts oder Hostgruppen in dieser Konfiguration k&ouml;nnen<br>Inkonsistenzen mit anderen Konfigurationen entstehen (Servicegruppen etc.)!','Warning! Deleting hosts or hostgroups in this configuration can <br>cause inconsistencies in another configurations (servicegroups etc.)',NULL),(450,'2.00','file','write_monitoring_data','Schreibe alle &Uuml;berwachungskonfigurationen:','Write all monitoring configurations:',NULL),(451,'2.00','file','write_additional_data','Schreibe alle Zusatzkonfigurationen:','Write all additional configurations:',NULL),(452,'2.01','title','dataselect','Datenauswahl','Data selection',NULL),(453,'2.01','admintable','dataselect','Datenauswahl','Data selection',NULL),(454,'2.01','formchecks','fill_data','Bitte mindestens einen Datensatz auswählen!','Please select at least one dataset',NULL);
/*!40000 ALTER TABLE `tbl_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_logbook`
--

DROP TABLE IF EXISTS `tbl_logbook`;
CREATE TABLE `tbl_logbook` (
  `id` bigint(20) NOT NULL auto_increment,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `user` varchar(20) NOT NULL default '',
  `entry` tinytext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=356 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_logbook`
--

LOCK TABLES `tbl_logbook` WRITE;
/*!40000 ALTER TABLE `tbl_logbook` DISABLE KEYS */;
INSERT INTO `tbl_logbook` VALUES (1,'2008-07-16 05:20:27','Admin','Login successfull'),(2,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/checkcommands.cfg [1]'),(3,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/command-plugins.cfg [1]'),(4,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/commands.cfg [1]'),(5,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/contactgroups.cfg [1]'),(6,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/contacts.cfg [1]'),(7,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/hostdependencies.cfg [1]'),(8,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/hostescalations.cfg [1]'),(9,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/hostextinfo.cfg [1]'),(10,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/hostgroups.cfg [1]'),(11,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/hosts.cfg [1]'),(12,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/misccommands.cfg [1]'),(13,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/resource.cfg [1]'),(14,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/servicedependencies.cfg [1]'),(15,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/serviceescalations.cfg [1]'),(16,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/serviceextinfo.cfg [1]'),(17,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/servicegroups.cfg [1]'),(18,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/timeperiods.cfg [1]'),(19,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/hosts/localhost.cfg [1]'),(20,'2008-07-16 05:20:56','Admin','File imported - File [overwite flag]: /etc/nagios/services/localhost.cfg [1]'),(21,'2008-07-16 05:21:18','Admin','Configuration successfully written: localhost-.cfg'),(22,'2008-07-16 05:21:18','Admin','Configuration successfully written: localhost-localhost.cfg'),(23,'2008-07-16 05:21:35','Admin','Configuration successfully written: localhost.cfg'),(24,'2008-07-16 05:21:35','Admin','Configuration successfully written: mymachine1.cfg'),(25,'2008-07-16 05:23:58','Admin','Host modified: www.oscc.org.my'),(26,'2008-07-16 05:23:58','Admin','Host file deleted: /etc/nagios/hosts/mymachine1.cfg'),(27,'2008-07-16 05:24:01','Admin','Configuration successfully written: localhost.cfg'),(28,'2008-07-16 05:24:01','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(29,'2008-07-16 05:24:58','Admin','Service modified: localhost'),(30,'2008-07-16 05:26:12','Admin','Host modified: localhost'),(31,'2008-07-16 05:26:17','Admin','Configuration successfully written: localhost.cfg'),(32,'2008-07-16 05:26:17','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(33,'2008-07-16 05:29:30','Admin','Host modified: localhost'),(34,'2008-07-16 05:29:33','Admin','Configuration download: localhost.cfg'),(35,'2008-07-16 05:29:36','Admin','Configuration download: localhost.cfg'),(36,'2008-07-16 05:29:38','Admin','Configuration successfully written: localhost.cfg'),(37,'2008-07-16 05:29:38','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(38,'2008-07-16 05:29:58','Admin','Host group modified: test'),(39,'2008-07-16 05:29:59','Admin','Configuration successfully written: hostgroups.cfg'),(40,'2008-07-16 05:30:21','Admin','New host group inserted: OSCC'),(41,'2008-07-16 05:30:23','Admin','Configuration successfully written: hostgroups.cfg'),(42,'2008-07-16 05:30:51','Admin','Service group modified: localhost'),(43,'2008-07-16 05:30:52','Admin','Configuration successfully written: servicegroups.cfg'),(44,'2008-07-16 05:31:10','Admin','Data set deleted - table [ID]: tbl_service [1]'),(45,'2008-07-16 05:31:14','Admin','Data set deleted - table [ID]: tbl_service [2]'),(46,'2008-07-16 05:31:20','Admin','Data set deleted - table [ID]: tbl_service [3]'),(47,'2008-07-16 05:31:20','Admin','Data set deleted - table [ID]: tbl_service [4]'),(48,'2008-07-16 05:31:20','Admin','Data set deleted - table [ID]: tbl_service [5]'),(49,'2008-07-16 05:31:39','Admin','Service modified: localhost'),(50,'2008-07-16 05:31:48','Admin','Service modified: localhost'),(51,'2008-07-16 05:31:55','Admin','Service modified: localhost'),(52,'2008-07-16 05:32:02','Admin','Service modified: localhost'),(53,'2008-07-16 05:32:02','Admin','Service file deleted: /etc/nagios/services/localhost-.cfg'),(54,'2008-07-16 05:32:20','Admin','Service modified: localhost'),(55,'2008-07-16 05:32:20','Admin','Service file deleted: /etc/nagios/services/localhost-localhost.cfg'),(56,'2008-07-16 05:32:29','Admin','Service modified: localhost'),(57,'2008-07-16 05:32:41','Admin','Service modified: localhost'),(58,'2008-07-16 05:32:45','Admin','Configuration successfully written: localhost.cfg'),(59,'2008-07-16 05:33:34','Admin','Written Nagios configuration checked - Warnings/Errors: 1/0'),(60,'2008-07-16 05:33:38','Admin','Configuration successfully written: localhost.cfg'),(61,'2008-07-16 05:33:38','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(62,'2008-07-16 05:33:39','Admin','Configuration successfully written: localhost.cfg'),(63,'2008-07-16 05:33:39','Admin','Configuration successfully written: hostgroups.cfg'),(64,'2008-07-16 05:33:39','Admin','Configuration successfully written: servicegroups.cfg'),(65,'2008-07-16 05:33:41','Admin','Configuration successfully written: timeperiods.cfg'),(66,'2008-07-16 05:33:41','Admin','Configuration successfully written: misccommands.cfg'),(67,'2008-07-16 05:33:41','Admin','Configuration successfully written: checkcommands.cfg'),(68,'2008-07-16 05:33:41','Admin','Configuration successfully written: contacts.cfg'),(69,'2008-07-16 05:33:41','Admin','Configuration successfully written: contactgroups.cfg'),(70,'2008-07-16 05:33:41','Admin','Configuration successfully written: servicedependencies.cfg'),(71,'2008-07-16 05:33:41','Admin','Configuration successfully written: hostdependencies.cfg'),(72,'2008-07-16 05:33:41','Admin','Configuration successfully written: serviceescalations.cfg'),(73,'2008-07-16 05:33:41','Admin','Configuration successfully written: hostescalations.cfg'),(74,'2008-07-16 05:33:41','Admin','Configuration successfully written: serviceextinfo.cfg'),(75,'2008-07-16 05:33:41','Admin','Configuration successfully written: hostextinfo.cfg'),(76,'2008-07-16 05:33:42','Admin','Written Nagios configuration checked - Warnings/Errors: 1/1'),(77,'2008-07-16 05:34:00','Admin','Contact modified: nagios-admin'),(78,'2008-07-16 05:34:16','Admin','Data set deleted - table [ID]: tbl_contactgroup [2]'),(79,'2008-07-16 05:34:21','Admin','Contact group modified: admins'),(80,'2008-07-16 05:34:27','Admin','Configuration successfully written: localhost.cfg'),(81,'2008-07-16 05:34:27','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(82,'2008-07-16 05:34:27','Admin','Configuration successfully written: localhost.cfg'),(83,'2008-07-16 05:34:27','Admin','Configuration successfully written: hostgroups.cfg'),(84,'2008-07-16 05:34:27','Admin','Configuration successfully written: servicegroups.cfg'),(85,'2008-07-16 05:34:27','Admin','Configuration successfully written: timeperiods.cfg'),(86,'2008-07-16 05:34:27','Admin','Configuration successfully written: misccommands.cfg'),(87,'2008-07-16 05:34:27','Admin','Configuration successfully written: checkcommands.cfg'),(88,'2008-07-16 05:34:27','Admin','Configuration successfully written: contacts.cfg'),(89,'2008-07-16 05:34:27','Admin','Configuration successfully written: contactgroups.cfg'),(90,'2008-07-16 05:34:27','Admin','Configuration successfully written: servicedependencies.cfg'),(91,'2008-07-16 05:34:27','Admin','Configuration successfully written: hostdependencies.cfg'),(92,'2008-07-16 05:34:27','Admin','Configuration successfully written: serviceescalations.cfg'),(93,'2008-07-16 05:34:27','Admin','Configuration successfully written: hostescalations.cfg'),(94,'2008-07-16 05:34:27','Admin','Configuration successfully written: serviceextinfo.cfg'),(95,'2008-07-16 05:34:27','Admin','Configuration successfully written: hostextinfo.cfg'),(96,'2008-07-16 05:34:29','Admin','Written Nagios configuration checked - Warnings/Errors: 1/0'),(97,'2008-07-16 05:34:31','Admin','Nagios daemon successfully restartet'),(98,'2008-07-16 05:57:05','Admin','Host group modified: Web'),(99,'2008-07-16 05:57:07','Admin','Configuration successfully written: hostgroups.cfg'),(100,'2008-07-16 05:58:49','Admin','Host modified: www.oscc.org.my'),(101,'2008-07-16 05:58:52','Admin','Configuration successfully written: localhost.cfg'),(102,'2008-07-16 05:58:52','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(103,'2008-07-16 05:59:56','Admin','New service inserted: PORT80'),(104,'2008-07-16 05:59:58','Admin','Configuration successfully written: localhost.cfg'),(105,'2008-07-16 05:59:58','Admin','Configuration successfully written: PORT80.cfg'),(106,'2008-07-16 06:00:38','Admin','New service group inserted: Web'),(107,'2008-07-16 06:00:40','Admin','Configuration successfully written: servicegroups.cfg'),(108,'2008-07-16 06:01:19','Admin','New contact inserted: webmaster'),(109,'2008-07-16 06:01:21','Admin','Configuration successfully written: contacts.cfg'),(110,'2008-07-16 06:01:38','Admin','New contact group inserted: webmasters'),(111,'2008-07-16 06:01:45','Admin','Contact modified: webmaster'),(112,'2008-07-16 06:01:47','Admin','Configuration successfully written: contacts.cfg'),(113,'2008-07-16 06:02:01','Admin','Configuration successfully written: localhost.cfg'),(114,'2008-07-16 06:02:01','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(115,'2008-07-16 06:02:01','Admin','Configuration successfully written: localhost.cfg'),(116,'2008-07-16 06:02:01','Admin','Configuration successfully written: PORT80.cfg'),(117,'2008-07-16 06:02:01','Admin','Configuration successfully written: hostgroups.cfg'),(118,'2008-07-16 06:02:01','Admin','Configuration successfully written: servicegroups.cfg'),(119,'2008-07-16 06:02:02','Admin','Configuration successfully written: timeperiods.cfg'),(120,'2008-07-16 06:02:02','Admin','Configuration successfully written: misccommands.cfg'),(121,'2008-07-16 06:02:02','Admin','Configuration successfully written: checkcommands.cfg'),(122,'2008-07-16 06:02:02','Admin','Configuration successfully written: contacts.cfg'),(123,'2008-07-16 06:02:02','Admin','Configuration successfully written: contactgroups.cfg'),(124,'2008-07-16 06:02:02','Admin','Configuration successfully written: servicedependencies.cfg'),(125,'2008-07-16 06:02:02','Admin','Configuration successfully written: hostdependencies.cfg'),(126,'2008-07-16 06:02:02','Admin','Configuration successfully written: serviceescalations.cfg'),(127,'2008-07-16 06:02:02','Admin','Configuration successfully written: hostescalations.cfg'),(128,'2008-07-16 06:02:02','Admin','Configuration successfully written: serviceextinfo.cfg'),(129,'2008-07-16 06:02:02','Admin','Configuration successfully written: hostextinfo.cfg'),(130,'2008-07-16 06:02:04','Admin','Written Nagios configuration checked - Warnings/Errors: 1/0'),(131,'2008-07-16 06:02:26','Admin','Host modified: www.oscc.org.my'),(132,'2008-07-16 06:02:33','Admin','Host group modified: Web'),(133,'2008-07-16 06:02:43','Admin','Configuration successfully written: localhost.cfg'),(134,'2008-07-16 06:02:43','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(135,'2008-07-16 06:02:55','Admin','Service modified: PORT80'),(136,'2008-07-16 06:02:58','Admin','Configuration successfully written: localhost.cfg'),(137,'2008-07-16 06:02:58','Admin','Configuration successfully written: PORT80.cfg'),(138,'2008-07-16 06:03:03','Admin','Configuration successfully written: localhost.cfg'),(139,'2008-07-16 06:03:03','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(140,'2008-07-16 06:03:03','Admin','Configuration successfully written: localhost.cfg'),(141,'2008-07-16 06:03:03','Admin','Configuration successfully written: PORT80.cfg'),(142,'2008-07-16 06:03:03','Admin','Configuration successfully written: hostgroups.cfg'),(143,'2008-07-16 06:03:03','Admin','Configuration successfully written: servicegroups.cfg'),(144,'2008-07-16 06:03:04','Admin','Configuration successfully written: timeperiods.cfg'),(145,'2008-07-16 06:03:04','Admin','Configuration successfully written: misccommands.cfg'),(146,'2008-07-16 06:03:04','Admin','Configuration successfully written: checkcommands.cfg'),(147,'2008-07-16 06:03:04','Admin','Configuration successfully written: contacts.cfg'),(148,'2008-07-16 06:03:04','Admin','Configuration successfully written: contactgroups.cfg'),(149,'2008-07-16 06:03:04','Admin','Configuration successfully written: servicedependencies.cfg'),(150,'2008-07-16 06:03:04','Admin','Configuration successfully written: hostdependencies.cfg'),(151,'2008-07-16 06:03:04','Admin','Configuration successfully written: serviceescalations.cfg'),(152,'2008-07-16 06:03:04','Admin','Configuration successfully written: hostescalations.cfg'),(153,'2008-07-16 06:03:04','Admin','Configuration successfully written: serviceextinfo.cfg'),(154,'2008-07-16 06:03:04','Admin','Configuration successfully written: hostextinfo.cfg'),(155,'2008-07-16 06:03:05','Admin','Written Nagios configuration checked - Warnings/Errors: 0/0'),(156,'2008-07-16 06:03:07','Admin','Nagios daemon successfully restartet'),(157,'2008-07-16 06:04:19','Admin','Data set copied - table [new name]: tbl_checkcommand [check_dns (1)]'),(158,'2008-07-16 06:05:09','Admin','Check command modified: check_dns_opendns'),(159,'2008-07-16 06:05:59','Admin','Check command modified: check_dns_opendns'),(160,'2008-07-16 06:06:00','Admin','Configuration successfully written: checkcommands.cfg'),(161,'2008-07-16 06:07:10','Admin','New service inserted: Domain'),(162,'2008-07-16 06:07:12','Admin','Configuration successfully written: Domain.cfg'),(163,'2008-07-16 06:07:12','Admin','Configuration successfully written: localhost.cfg'),(164,'2008-07-16 06:07:12','Admin','Configuration successfully written: PORT80.cfg'),(165,'2008-07-16 06:07:17','Admin','Configuration successfully written: localhost.cfg'),(166,'2008-07-16 06:07:17','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(167,'2008-07-16 06:07:17','Admin','Configuration successfully written: Domain.cfg'),(168,'2008-07-16 06:07:17','Admin','Configuration successfully written: localhost.cfg'),(169,'2008-07-16 06:07:17','Admin','Configuration successfully written: PORT80.cfg'),(170,'2008-07-16 06:07:17','Admin','Configuration successfully written: hostgroups.cfg'),(171,'2008-07-16 06:07:17','Admin','Configuration successfully written: servicegroups.cfg'),(172,'2008-07-16 06:07:18','Admin','Configuration successfully written: timeperiods.cfg'),(173,'2008-07-16 06:07:18','Admin','Configuration successfully written: misccommands.cfg'),(174,'2008-07-16 06:07:18','Admin','Configuration successfully written: checkcommands.cfg'),(175,'2008-07-16 06:07:18','Admin','Configuration successfully written: contacts.cfg'),(176,'2008-07-16 06:07:18','Admin','Configuration successfully written: contactgroups.cfg'),(177,'2008-07-16 06:07:18','Admin','Configuration successfully written: servicedependencies.cfg'),(178,'2008-07-16 06:07:18','Admin','Configuration successfully written: hostdependencies.cfg'),(179,'2008-07-16 06:07:18','Admin','Configuration successfully written: serviceescalations.cfg'),(180,'2008-07-16 06:07:18','Admin','Configuration successfully written: hostescalations.cfg'),(181,'2008-07-16 06:07:18','Admin','Configuration successfully written: serviceextinfo.cfg'),(182,'2008-07-16 06:07:18','Admin','Configuration successfully written: hostextinfo.cfg'),(183,'2008-07-16 06:07:19','Admin','Written Nagios configuration checked - Warnings/Errors: 0/0'),(184,'2008-07-16 06:07:21','Admin','Nagios daemon successfully restartet'),(185,'2008-07-16 07:14:49','Admin','Login successfull'),(186,'2008-07-16 07:15:10','Admin','Configuration successfully written: localhost.cfg'),(187,'2008-07-16 07:15:10','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(188,'2008-07-16 07:15:10','Admin','Configuration successfully written: Domain.cfg'),(189,'2008-07-16 07:15:10','Admin','Configuration successfully written: localhost.cfg'),(190,'2008-07-16 07:15:10','Admin','Configuration successfully written: PORT80.cfg'),(191,'2008-07-16 07:15:10','Admin','Configuration successfully written: hostgroups.cfg'),(192,'2008-07-16 07:15:10','Admin','Configuration successfully written: servicegroups.cfg'),(193,'2008-07-16 07:15:11','Admin','Configuration successfully written: timeperiods.cfg'),(194,'2008-07-16 07:15:11','Admin','Configuration successfully written: misccommands.cfg'),(195,'2008-07-16 07:15:11','Admin','Configuration successfully written: checkcommands.cfg'),(196,'2008-07-16 07:15:11','Admin','Configuration successfully written: contacts.cfg'),(197,'2008-07-16 07:15:11','Admin','Configuration successfully written: contactgroups.cfg'),(198,'2008-07-16 07:15:11','Admin','Configuration successfully written: servicedependencies.cfg'),(199,'2008-07-16 07:15:11','Admin','Configuration successfully written: hostdependencies.cfg'),(200,'2008-07-16 07:15:11','Admin','Configuration successfully written: serviceescalations.cfg'),(201,'2008-07-16 07:15:11','Admin','Configuration successfully written: hostescalations.cfg'),(202,'2008-07-16 07:15:11','Admin','Configuration successfully written: serviceextinfo.cfg'),(203,'2008-07-16 07:15:11','Admin','Configuration successfully written: hostextinfo.cfg'),(204,'2008-07-16 07:15:12','Admin','Written Nagios configuration checked - Warnings/Errors: 0/0'),(205,'2008-07-16 07:15:14','Admin','Nagios daemon successfully restartet'),(206,'2008-07-16 07:59:53','Admin','Session timeout reached - Seconds: 3677 - User: Admin'),(207,'2008-07-16 07:59:57','Admin','Login successfull'),(208,'2008-07-16 08:02:07','Admin','New host inserted: www.mampu.gov.my'),(209,'2008-07-16 08:02:09','Admin','Configuration successfully written: localhost.cfg'),(210,'2008-07-16 08:02:09','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(211,'2008-07-16 08:02:09','Admin','Configuration successfully written: www.mampu.gov.my.cfg'),(212,'2008-07-16 08:02:49','Admin','Configuration successfully written: localhost.cfg'),(213,'2008-07-16 08:02:49','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(214,'2008-07-16 08:02:49','Admin','Configuration successfully written: www.mampu.gov.my.cfg'),(215,'2008-07-16 08:02:49','Admin','Configuration successfully written: Domain.cfg'),(216,'2008-07-16 08:02:49','Admin','Configuration successfully written: localhost.cfg'),(217,'2008-07-16 08:02:49','Admin','Configuration successfully written: PORT80.cfg'),(218,'2008-07-16 08:02:49','Admin','Configuration successfully written: hostgroups.cfg'),(219,'2008-07-16 08:02:49','Admin','Configuration successfully written: servicegroups.cfg'),(220,'2008-07-16 08:02:50','Admin','Configuration successfully written: timeperiods.cfg'),(221,'2008-07-16 08:02:50','Admin','Configuration successfully written: misccommands.cfg'),(222,'2008-07-16 08:02:50','Admin','Configuration successfully written: checkcommands.cfg'),(223,'2008-07-16 08:02:50','Admin','Configuration successfully written: contacts.cfg'),(224,'2008-07-16 08:02:50','Admin','Configuration successfully written: contactgroups.cfg'),(225,'2008-07-16 08:02:50','Admin','Configuration successfully written: servicedependencies.cfg'),(226,'2008-07-16 08:02:50','Admin','Configuration successfully written: hostdependencies.cfg'),(227,'2008-07-16 08:02:50','Admin','Configuration successfully written: serviceescalations.cfg'),(228,'2008-07-16 08:02:50','Admin','Configuration successfully written: hostescalations.cfg'),(229,'2008-07-16 08:02:50','Admin','Configuration successfully written: serviceextinfo.cfg'),(230,'2008-07-16 08:02:50','Admin','Configuration successfully written: hostextinfo.cfg'),(231,'2008-07-16 08:02:51','Admin','Written Nagios configuration checked - Warnings/Errors: 1/0'),(232,'2008-07-16 08:03:16','Admin','Host group modified: Web'),(233,'2008-07-16 08:03:18','Admin','Configuration successfully written: hostgroups.cfg'),(234,'2008-07-16 08:03:22','Admin','Configuration successfully written: localhost.cfg'),(235,'2008-07-16 08:03:22','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(236,'2008-07-16 08:03:22','Admin','Configuration successfully written: www.mampu.gov.my.cfg'),(237,'2008-07-16 08:03:22','Admin','Configuration successfully written: Domain.cfg'),(238,'2008-07-16 08:03:23','Admin','Configuration successfully written: localhost.cfg'),(239,'2008-07-16 08:03:23','Admin','Configuration successfully written: PORT80.cfg'),(240,'2008-07-16 08:03:23','Admin','Configuration successfully written: hostgroups.cfg'),(241,'2008-07-16 08:03:23','Admin','Configuration successfully written: servicegroups.cfg'),(242,'2008-07-16 08:03:23','Admin','Configuration successfully written: timeperiods.cfg'),(243,'2008-07-16 08:03:23','Admin','Configuration successfully written: misccommands.cfg'),(244,'2008-07-16 08:03:23','Admin','Configuration successfully written: checkcommands.cfg'),(245,'2008-07-16 08:03:23','Admin','Configuration successfully written: contacts.cfg'),(246,'2008-07-16 08:03:23','Admin','Configuration successfully written: contactgroups.cfg'),(247,'2008-07-16 08:03:23','Admin','Configuration successfully written: servicedependencies.cfg'),(248,'2008-07-16 08:03:23','Admin','Configuration successfully written: hostdependencies.cfg'),(249,'2008-07-16 08:03:23','Admin','Configuration successfully written: serviceescalations.cfg'),(250,'2008-07-16 08:03:23','Admin','Configuration successfully written: hostescalations.cfg'),(251,'2008-07-16 08:03:23','Admin','Configuration successfully written: serviceextinfo.cfg'),(252,'2008-07-16 08:03:23','Admin','Configuration successfully written: hostextinfo.cfg'),(253,'2008-07-16 08:03:24','Admin','Written Nagios configuration checked - Warnings/Errors: 0/0'),(254,'2008-07-16 08:03:26','Admin','Nagios daemon successfully restartet'),(255,'2008-07-16 08:04:35','Admin','Service modified: PORT80'),(256,'2008-07-16 08:04:37','Admin','Configuration successfully written: Domain.cfg'),(257,'2008-07-16 08:04:37','Admin','Configuration successfully written: localhost.cfg'),(258,'2008-07-16 08:04:37','Admin','Configuration successfully written: PORT80.cfg'),(259,'2008-07-16 08:04:42','Admin','Configuration successfully written: localhost.cfg'),(260,'2008-07-16 08:04:42','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(261,'2008-07-16 08:04:42','Admin','Configuration successfully written: www.mampu.gov.my.cfg'),(262,'2008-07-16 08:04:42','Admin','Configuration successfully written: Domain.cfg'),(263,'2008-07-16 08:04:42','Admin','Configuration successfully written: localhost.cfg'),(264,'2008-07-16 08:04:42','Admin','Configuration successfully written: PORT80.cfg'),(265,'2008-07-16 08:04:42','Admin','Configuration successfully written: hostgroups.cfg'),(266,'2008-07-16 08:04:42','Admin','Configuration successfully written: servicegroups.cfg'),(267,'2008-07-16 08:04:43','Admin','Configuration successfully written: timeperiods.cfg'),(268,'2008-07-16 08:04:43','Admin','Configuration successfully written: misccommands.cfg'),(269,'2008-07-16 08:04:43','Admin','Configuration successfully written: checkcommands.cfg'),(270,'2008-07-16 08:04:43','Admin','Configuration successfully written: contacts.cfg'),(271,'2008-07-16 08:04:43','Admin','Configuration successfully written: contactgroups.cfg'),(272,'2008-07-16 08:04:43','Admin','Configuration successfully written: servicedependencies.cfg'),(273,'2008-07-16 08:04:43','Admin','Configuration successfully written: hostdependencies.cfg'),(274,'2008-07-16 08:04:43','Admin','Configuration successfully written: serviceescalations.cfg'),(275,'2008-07-16 08:04:43','Admin','Configuration successfully written: hostescalations.cfg'),(276,'2008-07-16 08:04:43','Admin','Configuration successfully written: serviceextinfo.cfg'),(277,'2008-07-16 08:04:43','Admin','Configuration successfully written: hostextinfo.cfg'),(278,'2008-07-16 08:04:44','Admin','Written Nagios configuration checked - Warnings/Errors: 0/0'),(279,'2008-07-16 08:04:45','Admin','Nagios daemon successfully restartet'),(280,'2008-07-16 08:23:31','Admin','New host inserted: www.jpj.gov.my'),(281,'2008-07-16 08:23:55','Admin','Configuration successfully written: localhost.cfg'),(282,'2008-07-16 08:23:55','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(283,'2008-07-16 08:23:55','Admin','Configuration successfully written: www.mampu.gov.my.cfg'),(284,'2008-07-16 08:23:55','Admin','Configuration successfully written: www.jpj.gov.my.cfg'),(285,'2008-07-16 08:23:55','Admin','Configuration successfully written: Domain.cfg'),(286,'2008-07-16 08:23:55','Admin','Configuration successfully written: localhost.cfg'),(287,'2008-07-16 08:23:55','Admin','Configuration successfully written: PORT80.cfg'),(288,'2008-07-16 08:23:55','Admin','Configuration successfully written: hostgroups.cfg'),(289,'2008-07-16 08:23:55','Admin','Configuration successfully written: servicegroups.cfg'),(290,'2008-07-16 08:23:58','Admin','Configuration successfully written: timeperiods.cfg'),(291,'2008-07-16 08:23:58','Admin','Configuration successfully written: misccommands.cfg'),(292,'2008-07-16 08:23:58','Admin','Configuration successfully written: checkcommands.cfg'),(293,'2008-07-16 08:23:58','Admin','Configuration successfully written: contacts.cfg'),(294,'2008-07-16 08:23:58','Admin','Configuration successfully written: contactgroups.cfg'),(295,'2008-07-16 08:23:58','Admin','Configuration successfully written: servicedependencies.cfg'),(296,'2008-07-16 08:23:58','Admin','Configuration successfully written: hostdependencies.cfg'),(297,'2008-07-16 08:23:58','Admin','Configuration successfully written: serviceescalations.cfg'),(298,'2008-07-16 08:23:58','Admin','Configuration successfully written: hostescalations.cfg'),(299,'2008-07-16 08:23:58','Admin','Configuration successfully written: serviceextinfo.cfg'),(300,'2008-07-16 08:23:58','Admin','Configuration successfully written: hostextinfo.cfg'),(301,'2008-07-16 08:24:02','Admin','Written Nagios configuration checked - Warnings/Errors: 0/0'),(302,'2008-07-16 08:24:05','Admin','Nagios daemon successfully restartet'),(303,'2008-07-17 01:08:17','Admin','Session timeout reached - Seconds: 61188 - User: Admin'),(304,'2008-07-17 01:08:21','Admin','Login successfull'),(305,'2008-07-17 01:08:43','Admin','Data set deleted - table [ID]: tbl_host [4]'),(306,'2008-07-17 01:08:43','Admin','Host file deleted: www.jpj.gov.my.cfg'),(307,'2008-07-17 01:08:45','Admin','Configuration successfully written: localhost.cfg'),(308,'2008-07-17 01:08:45','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(309,'2008-07-17 01:08:45','Admin','Configuration successfully written: www.mampu.gov.my.cfg'),(310,'2008-07-17 01:08:50','Admin','Configuration successfully written: localhost.cfg'),(311,'2008-07-17 01:08:50','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(312,'2008-07-17 01:08:50','Admin','Configuration successfully written: www.mampu.gov.my.cfg'),(313,'2008-07-17 01:08:50','Admin','Configuration successfully written: Domain.cfg'),(314,'2008-07-17 01:08:50','Admin','Configuration successfully written: localhost.cfg'),(315,'2008-07-17 01:08:50','Admin','Configuration successfully written: PORT80.cfg'),(316,'2008-07-17 01:08:50','Admin','Configuration successfully written: hostgroups.cfg'),(317,'2008-07-17 01:08:50','Admin','Configuration successfully written: servicegroups.cfg'),(318,'2008-07-17 01:08:51','Admin','Configuration successfully written: timeperiods.cfg'),(319,'2008-07-17 01:08:51','Admin','Configuration successfully written: misccommands.cfg'),(320,'2008-07-17 01:08:51','Admin','Configuration successfully written: checkcommands.cfg'),(321,'2008-07-17 01:08:51','Admin','Configuration successfully written: contacts.cfg'),(322,'2008-07-17 01:08:51','Admin','Configuration successfully written: contactgroups.cfg'),(323,'2008-07-17 01:08:51','Admin','Configuration successfully written: servicedependencies.cfg'),(324,'2008-07-17 01:08:51','Admin','Configuration successfully written: hostdependencies.cfg'),(325,'2008-07-17 01:08:51','Admin','Configuration successfully written: serviceescalations.cfg'),(326,'2008-07-17 01:08:51','Admin','Configuration successfully written: hostescalations.cfg'),(327,'2008-07-17 01:08:51','Admin','Configuration successfully written: serviceextinfo.cfg'),(328,'2008-07-17 01:08:51','Admin','Configuration successfully written: hostextinfo.cfg'),(329,'2008-07-17 01:08:53','Admin','Written Nagios configuration checked - Warnings/Errors: 0/0'),(330,'2008-07-17 01:11:17','Admin','New service inserted: Check_Opendns'),(331,'2008-07-17 01:11:29','Admin','Data set deleted - table [ID]: tbl_service [13]'),(332,'2008-07-17 01:11:31','Admin','Configuration successfully written: Domain.cfg'),(333,'2008-07-17 01:11:31','Admin','Configuration successfully written: localhost.cfg'),(334,'2008-07-17 01:11:31','Admin','Configuration successfully written: PORT80.cfg'),(335,'2008-07-17 01:11:36','Admin','Configuration successfully written: localhost.cfg'),(336,'2008-07-17 01:11:36','Admin','Configuration successfully written: www.oscc.org.my.cfg'),(337,'2008-07-17 01:11:36','Admin','Configuration successfully written: www.mampu.gov.my.cfg'),(338,'2008-07-17 01:11:36','Admin','Configuration successfully written: Domain.cfg'),(339,'2008-07-17 01:11:36','Admin','Configuration successfully written: localhost.cfg'),(340,'2008-07-17 01:11:36','Admin','Configuration successfully written: PORT80.cfg'),(341,'2008-07-17 01:11:36','Admin','Configuration successfully written: hostgroups.cfg'),(342,'2008-07-17 01:11:36','Admin','Configuration successfully written: servicegroups.cfg'),(343,'2008-07-17 01:11:37','Admin','Configuration successfully written: timeperiods.cfg'),(344,'2008-07-17 01:11:37','Admin','Configuration successfully written: misccommands.cfg'),(345,'2008-07-17 01:11:37','Admin','Configuration successfully written: checkcommands.cfg'),(346,'2008-07-17 01:11:37','Admin','Configuration successfully written: contacts.cfg'),(347,'2008-07-17 01:11:37','Admin','Configuration successfully written: contactgroups.cfg'),(348,'2008-07-17 01:11:37','Admin','Configuration successfully written: servicedependencies.cfg'),(349,'2008-07-17 01:11:37','Admin','Configuration successfully written: hostdependencies.cfg'),(350,'2008-07-17 01:11:37','Admin','Configuration successfully written: serviceescalations.cfg'),(351,'2008-07-17 01:11:37','Admin','Configuration successfully written: hostescalations.cfg'),(352,'2008-07-17 01:11:37','Admin','Configuration successfully written: serviceextinfo.cfg'),(353,'2008-07-17 01:11:37','Admin','Configuration successfully written: hostextinfo.cfg'),(354,'2008-07-17 01:11:38','Admin','Written Nagios configuration checked - Warnings/Errors: 0/0'),(355,'2008-07-17 01:11:39','Admin','Nagios daemon successfully restartet');
/*!40000 ALTER TABLE `tbl_logbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mainmenu`
--

DROP TABLE IF EXISTS `tbl_mainmenu`;
CREATE TABLE `tbl_mainmenu` (
  `id` tinyint(4) NOT NULL auto_increment,
  `order_id` tinyint(4) NOT NULL default '0',
  `menu_id` tinyint(4) NOT NULL default '0',
  `item` varchar(20) NOT NULL default '',
  `link` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_mainmenu`
--

LOCK TABLES `tbl_mainmenu` WRITE;
/*!40000 ALTER TABLE `tbl_mainmenu` DISABLE KEYS */;
INSERT INTO `tbl_mainmenu` VALUES (1,1,2,'item_adm1','admin.php'),(2,2,2,'item_adm2','admin/monitoring.php'),(3,3,2,'item_adm3','admin/alarming.php'),(4,4,2,'item_adm4','admin/commands.php'),(5,5,2,'item_adm5','admin/specials.php'),(6,6,2,'item_adm6','admin/tools.php'),(7,7,2,'item_adm7','admin/administration.php');
/*!40000 ALTER TABLE `tbl_mainmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_misccommand`
--

DROP TABLE IF EXISTS `tbl_misccommand`;
CREATE TABLE `tbl_misccommand` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `command_name` varchar(60) NOT NULL default '',
  `command_line` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `active` enum('0','1') NOT NULL default '1',
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `access_rights` varchar(8) default NULL,
  `config_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `config_name` (`command_name`,`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_misccommand`
--

LOCK TABLES `tbl_misccommand` WRITE;
/*!40000 ALTER TABLE `tbl_misccommand` DISABLE KEYS */;
INSERT INTO `tbl_misccommand` VALUES (1,'host-notify-by-email','/bin/echo -e \"***** Nagios *****nnHost \"$HOSTALIAS$\" is $HOSTSTATE$!nnDate/Time: $DATETIME$n\" | /bin/mail -s \'Host $HOSTNAME$ is $HOSTSTATE$!\' $CONTACTEMAIL$','1','2008-07-16 05:20:56',NULL,0),(2,'host-notify-by-epager','/bin/echo \'$HOSTALIAS$ is $HOSTSTATE$!\' | /bin/mail -s \'Host $HOSTNAME$ is $HOSTSTATE$!\' $CONTACTPAGER$','1','2008-07-16 05:20:56',NULL,0),(3,'host-notify-by-qpage','/usr/bin/printf \"Host: %s is %snInfo: %snDate: %s\" \'$HOSTALIAS$\' \'$HOSTSTATES$\' \'$OUTPUT$\' \'$DATETIME\' | /usr/local/bin/qpage -l 0 -p $CONTACTPAGER$','1','2008-07-16 05:20:56',NULL,0),(4,'host-notify-by-smsclient','/usr/bin/sms_client -q $CONTACTPAGER$ \"Host $HOSTALIAS$ is $HOSTSTATE$','1','2008-07-16 05:20:56',NULL,0),(5,'notify-by-email','/bin/printf \"$OUTPUT$\" | /bin/mail -s \'$SERVICESTATE$ alert for $HOSTALIAS$/$SERVICEDESC$\' $CONTACTEMAIL$','1','2008-07-16 05:20:56',NULL,0),(6,'notify-by-epager','/bin/echo \"$OUTPUT$\" | /bin/mail -s \'$HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$\' $CONTACTPAGER$','1','2008-07-16 05:20:56',NULL,0),(7,'notify-by-qpage','/usr/bin/printf \"Service: %snHost: %snAddress: %snState: %snInfo: %snDate: %s\" \'$SERVICEDESC$\' \'$HOSTNAME$\' \'$HOSTADDRESS$\' \'$SERVICESTATE$\' \'$OUTPUT$\' \'$DATETIME\' | /usr/local/bin/qpage -l 0 -p $CONTACTPAGER$','1','2008-07-16 05:20:56',NULL,0),(8,'notify-by-smsclient','/usr/bin/sms_client -q $CONTACTPAGER$ \"$NOTIFICATIONTYPE$: $HOSTADDRESS$ $HOSTALIAS$: $SERVICEDESC$ is $SERVICESTATE$\"','1','2008-07-16 05:20:56',NULL,0);
/*!40000 ALTER TABLE `tbl_misccommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_relation`
--

DROP TABLE IF EXISTS `tbl_relation`;
CREATE TABLE `tbl_relation` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `tbl_A` tinyint(3) unsigned NOT NULL default '0',
  `tbl_B` tinyint(3) unsigned NOT NULL default '0',
  `tbl_A_id` int(10) unsigned NOT NULL default '0',
  `tbl_A_field` varchar(50) NOT NULL default '',
  `tbl_B_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `tbl_A` (`tbl_A`,`tbl_B`,`tbl_A_id`,`tbl_A_field`,`tbl_B_id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_relation`
--

LOCK TABLES `tbl_relation` WRITE;
/*!40000 ALTER TABLE `tbl_relation` DISABLE KEYS */;
INSERT INTO `tbl_relation` VALUES (52,3,2,1,'members',1),(50,2,9,1,'host_notification_commands',1),(27,8,4,1,'members',1),(65,4,3,2,'contact_groups',3),(26,4,3,1,'contact_groups',1),(32,10,8,6,'hostgroup_name',1),(33,10,14,6,'servicegroups',1),(34,10,3,6,'contact_groups',1),(29,10,8,7,'hostgroup_name',1),(30,10,14,7,'servicegroups',1),(31,10,3,7,'contact_groups',1),(47,10,8,8,'hostgroup_name',1),(48,10,14,8,'servicegroups',1),(49,10,3,8,'contact_groups',1),(44,10,8,9,'hostgroup_name',1),(45,10,14,9,'servicegroups',1),(46,10,3,9,'contact_groups',1),(41,10,4,10,'host_name',1),(42,10,14,10,'servicegroups',1),(43,10,3,10,'contact_groups',1),(73,8,4,2,'members',3),(51,2,9,1,'service_notification_commands',1),(64,4,8,2,'hostgroups',2),(75,10,8,11,'hostgroup_name',2),(76,10,3,11,'contact_groups',3),(62,2,9,2,'host_notification_commands',1),(63,2,9,2,'service_notification_commands',1),(60,3,2,3,'members',2),(61,2,3,2,'contactgroups',3),(69,10,8,12,'hostgroup_name',2),(70,10,14,12,'servicegroups',2),(71,10,3,12,'contact_groups',3),(72,4,3,3,'contact_groups',3),(74,8,4,2,'members',2);
/*!40000 ALTER TABLE `tbl_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_relation_special`
--

DROP TABLE IF EXISTS `tbl_relation_special`;
CREATE TABLE `tbl_relation_special` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `tbl_A` tinyint(3) unsigned NOT NULL default '0',
  `tbl_B1` tinyint(3) unsigned NOT NULL default '0',
  `tbl_B2` tinyint(3) unsigned NOT NULL default '0',
  `tbl_A_id` int(10) unsigned NOT NULL default '0',
  `tbl_A_field` varchar(50) NOT NULL default '',
  `tbl_B1_id` int(10) unsigned NOT NULL default '0',
  `tbl_B2_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `tbl_A` (`tbl_A`,`tbl_B1`,`tbl_B2`,`tbl_A_id`,`tbl_A_field`,`tbl_B1_id`,`tbl_B2_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_relation_special`
--

LOCK TABLES `tbl_relation_special` WRITE;
/*!40000 ALTER TABLE `tbl_relation_special` DISABLE KEYS */;
INSERT INTO `tbl_relation_special` VALUES (7,14,4,10,2,'members',2,11),(6,14,4,10,1,'members',1,8);
/*!40000 ALTER TABLE `tbl_relation_special` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_service`
--

DROP TABLE IF EXISTS `tbl_service`;
CREATE TABLE `tbl_service` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `config_name` varchar(60) NOT NULL default '',
  `host_name` int(10) unsigned NOT NULL default '0',
  `hostgroup_name` int(10) unsigned NOT NULL default '0',
  `service_description` varchar(120) NOT NULL default '',
  `servicegroups` int(10) unsigned NOT NULL default '0',
  `is_volatile` enum('0','1') default '0',
  `check_command` text NOT NULL,
  `max_check_attempts` smallint(5) unsigned NOT NULL default '0',
  `normal_check_interval` smallint(5) unsigned NOT NULL default '0',
  `retry_check_interval` smallint(5) unsigned NOT NULL default '0',
  `active_checks_enabled` enum('0','1') NOT NULL default '1',
  `passive_checks_enabled` enum('0','1') NOT NULL default '1',
  `check_period` int(10) unsigned NOT NULL default '0',
  `parallelize_check` enum('0','1') NOT NULL default '1',
  `obsess_over_service` enum('0','1') NOT NULL default '1',
  `check_freshness` enum('0','1') NOT NULL default '1',
  `freshness_threshold` mediumint(8) unsigned default NULL,
  `event_handler` int(10) unsigned NOT NULL default '0',
  `event_handler_enabled` enum('0','1') NOT NULL default '1',
  `low_flap_threshold` smallint(5) unsigned default NULL,
  `high_flap_threshold` smallint(5) unsigned default NULL,
  `flap_detection_enabled` enum('0','1') NOT NULL default '1',
  `failure_prediction_enabled` enum('0','1') NOT NULL default '1',
  `process_perf_data` enum('0','1') NOT NULL default '0',
  `retain_status_information` enum('0','1') NOT NULL default '1',
  `retain_nonstatus_information` enum('0','1') NOT NULL default '1',
  `contact_groups` int(10) unsigned NOT NULL default '0',
  `notification_interval` smallint(5) unsigned NOT NULL default '0',
  `notification_period` int(10) unsigned NOT NULL default '0',
  `notification_options` varchar(10) NOT NULL default '',
  `notifications_enabled` enum('0','1') NOT NULL default '1',
  `stalking_options` varchar(10) default NULL,
  `active` enum('0','1') NOT NULL default '1',
  `template` int(10) unsigned NOT NULL default '0',
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `access_rights` varchar(8) default NULL,
  `config_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `config_name` (`config_name`,`service_description`,`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_service`
--

LOCK TABLES `tbl_service` WRITE;
/*!40000 ALTER TABLE `tbl_service` DISABLE KEYS */;
INSERT INTO `tbl_service` VALUES (12,'Domain',0,1,'Domain',1,'0','83',5,5,5,'1','1',1,'1','1','1',NULL,1,'1',NULL,NULL,'1','1','1','1','1',1,60,1,'w,u,c,r,f','1','o,w,u,c','1',0,'2008-07-16 06:07:10',NULL,0),(11,'PORT80',0,1,'PORT80',0,'1','58!80',5,5,5,'1','1',1,'1','1','1',NULL,1,'1',NULL,NULL,'1','1','1','1','1',1,60,1,'w,u,c,r,f','1','o,w,u,c','1',0,'2008-07-16 08:04:35',NULL,0),(6,'localhost',0,1,'Current Load',1,'0','21!5.0,4.0,3.0!10.0,6.0,4.0',4,5,1,'1','1',1,'1','1','1',NULL,0,'1',NULL,NULL,'1','1','0','1','1',1,60,1,'w,u,c,r','1','','1',0,'2008-07-16 05:31:48',NULL,0),(7,'localhost',0,1,'Current Users',1,'0','23!20!50',4,5,1,'1','1',1,'1','1','1',NULL,0,'1',NULL,NULL,'1','1','0','1','1',1,60,1,'w,u,c,r','1','o,w,u,c','1',0,'2008-07-16 05:31:39',NULL,0),(8,'localhost',0,1,'ping',1,'0','45!100.0,20%!500.0,60%',4,5,1,'1','1',1,'1','1','1',NULL,0,'1',NULL,NULL,'1','1','1','1','1',1,60,1,'w,u,c,r','1','','1',0,'2008-07-16 05:32:41',NULL,0),(9,'localhost',0,1,'Root Partition',1,'0','20!20%!10%!/',4,5,1,'1','1',1,'1','1','1',NULL,0,'1',NULL,NULL,'1','1','1','1','1',1,60,1,'w,u,c,r,f','1','','1',0,'2008-07-16 05:32:29',NULL,0),(10,'localhost',1,0,'Total Processes',1,'0','22!250!400!RSZDT',4,5,1,'1','1',1,'1','1','1',NULL,0,'1',NULL,NULL,'1','1','1','1','1',1,60,1,'w,u,c,r,f','1','','1',0,'2008-07-16 05:32:20',NULL,0);
/*!40000 ALTER TABLE `tbl_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_servicedependency`
--

DROP TABLE IF EXISTS `tbl_servicedependency`;
CREATE TABLE `tbl_servicedependency` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `config_name` varchar(60) NOT NULL default '',
  `dependent_host_name` int(10) unsigned NOT NULL default '0',
  `dependent_service_description` int(10) unsigned NOT NULL default '0',
  `host_name` int(10) unsigned NOT NULL default '0',
  `service_description` int(10) unsigned NOT NULL default '0',
  `dependent_hostgroup_name` int(10) unsigned NOT NULL default '0',
  `dependent_servicegroup_name` int(10) unsigned NOT NULL default '0',
  `hostgroup_name` int(10) unsigned NOT NULL default '0',
  `servicegroup_name` int(10) unsigned NOT NULL default '0',
  `inherits_parent` enum('0','1') NOT NULL default '0',
  `execution_failure_criteria` varchar(12) default NULL,
  `notification_failure_criteria` varchar(12) default NULL,
  `active` enum('0','1') NOT NULL default '1',
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `access_rights` varchar(8) default NULL,
  `config_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `config_name` (`config_name`,`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_servicedependency`
--

LOCK TABLES `tbl_servicedependency` WRITE;
/*!40000 ALTER TABLE `tbl_servicedependency` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_servicedependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_serviceescalation`
--

DROP TABLE IF EXISTS `tbl_serviceescalation`;
CREATE TABLE `tbl_serviceescalation` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `config_name` varchar(60) NOT NULL default '',
  `host_name` int(10) unsigned NOT NULL default '0',
  `service_description` int(10) unsigned NOT NULL default '0',
  `hostgroup_name` int(10) unsigned NOT NULL default '0',
  `servicegroup_name` int(10) unsigned NOT NULL default '0',
  `contact_groups` int(10) unsigned NOT NULL default '0',
  `first_notification` smallint(5) unsigned NOT NULL default '0',
  `last_notification` smallint(5) unsigned NOT NULL default '0',
  `notification_interval` smallint(5) unsigned NOT NULL default '0',
  `escalation_period` int(10) unsigned NOT NULL default '0',
  `escalation_options` varchar(10) default NULL,
  `active` enum('0','1') NOT NULL default '1',
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `access_rights` varchar(8) default NULL,
  `config_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `config_name` (`config_name`,`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_serviceescalation`
--

LOCK TABLES `tbl_serviceescalation` WRITE;
/*!40000 ALTER TABLE `tbl_serviceescalation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_serviceescalation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_serviceextinfo`
--

DROP TABLE IF EXISTS `tbl_serviceextinfo`;
CREATE TABLE `tbl_serviceextinfo` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `host_name` int(10) unsigned default NULL,
  `service_description` int(10) unsigned NOT NULL default '0',
  `notes` tinytext,
  `notes_url` tinytext,
  `action_url` tinytext,
  `statistic_url` tinytext,
  `icon_image` varchar(60) default NULL,
  `icon_image_alt` varchar(60) default NULL,
  `active` enum('0','1') NOT NULL default '1',
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `access_rights` varchar(8) default NULL,
  `config_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `config_name` (`host_name`,`service_description`,`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_serviceextinfo`
--

LOCK TABLES `tbl_serviceextinfo` WRITE;
/*!40000 ALTER TABLE `tbl_serviceextinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_serviceextinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_servicegroup`
--

DROP TABLE IF EXISTS `tbl_servicegroup`;
CREATE TABLE `tbl_servicegroup` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `servicegroup_name` varchar(120) NOT NULL default '',
  `alias` varchar(120) NOT NULL default '',
  `members` int(10) unsigned NOT NULL default '0',
  `active` enum('0','1') NOT NULL default '1',
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `access_rights` varchar(8) default NULL,
  `config_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `config_name` (`servicegroup_name`,`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_servicegroup`
--

LOCK TABLES `tbl_servicegroup` WRITE;
/*!40000 ALTER TABLE `tbl_servicegroup` DISABLE KEYS */;
INSERT INTO `tbl_servicegroup` VALUES (1,'localhost','alert for localhost',1,'1','2008-07-16 05:30:51',NULL,0),(2,'Web','Web Server OSCC MAMPU Group',1,'1','2008-07-16 06:00:38',NULL,0);
/*!40000 ALTER TABLE `tbl_servicegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_submenu`
--

DROP TABLE IF EXISTS `tbl_submenu`;
CREATE TABLE `tbl_submenu` (
  `id` tinyint(4) NOT NULL auto_increment,
  `id_main` tinyint(4) NOT NULL default '0',
  `order_id` tinyint(4) NOT NULL default '0',
  `item` varchar(20) NOT NULL default '',
  `link` varchar(50) NOT NULL default '',
  `access_rights` varchar(8) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_submenu`
--

LOCK TABLES `tbl_submenu` WRITE;
/*!40000 ALTER TABLE `tbl_submenu` DISABLE KEYS */;
INSERT INTO `tbl_submenu` VALUES (1,2,1,'item_admsub1','admin/hosts.php','00000000'),(2,3,3,'item_admsub2','admin/timeperiods.php','00000000'),(3,4,2,'item_admsub3','admin/misccommands.php','00000000'),(4,4,1,'item_admsub4','admin/checkcommands.php','00000000'),(5,3,1,'item_admsub5','admin/contacts.php','00000000'),(6,3,2,'item_admsub6','admin/contactgroups.php','00000000'),(7,2,2,'item_admsub7','admin/services.php','00000000'),(8,2,3,'item_admsub8','admin/hostgroups.php','00000000'),(9,2,4,'item_admsub9','admin/servicegroups.php','00000000'),(10,5,4,'item_admsub10','admin/servicedependencies.php','00000000'),(11,5,5,'item_admsub11','admin/serviceescalations.php','00000000'),(12,5,1,'item_admsub12','admin/hostdependencies.php','00000000'),(13,5,2,'item_admsub13','admin/hostescalations.php','00000000'),(14,5,3,'item_admsub14','admin/hostextinfo.php','00000000'),(15,5,6,'item_admsub15','admin/serviceextinfo.php','00000000'),(16,6,1,'item_admsub16','admin/import.php','00000000'),(17,6,2,'item_admsub17','admin/delbackup.php','00000000'),(18,7,2,'item_admsub18','admin/users.php','00000000'),(19,6,5,'item_admsub19','admin/verify.php','00000000'),(20,7,1,'item_admsub20','admin/password.php','00000000'),(21,7,4,'item_admsub21','admin/logbook.php','00000000'),(22,6,3,'item_admsub22','admin/nagioscfg.php','00000000'),(23,6,4,'item_admsub23','admin/cgicfg.php','00000000'),(24,7,3,'item_admsub24','admin/menuaccess.php','00000000');
/*!40000 ALTER TABLE `tbl_submenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_timeperiod`
--

DROP TABLE IF EXISTS `tbl_timeperiod`;
CREATE TABLE `tbl_timeperiod` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `timeperiod_name` varchar(60) NOT NULL default '',
  `alias` varchar(120) NOT NULL default '',
  `sunday` varchar(100) default NULL,
  `monday` varchar(100) default NULL,
  `tuesday` varchar(100) default NULL,
  `wednesday` varchar(100) default NULL,
  `thursday` varchar(100) default NULL,
  `friday` varchar(100) default NULL,
  `saturday` varchar(100) default NULL,
  `active` enum('0','1') NOT NULL default '1',
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `access_rights` varchar(8) default NULL,
  `config_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `	timeperiod_name` (`timeperiod_name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 PACK_KEYS=0;

--
-- Dumping data for table `tbl_timeperiod`
--

LOCK TABLES `tbl_timeperiod` WRITE;
/*!40000 ALTER TABLE `tbl_timeperiod` DISABLE KEYS */;
INSERT INTO `tbl_timeperiod` VALUES (1,'24x7','24 Hours A Day, 7 Days A Week','00:00-24:00','00:00-24:00','00:00-24:00','00:00-24:00','00:00-24:00','00:00-24:00','00:00-24:00','1','2008-07-16 05:20:56',NULL,0),(2,'none','No Time Is A Good Time',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2008-07-16 05:20:56',NULL,0),(3,'nonworkhours','Non-Work Hours','00:00-24:00','00:00-09:00,17:00-24:00','00:00-09:00,17:00-24:00','00:00-09:00,17:00-24:00','00:00-09:00,17:00-24:00','00:00-09:00,17:00-24:00','00:00-24:00','1','2008-07-16 05:20:56',NULL,0),(4,'workhours','\"Normal\" Working Hours',NULL,'09:00-17:00','09:00-17:00','09:00-17:00','09:00-17:00','09:00-17:00',NULL,'1','2008-07-16 05:20:56',NULL,0);
/*!40000 ALTER TABLE `tbl_timeperiod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(20) NOT NULL default '',
  `alias` varchar(60) NOT NULL default '',
  `password` varchar(40) NOT NULL default '',
  `access_rights` varchar(8) default NULL,
  `active` enum('0','1') NOT NULL default '0',
  `last_login` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (6,'Admin','Administrator','21232f297a57a5a743894a0e4a801fc3','11111111','1','2008-07-17 01:08:21','2006-09-12 03:42:23');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-07-17  2:00:02
