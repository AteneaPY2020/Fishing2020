CREATE DATABASE  IF NOT EXISTS `fishingdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fishingdb`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: fishingdb
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) NOT NULL COMMENT '"Alimentos", "Moda", "Ecologia", "Ciencia y tecnologia", "Social", "Salud", "Academico", "Entretenimiento", "Infantil", "Belleza", "Otra"',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Alimento'),(2,'Moda'),(3,'Ecologia'),(4,'Ciencia y tecnologia'),(5,'Social'),(6,'Salud'),(7,'Academico'),(8,'Entretenimiento'),(9,'Infantil'),(10,'Belleza'),(11,'Otra'),(13,'Juguetes feos');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprendedor`
--

DROP TABLE IF EXISTS `emprendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprendedor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `nombre_foto` varchar(300) DEFAULT NULL,
  `foto` longblob,
  `id_usuario` int NOT NULL,
  `pais` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `biografia` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_emprendimiento_usuario1_idx` (`id_usuario`),
  CONSTRAINT `fk_emprendimiento_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprendedor`
--

LOCK TABLES `emprendedor` WRITE;
/*!40000 ALTER TABLE `emprendedor` DISABLE KEYS */;
INSERT INTO `emprendedor` VALUES (1,'Puseria Mary','mary@pusas.sv','22555555',NULL,NULL,3,'','',''),(2,'Crown','crown@diademas.com','23456789',NULL,NULL,4,'','',''),(3,'Gliti','glit@gmail.com','75315942',NULL,NULL,16,'Honduras','Tegucigalpa',''),(4,'prueba','prueba@gmail.com','12345678',NULL,NULL,19,'prueba','prueba',''),(5,'Bonsai Corp','BoCo@gmail.com','71235984',NULL,NULL,20,'JapÃ³n','Tokio',''),(6,'Juan Gabriel','jg@gmail.com','75183952',NULL,NULL,22,'MÃ©xico','ParÃ¡cuaro',''),(7,'Federico','fedeGa@gmail.com','26548875',NULL,NULL,23,'EspaÃ±a','Fuente',''),(8,'Los1D','los1D@gmail.com','11113255',NULL,NULL,24,'Inglaterra','Londres',''),(17,'Paola','pao@pao.com','12345678','chica.jpg',_binary 'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿ\Â\0£\0\ì\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0§ªıÁ\Ô\îüõ‹Ÿõciw’²\ä†\ì½Ñ»/tw\İ\Ã\Ş÷¶÷}\í½\ßwow\İ\Û\İ\çqï¢œ†k—z‹I,«¢\ì\Ù4\Õb=\ë›\İ\ØõLû\nv/ ñşN!\ZY(b¦\î\Æh}\ïto{\İÛ£ñ‰B\íªgM\×\íš\î)L¾’2¬\â\é0jF\ìj•\'\\T†!-`õ\Æ2éŒ¢v¢ˆ˜\Ûro\Ïö\Ü=ö» ş„”)0\×\Ñy\ê\àV’óYZ*÷\İ2\Ø\ãöX´hò^tö\Ã\"\Ø3ŒÑ¥\ç£C¤m:¥“ÿ\00ùhL\Èáš¬\Ñ/\ÏS\ëS¼/0ÿ\0\Ï\é!\ä‹Ae–.\ÔöH[mÎ¹>\Ê4]+k‹F\ç½\'R\Õğ\ßc~‹;MV.œ¡\'N&r(oš-\Õfi*9]Ô•úL»8\Õ\Ëü¾§š“P\Ó\È-ı.\É\í¸oŸ\Ê\ĞhñÚŒ¸<46‡^%ƒf\Õn~b\Öuú\'sOQ‰˜0uVdGF¿<\Öf•\\,\ï\ÎI€\Z\İG_\ËQòN3\ï6e)¹•ÍŠ­«Nn˜}¶\Ì)\×\âi©\èÅ¸Ú“™i\êhQ¯\Ì\ëTœ”\â‚8¼V™K.C±õùH0v?m\ÛÂ‚°‚l§µ\İ\Û%\ío¶I<†Ñ–£¶‹ôTn\ÙFj¶oº\Å\á1²M$`yY:½`lŸ=_ô¼\Ó.:Â\íõ\È›¨ò·\ÓeŸ*Eœ\×[g|ûi‘\Ö\í710µ€K\æeõ\ÇnÎ®„ÜšA·5¢9‡=\Z\Æ8m–\r¶s’õ9¡\ÉqX\ÎW0Yõsœ–E\"ŸFˆ\Í:\åó]*\'w[F˜\Íp¥?û\ß\Ê\ê1\ßZùWÑ•õøúóŠ7¢Y\Ñóıó\Ş\íù¡\Ş]6¨‘ˆ\Æ¯??ˆm\'„%`\0\ÍD2\Èı\æ[]MJ\Û\Ç\ãm>ˆ¡\Ğ;~kª°Ê‹€+«\È\0û„Y¦\Æks=\Óõù\ág\"¦Œ¤õ•ÛŠµ\Ø˜¤]§\Õ¹(9ú‹\ä»h\ßg\æ:Â”­˜\É]ªO€”b\Ñ\×mİ™\ëÁı0-\æ4,¨‹*—ˆ£¯\ÊtÎº¤i»v!:¾«…Fù¤†>»„T2·\Ó\Şüÿ\0\ép¬l¹ö5.›!›LMÑ€\\\ín3’ts–XmÃ°4³T\Ê\Æú\Ì!Z\íˆ^\à@ık$ñ?:{]\ì\ëª\å¤}d	³n+f •X,\Î\Ü#u:qSl\é£›¤\Ğ\È?:0²²siw÷q©_¤+V´}\ZGHüş”³Q\ë)ú.\'\Ù\ïL®?>0´$VZ÷y†0¹é¬—g&psª›ŠGG¸6EË¡\Ë\ËL\ÅC€¢«µ’±‰6¤s“ñı$¿gt±\Şxnˆ\íª\Î\×\Ë\Òw\Íõxc…\Ï2L\íJtk7¬TŠ\äH\Ù|\ê¹(9µ—:p\Åus0º&tBó©Õ„B)\Ò\Ìf\Ç)\å÷¼\Ğ+m\Õ\Î\n^Æ³*¨u°y¹®{i\Ùe_ ºt\\|M\Â\0\Î\ìVÆ’£^\Âõ°\èé£—\Û\ÆÍªw—C¡ ‘İ¡gL\äèª³pL8\æ˜\Õb\×+.Y|y¬íŒº\"ºd\ØB\ÑG§³^Y\Õs®.œ\êgi•\És\ë;¸\×;\ÍiÊœ]Z3„ùµÕ‘L©J\Ó;°\Ã;\Ô;\Å\Æ\ÔsŞt³.k2˜)c†tJ¢„\ÄWÀ¦\Òe\Ä\ä\è4H2#\\\Â9PÌ†¯6Ò¶\êù‡W\Ì\È[¢_UgHwÑxWÉ¸ú¡e°³¤šJMOn\èn\Êÿ\0RtP\ÌteÕµQ:R\Ü”Rh,˜Q\ã´W\0\Æñ¿\0L¢ùR\"#(\Ã]œJ+,-`b\è:1|‘\ãe3¶Ò”L¬\àK¤¦„\íF\Ö\Z.¥\rUŒ”Z\ã´w\ÓwD\n\å½\Â\èNz¼BF\È\è‘sŞ½nOW\Ç\Ñ<®\ã \ËkEDõs—jø\Õ\\ªŸe:<WË™¯…©‘ƒ«7¨¼h\nğÑ¶R¬Î˜tµıÁ€¤:P=\Ôb¦õ^^ŒÆ‚,x\ï<\îŒ2·_O/…83¬´O0o \í¤\ï\Z\ÑU£X²™D~\Ö5EH\æ´.7‰\ÆgIeh,E•<•bF¼#<\î¾\Î$£U»I­\Ì\ìj\èPGtE|\í:Š\ŞË›U%8yoù»%ûe©\Ù§\á\Ê\Òp!X0ZÑ°\ï\Z\éyz–şşk%­\îg¯”ªi+³‹•ª\â\ÔUv”kœ\ÎşGhÏ‘œö¯²\à>µ\íD\çÓ« \ìÍŒû\â{\\·–\á\\ûÌµe´¹\î6\é\Ù~{;G•ƒ\ÙT÷j\îÓ”8E¼ŒT\Ùeq\Ú\ßW\í¥\èLû\Ü;õ4\ï½\äz²Ÿ¼S‘÷±½\Õ\ÎPõ£t}\åj§\ïQ#x1}÷²\Äox\ëª÷¶\åö\Ü+\Ş\Z©{\Ø\Æ^ğ?ÿ\Ä\0-\0\0\0\0\0\0!\"1#2A B$34@0ÿ\Ú\0\0\ï,,)ÿ\0\ê²\åHr›~ª\ÅbdE!‡ÿ\0#0QnAoME¡šFŸHa\ÅhÔ²\Äf¬\Ö\á\Çò\ßÿ\0¥¶ŠÃ»X@”\ã=‘pF\ÄYõ+>¤O©H\ZYR´5µL\É}7¨^Dˆù Aš²¬„²€\ïù]gmI,Ql0³Â†\Ì@V„X\Ö\ÑT\ÇÉ®\â\Ù\ÔVÇ¶\0\Ë<0‹\Â\ÒÛ¸Ë¯1¯m‹šo— ù\Ç\Ít4Ø¶ü‚+1v¢¦±¨¥j[\ïZ ª\Ë\ç\ØIn]¶O™\ĞÇ³$\îı\êQmS*¼˜\Şc7‹®ğÖˆ\í¸”5‡\'Ö«°u±­\Î<†-\ÍS\×`uS\ë’üššÍEBµÈ»Œ®¥¤fõ?-eŒ}:O·	ü·¢’­‰—\ÜK\íĞµ\Ë66¸§¦Ê°•fN0q“„T \Üa¦1\ÄÃ¿ŒG\åÜ°ñ¬y8tö\Ó\"\Ş\ØP¸\Õ\çf5\ì\ã\ë‹\ì\é?\Ãx\ËZt\Ü^\ãSHWSP¬º\Ì\Ú5Ü³ô¾-±ZeŸn\r|œ°T N£”np «û:G­	È±\Ğ›aU\Å2\ë¶\×\Ûv\Ze3Q¡ù¥\í\Îa/\Z\íû–u\\+EY\Ç×©{0}l\Ö4¶œ\åu ¿\Æ\Ñ\ã>¾-lş\Ç\ÄOœFòÿ\0ô¥‡\Z\ÛU\Şı\ÛUb¬k\Ñß­·\éHŸÎ‘ ş,&e\\’\í«E;Yğ\Èy\Øş+\ê\Ç¢(€MzaY]i½\ĞJü+ŸeØµ\×Ô¬Y\Ô\È\Z3h6ZıP)ÿ\0.gùS9\ÕØ˜‡\Ì_Œ&ûŒ\'X±U\ÆMbº Î¦\Úg\×Q;\Êë®·µ+´ı6<8\Øó#Š\ì…\äøÕ¢£\ã#‰\çğ°x|s\Ë\èA•\áÒ‘±\ée\êX–ıJÏŠ›·y±VeS’\ß\ã°\çø\Ü)ş7ÄŸ\ãqg&œŒ\äg#-s¼›9Z¦)\âh\ÎnT\æİª¯\Ì?t¼ø\'\ËX©R\Æ¹•Zz•¼\é3÷*:-0¬G§u\ÃÛ€\Õ>\Ôû3\ìÀ\Í7d\ä\Ú\ä\Ò\âc\Åù¦®\éÁ¡±\Ü\ÒY«\Åñº|ğ‰R­Æ°£\'¿¹Å ù?\0\è\ëi\Ó.p5\ëuÁ\Â{&’qYÓ¬w\Ëıd8õß•k\ãôÜ–G¦\'k:M{­*T*\élğDj÷\ZÏ¥ª Dx¸Áñ_\ã[q4g–\å\Zš»šÂ¶³-nöW÷\'I\í~+e&%85‘¹w	‘…M§Ê¯£7\Üğ_”O‘5\ë\'lñ!üWğ¬\Æù\Ç¶ù<RœÖ˜F\Ş\Æü-\ÈT~Œ>\á˜?Šù|\Ûû\çõ&k—«??ù/¦m\èü¸\ÓS\Ñ}\ïBcÔ›•¯óı[\á:–\Ä0\Z—eqò[;xõ§\è\Ã\Øf{û³\ÈZ4fn¥3–u›ˆ%<Bf\å§\ÆQİ†4”üGÅQ~6YT8—\ßY”f-e:£k¤õ\ç\Ôvs\ë>û0\ëØ½«UyN–\Û\Çm€\×3·+4¹FD¯(\ÌL§\Ò[ù-ò|/õò\r¢>Sn§¨\ér\Ğ¬{U:`\Ö\'\ïª6²imfv(\Ë\Ç\ÉÀ»ô«u+m‹kõ,³¶\Ó\éùLz!ğ2ƒ?£\ZTü™KltûHl\ê\ÔZ¯M’Ü¿¦l%\ã‹û\êc–MrZ\ì\å[Rº\ß\ÒZ›0Û”\Ö\áªv`§QW^–ŸŸw\ïõı›ñş‰øl\î·ò°Y[°¼Ú•®\'\ã-e}””]\æ·\Ü/¯Ê¶\Æÿ\0ƒ4±¥\í,´s\Ô?••†k\íü³²Ò¦\âjo\"¿w\nŒõ’kl•ZõU¦†\Å\È\Ú\×dq‰–{¶wgv=ÀG¾[tÈµšYóUG\äÿ\04ùw*\n!·Qûo°ã¨¶-.°Fümór,3 \ã¾;\ìW¿K‡Œ¥\Ñ\ï\Ú/¬³\Ü)©h—(|µ&|\ŞYy­C\Å~\n\îy–#B˜÷\êw\Z~®:¤\Ìt²:=†¤\Ğ\"_\ár\Ú\Şr1üG–N şW\æ¿\Ë\äñG\ÃW\Æ\Ä\rª\Òv\ÖpvQ¥øaT\\\Õ\Ï\ÖyãŠ¾HN\Û>Gş;OoC2¾2ı¨G»¼/<V\ã¶O•Ÿª˜i<ó*IU;^À0\Ğuu^\r6,\å¸~:§ş®5\\a–J—™Ä¨SD2\Ó\î\ê·ğQ\æcü,i”\İ\Ënüÿ\0¸ğj@Ã€€ø+\æ\Ô<À–hIeqª™\Õ?\çÀ³ò\è\İÌ‘\éaĞµ§P¿»—Œü–ƒ¢2-\áXN*şK\rL{4_\È/\ã_ı(<P0\Òûš¹¨gQÙ€d¯>›¥ªŸK\Úu;»t¿\åCñdh–O9_°¿Ù‡€9)¦š÷(”Ÿ?¾L¾w\ÎfCUcfûh§¼ÿ\0©¦\ã{N§ws&\Å\ÜO%\ê\Å~k£\Ú*\È;B9«©>lX\"şx£p\İ9\'™û\ê\ïbUß¾¤3j)Uö2cœ\ÇJ¾½a\Ê‡\ç~¹Ú°d{Y\ß U”\áş»$’öKI\àR&\Ú İ¶xù\ã{#yp¸\îv˜NùX®Œ&aÿ\0c¦\Ó\ÛÆ¥\ÓN\ß[m\Ä]—®\âpñsŠhN\Ø\\7¥Å‰¥²®M)¯mÇ“U_¡\'\çk}\íù\Çp‘\è³^0†…Ü«²ónµ|m™\Ù<\"´K@w¹Ku;6§\æ”\ä1¯º•j\é\Ë]Š\Í-\Îµq¶rÃ–ÀiAı\ÊQKpûØ+ò<,\î3A\Ê‡ñÀ¯²,§B\ï¥\Å\ÅC\É\Ø÷C\Öm,³1ù\Ù:róF^Q¥lN\êV,bõ¡™!Ô›n›\Õ\ÜV\Ü-\İy4¶²’\Ó\ÉSÜ¾}7¨ƒr²G\"56_r&Û‡Ã¹šœgE«x\ÅWd Š¡¨g›Ü¬s{Ù¹SÅ¬\ÇUlÚFQGq2\ì®\ç\×\ÚF¢\ÍC\àÀ8‹&LDòÏ©©©\Ô\Ü`\×k£\Ú@Vˆv(E\î¨·Sª\Ù*LJ·el\\¬{2ºŸQv\"£_e¡ˆfrk\Ò\n\ÜÀLÙ|\è©0Ôœg:€K ÷µ\ïİ¾\0\0\éŸû]\â….So2=<@)Ad\ì%O_<vnP»‹J‹‚)\\¢~›ó©H€“?|c\ÙÆ¼½\È*,x\Ãf\ã\Û\ÆYúğF\íÛ’‘k\îF¬\Õ?:\Âù¹­‹±Jx´q)\â\"\Æ_-wšp)aŒ\0PI‹½y–±\îY¶\'Ï£	ó:•ü›\ÃZœ4/¼‚kÖ¥k\Îq\Õ:0\0S5ªÁ÷Bı\Ô:Z=\Ò\àMoùaX\Í\Ş1lz-j\ny\ä\ÖqG;8Uó™‰È¦ŒA÷“\ãÁ!\Ñ|Sî¦¡\îÚ‰[?›‹~m\ã/~mW\â\îqŠ¾ˆZh™ûc\á£yFÓ¹Ò“Å£ıj|5m÷\Ãi¿I¡†³ÀSzk\×G—ÿ\0öl·v-Š¨ñ\ÍSù\0ME\ØO\Ùôwñsso\ë\Ò\×ı{\Ç>kù\'\Ü\\‚¤^!±S·\Şf\á¯Q\×D\î*w#\İW’~µx˜9cx|Xf[q¥œQ:a\Òd\×\Ì*Aò>oü’\âø\æòó±?d\Ê[\í†\ã{lşUü-\ŞF3‹+(7À†\ÓC\Æ>L\Í>ü\Z¾\Ö5[¶”\à\æ\\M\Æ÷\0\Z/s…¾r{¹B\Ş-1\î\ŞtÜµ? ™K\Zbe™U‚\É\Æ4sf\ãº\ä^¥<F¯•¹ğmO\Ó7½]•2‹\Ãno\Ò\È\í§¾µ\å©i\Ôøj.ª\Ãrù\\Š«ƒ$i\Ì\Ş\ãÙ©’\Ü¢÷\r{²i\ïVA\Ó\Û/Pù5¦ „\Ãä«¶Zÿ\0,ƒf1ò µ,ŸKAc·)k­#‹Wj¿EA\Z³–#úYB].\Ãu/‹tZ­\ßÑ“rcV°c¦-F.5BQ5-©m€‘°+\Õ-I~-vñk\0ª\èˆN\å¹ @Ù‹Yv\0˜”;A‹\àøº\Ç\Z60„\ìV	¶\Ô\ÔxÑš›\×ğ;3õúı•\Üğó\Z \Æ\Û\Ê0\î°\âô²\"\ã Š€MFø°±(	qc\ã\Ó[\ã\ÓS~ğ×Myıø5N\Î0N>–ş)\È\Â<{»\êZûa¶6\'\è6\ãEùoO\â~¡1¾fŒc\Ğz\î^Ú©X\Î~/·yB¥9lBÚƒBn™¿\"?C[ıø†\íù\r\Êw\ìû\'\ÔY>¢\ÉõO¨²_u…\Æ\áÍ€¾\ç6^-®Ev6…­;¯®\0±£\ÚóºğZü»\Z\×ĞºÈ¶¼6¸n\ëò6¸+}‘­p¯ÿ\Ä\0\"\0\0\0\0\0\0\0\0\0!1 AQ0ÿ\Ú\0?³wúY~‰\çq¹\è\Ş,\ÜX¤&9P\ÛyNˆ\Êı\\±,!-\ÆÄ	A>Š¢.Ç†ó,\é¢X‰©\Z\Ä^%\é\"8RIQVm:%\Ê\Â\ÃöG’\'h\\¡\í‰*kŒ¬R)³m¢·C„Ip¨]Š˜\áK\ÒÑ¹ĞŠ#\Ç,ƒ‹è‘²Æ©b|GÑ¡\á”>bhl\ØNH\ÖPû+\ZcTA\Ñfô9–jú\É}\Êb{´C“iTY9›bf\Ü#¡Ë‚\ä“\Å\ìX\ëFI\â8dK)RQ\ê1j³\Éû„\Èòñ\Ò#.D\Í}Kt.N±¨J-a<JO¤CQ\éº#­Z»º<¡¢/I1\ZŒ\ÜTX\â\É:¹$\"+¢\Ç!pAr>‰H–.isB¤‹LI|—x³O¢O’\Ê\äx\Ó\\\ØÇ¢f£¥‡\ÖRJ78\Òô¸ŒL‹¶j\áõ—ˆFØ‰EV“¶š1gMŸ«/\ÓKV†_\èğ™÷-ş›s\íD¤£\Ù\ç=HHÜ‡$\æó\Ìy*\âû8ø(šzO¶Qı/5\íY\át7\é\ìg\ÌVk\Ù\ã[²…QEQEÿ\Ä\0&\0\0\0\0\0\0\0\0\0!1A Q\"02aÿ\Ú\0?\â‡ªÿ\05Q\ÙŞ¤«\\l\àÅ‰\r~\ï\ãıŠ\Ğñş†ˆc±ED\èC‚f\\\\t•\ê…õ^š³ş¨\ä\ÙØ¥Z’´d‡>j1­\ÃyĞµ\"½d”A^\Ù\"Qo±ºHªeŒ—DWEYd{\×;ğÕ‰JB´÷‘™Éœ˜\Õ\n6G¢NR#\ÛŸJúß§|r>)~‰ú&{\á;K²\Ë,‡lkKK¢>ôğ¦oPº0Het)5Ö¦FD•™\Êõ‰ş.ú+\\IG‰“/TB%\íE‰b×§\ncDF\Ä\È³\İ(\Ù(P½\âÈ«zc0«5D±#\âıdúZô”z\Z0c¥l}oìŒ“\ÚD!ı¤O\ZÈ“CÁ\"8œ}Oz)V\Çµ‰KhRD’…\ÅY;&ûŠ±@hŸ‚V\ÈG¢=\ï*<Šrtqq™\é¦5\ÙG3ş\Ä±tGİ¾‘\ret¨B,±Ï¢QL\Ã\Ä/v\Ûr­å•±Gô45HÂ„G\Òô»\ïS•\"O£´G_c$\Ìn›C«ğ\Ê\Éøa¦Œ‘\èûR\Z\Òü?’\é\rtÈ»E?¢?û©#\ëj?¦r\Şió‘9ôøó1\â\ÉE\n-œÀŒøX±\Ê\'c‘—\'\ÔJ?Œ#.©—E\êõÈ²\Æ\Û\ßñ—DO±—¿\Ã‚}—\Ùe‰–Ye—¯ÿ\Ä\09\0\0\0\0\0!1 \"2AQaq‘¡BR#0br34@±ÁC’¢\áğÿ\Ú\0\0?\\\Õÿ\0\Ê\î¨\Å\n\ßR?Å—(evW\n\árU\nŠGø}\Õr §U¼Lª•@WU-Òª±HÙ¸WÊ²¨\å\×oº’ \n©Ä©\è¤\Ğ*¼WÊœE¯‰–\éeC¬e\ç>\êŠ\êêªŠ”+N%B–™*J†ª_ª‹»¢ÕŒaª4…xc;ÀO=\Õõ\ê†ŸL\èL.y÷\È\Ç €\nÑ‡Wÿ\0¥¯®Zp«\İIqœñû‘\ÎA‚´»@P«Ÿ…,Px¿\ŞR¥A]ò\'*Ü¨o²/\Ä;\èFl\ÏY;:²\Ö\í™R~yx\ËIûT“`¤\Ù|KòZA\İLş¶^\Èmˆ\ìPM\Ã\år¾9\íµ½€ÎŠŠ&ş„¯±Rˆ\ê´úfüSó\"\í¦¥4w\Îs/ı;É¤\"E\ĞkzF\ŞıÉƒhh6Uª\0\Ğ\çuÂ¨Ğ·š¥»¡3ù \n\æ¹ú/›\Ñ]ŞŠ\îô_Ú \æşÁÁN&\É_Û½ÁxPÑ” \0U`[¨dVñ\\*4…©¼;\Â`—j\ÔüC+ú¯_\×rş¹_\ÜıÁV\nÁYY[’q…†\ìC\Ùoş–™P$;¡U\Ï|€\Zş\à#ğ\Ş\Ğ@¸.eoeoeoea\è¬=È¸[\ê¸Gª\á©Û«ï¦€Q³D\Ì]q:óŸu«|OúAº\ÃÄµ´\Æ$\Ùo\ìV—\×.0¸šˆ\Ô\\M\\A02ttZ0\å\î<€Sø—†òŠ•«\naA¢œ­ú\ÚòAšd¨\Ä`ou¸Æ”KX\Â„\ÜZWôÈ°#ªÓ„7\ÜnVòƒ\nV€dúC#°TRœÕ‹\Ôy£ˆÁ›J~+\ÈøzmÔ¦—H…§K\à,C\Û\"Š\ÔA\Ó\Ía\Zu‚|¦\Íó\rt\ÂÒ‹†\'å›´©\å¶2û\æ\à¿\\´\ÎIøM\Şh‰XLia\Æv\î\éP±Oq“‚)\åÖ„ri\í•AÇ¾Pš2û r¥Ö¨ \Ü93ş<‡6®\î†#÷‰0\'\å\nÀ\Õ\î\Ë?uJl5\ÙaøR	Q½\é”;3›‘Ì¨R,P?™¥³A\Í5¬\Ã{¢\ÜÖ‡™tP¡?µ\ŞL\Ëµsv1<\Ñ‚[4p²-é”µUUYn’^NGd\ä\å*o\Ö yZ.\Z¢S´¶1¤\Ñ|9k£˜ª\Â·/5\í7Ì‡\0Zyñ?\nd}A¡­(ø\ÌE³NK†¨jm\ëR„[#¬\ïù_—‰î¯±­¼CôbrŒŠğœ†•PlWeù®~¯\\Š~£\ÍQ\ëv£˜@ƒMÛ·E\İW7\'ú¯%IP\Øòj·\Ü%D\Ño:©ÿ\0\Ç7\è)U«\rĞŠ‰i!i\Öa_`œû*\ä\ïòW\Èz«œœ{e9»\åmg¦\É;:FÄ ŒX…eP¬2\ãu«SVœŸ\ã-<ó\×\Ï\Îq´Jœ¼)J#’î€„Ş±>«¾rö\'\'«_¢(¨4\\\Ñ3|¢6#™¢‡4G`¨( Rh§)Rjr«A\ÈùµWp²\Şv	G£h6	ôDš¸¢‚>\ÙH\ár®Zº\ÕU¨Û¦\Ë`*ƒ\Ç\Åi|»K\Z)\êš\Z\0ñ°b\æƒ9\Ëö32:(ç–“ge	İ²\ræ­Í±UV\ír¤ÕœÂ›Éª—P.¡\Ì(\É\Ò\ë4uZbAª\r\r\"¨?t	²2˜\Ëÿ\0Uä¨†¡\nFT\ÌA\r2H[¦¥`;W\çsA\Îlª‡FUˆ\ãˆZš,˜ù@»_ş\Èi˜µ*0\Üü?Upwòj\Ò\Ü6œ¡\×]‚„V+uU^kt¯\Ìo\Ü)õ­\×5Zœ\àt\í4Ãˆÿ\0µ,ş›h‹¦ƒN©\ÚlıJ{]-/ _˜¾X6*0šOU\Ô6\êNTC7|Á\Ô(õ±U`Š-Õ¼{!‡†-T\Ò\Z$u\ä¿\ã~\ê“8\ë\ÙDD*Št]ÿ\0\ÚkEq\Æß¥È¹ƒF ù\Ô*·y)S*wo™BTôD!«™X òzœ¤˜_–\Ó\ä­\â\n+÷\Z’œ\êÃŒƒô”`ˆ\îh½üW«}¡P¬ø\n‚Ddôk™G°ÿ\0N\ë€\ê¾§¹¹T\É\\\ÑÑ‚/u‰\ìš#²›&ş\æT§4ùP\ßE©\ÆN|ò’œüN\Õ\â•ôd\\\"{QG5ˆ\ë*\åˆ\ïÜŒ”L\Ù~#P:™¨}“L…Iû¡Yğ´°šHr˜\Ó2ú»\Â8g¬\ä\×bPE–\Ã\İXKwi­_¶m_ç¢…¢\ì°ğ\ÅøS\Í9’@\ìñ½;§Il;ªl¹†£’ŠEM\r\çrœ\ç\ï].t”\ì|w·\r­l5¥b=¶/§„\ã‰:\Z%‚\Ò\Ü;Ş¥’°¡¾}³\Å\Çwş1+Sª÷T¨\ç˜*súå¾·I\İÓ’» ş\Ô+‡j,rs\\\ÙM\îgòlÊ†b¶\İS7µw²\íT\ä\Zxz&´‡^5tA\Í\âjcù‘;$\ÅSX,üA>–ª\å2±_\Ú}\Ó\\l\êñ\0¾†ıJZC\Ç>H<ñ4\é9O_ö¥œ\ÔYˆEÀ[y8Nö5´L\Ö{ªT\çA+\à·\ïE†\Ñ7ˆ]²*øL\àg¹Zº\'4\İ‡\æU9UX„’@X ™:uz)NŸ(\Â#vB„Gu\n;i]Liû·ÿ\0¤4\Ù\ÍNk®\Ê-\áL†[\æû\Îğ‹ˆ«¶	°\êœz¢\ŞÒ°\ßõ569&ö	\Ó\Ó\" ®ğ›\Û#tö:\êT\åS[„ÿ\0‡M[\Âz¦º§˜u\çr\âvóÿ\0\èl]&Ñƒ\ß,SöG«ŒõMğ¼\æ\ÊöZrEL\Ê1mKÂ—xU\ãk¨\È@\Îğ¨8r™t\Îò2\í™\'ˆÔ¯» D ‰\ê\åŒß¨Ju\Óby!\åBªiPO¸ª*¢A\î\ê™\Ş\åi\í\è©\Ä\ë”\ŞT„\Ùútú&;¡S°:\êq”-993¸*\èAºº’J\Åºsˆ±ZO\" X…U+¸3“Oe\n‡h7šs;#=Q\ËùJo“”FšwSòY}LiÎ‰Â—•\ä&»¦E\0\" Œ´u\ÉNtP§š“t@™›\ÇP®pE\Ù;¯\ä°ÿ\0€@\ç\ìš\åD2=ª¼f\ê\î·ğµ·°D\n*¥Q;æ©½öeG>E\á¦ET\">Œ\ÈD&öMœ¥EJt…¼ò¦£ÁT*¥q.«®€\ç\Ï>\åS\"\á=8Ts[‡R Ÿ\n4\'¸¾\ås+€.ğ¸gÊ l¡Ş«x’¾e¥¶G“º…G™\î¯_+{P*¦‹N¯U\"¼\É+\ãb\â´*®Â—B\n±\n:¹9Rª\Ê\Û}6*Šï”¨²\İ\Ã>aˆi\Ñ[`\Ã`N\\¥6do\'Wü?\Ë\ÃlõÛ€9®m*y‡<\Ö!º¨9\ÓbŸ¡\\¬v\ÜGE\á7…\İ\åyXS\îô~\åL÷U²\ìu\Êê«²\å•²\âö\\^Ë‹\Ùq{./ddû\"e4\ÊlŸe‡Túı\\•ı•\Õ\Õı¯²¿²º5WW\\J\êş\Ê\ê…q{!Uuÿ\Ä\0(\0\0\0\0\0\0!1AQaq‘¡Á±\Ñ \áğñ0ÿ\Ú\0\0?!öı§‚øš£óõ>‡\Ğ>ÿ\0\Üúl\Û\èG\à	]´N1òKCgĞ‡Ô‡øŸüQ¥ûöLÜ´\Õa\ærcıS†©²e§\äO¸Ã¨}¡”%\â_˜7ş\'øf™\âK‹ôuô*şsR†ß†&¾ŒÇ\Ãı\Äû)­_JM\æ:„_Y\"\Î\É\ê-ª\\Ç­°-Q)7u\Ó\Æ\àişC\ØôF)k©\\›øø,¢\ØL…\ïD\Û»eŒ«mŒ©M\Ç><\à\Z\îeVÍë¯¢‹\î£?\ÂeBaƒ”-÷¼º™å˜‘önq3\Ô¢Da¹”³\ÛÔ¬.\ĞNŒs\Å\ÈW™\\²\à¿AYÌ£Ê‡»°J\Õ1òü_\í\Z¾\Ì)%;\ßRº\r=Æ›>\Ò\æ3\êg„aP\àC—¦ y‰0›/µ²Q\éÿ\0¶y`qö÷\îb\ÙÛœ³;+\ì#7×™Ÿ¡ò‹ğGo·\êaA¤ŠxO=SG>ehÿ\0¸940\ï38\İÀ%Cfnø™‡RôL\Ã\'\Ügf&k¯0ü=\ÎûC,—•si~á€±jñ—ù%°\Ã\ëñ\Í¥CÔ©l2\ã<LC1A`\ßÈ³jş\Ò\ë3œ|=“0©\ØR\îµ\îS\ßn{ùˆµ‹–;­zŠ¿jú™‡\×\áùÿ\0®Ê€\çS\0zB/\Ğ>º\ÇŒÿ\0€ó™\Äú\Ç$p³‰øIÌ½\ë˜}§,)\ìu\ÍZz }Pš‰‰ÿ\0c\ê„m0MK\Z\áI­]e”0Wø2\Øñ¦7ü \áÿ\0,V8iˆ6\æ\íL°\Ü0·D&…¬zˆ÷.=g\Ó\à\ĞüÊ¾¥\Öõ\n£–©\Ë+DEKƒ—,!&!^\Â9²{¢|ABÊ©B¥\'p\ê\ÏşA=,—{Œ`¶a\×3\Ê1\r*8GL<#¡ºAfZ\íR Z(Õ¯rÁ\Ó\â\ç\ÂrO¹(\Ûpk/©“\æd—©°—TÍ˜¤=Ô¬\Ï\ÙÌ»°\ë’FÛ¿\Îiˆ\Ï3º\çoßlW{™DV3‹*¾Ê³~„î©º¡\ÜVÔ°\ÛSUœSBP%õ\Ñj\Z©qaAj\Ì\ÎR\Ô\Õ\íTbX\ê>’¾¨1 ‰\áG«-Z\â=}\Ê5=3Â‰ŠKª\ÜS1_@)<G°\Ô	¯¾\Ä\ÄcJÅ‚\îaX}0¼\Íá˜¼’\Ä\á1\îrK—¦=2\Ç0\ë8@K\×ô%Lò?3şT\ßN[IÀ+qaZf^™vwÄ¶\ë‘\æ#\"u°|Cr\ìB³1Ë²UŒ,J\éş“2\09FV»\çÇ™n—O;˜‡G/\\U\Ì!=¢O2\ÏîŸŒó?\î\Ïı	ÿ\0«2CŠ/¦\à©C	ª²\Í÷¢{tF‚†Ë¹r‹_3$%)\ä4MD\Ê\\\áŠ\ì>\Ğ\Ğ+3A—A°š>Ó‰õ6Rÿ\0ˆ‘qÆ‰¶r¬\Ï~Z©±#®lh˜Q.]ˆÁSB—\Ä\É!Zô\ê+\Õ\r;‡hc)5#­qf3R-&D¤©©R8‡S™ø˜\Û\í0ôe„\åã¸ˆ\Ä\ãŞa\â¸4é˜³‚£Ÿ0ôW$°!£\Ğf>²6\İ^%\İ ~f‘}È¼2ÁÃ±Ä¨P\ÖH²òS	bÅ£1°\ÔI46Wr\ê%\\r<®\éñ/øS_B¸ù©—´„\ãòÌ•Fò›©±¸F/S+%K\â1r\î°;‚\Ñ*Ê·“ù‹Ru0\reø%AW\Ïs\Üp•ú,û\Ü\å×»•\ï´1™\ç\áô\Ñb¢9å–·\ì3>“¶-—*˜\æb>3ùh\'#š–·|MŞ‡a1\\\Ä\Ö7v\Ç\ÚX]×g\Í\ËA¨‹­şeM\Ù³7/\×\ç\èAn\ÚÀ5¡–‰V\êQ-3\éU6m]©Tâ‡¸h1f!\Û\Ë2¯sk6\è€_0:c[•–\î\å3÷šô\ÖFó“w\î\\hX¹|\Ëpu†šg¹\Ûùœ#´\İ)sô0±K¦\Z$\ì\ßÔ¨¸µ’†fæ‰€œA\âR+#\â_¤·\Ñ“‡¸¼°f»e<Di[‹¨±\å\n\Çş2¶ì‚µvc\×\ê&õ¬·\æbW¡÷€}	‰0tûòC\æ.\è…\Üb\Ş]\ßp›†>0xA\á5ôY‡^\åV\å~Sqğ÷.\Ç\Ôif\Óü\Äû˜.ÿ\0rñUû”òÕ¢\æ\Í_©^Q:B‰\Ül¬9ºG~‡†\Ä3†7&(8¸\êT\"\åÅ„ûƒL>x˜ş\'{y<Í·}K\ĞjA”\â\î+¥&:º\Ä^\âb§G˜*l-b\æı®X8Œ/0c¸fT\É\ìs9i\ß\ÑÉˆ—C/\Ä\'’S¹N\ç)¹I©u­«\rZYY„	³L\Ã¦.ğ\Ù7-†S­¾ <\ÊÒ®W•\ÄFÓ‹sG®Ÿ0Æ€[\Ò	ƒa;·4ù¹ˆ½q6\ÊqıÁc°±9–šŒÊ±™4øc\Å¸B\Ô»aKa1-<Y\á¨|\í\Ä/õ/Sa\×‰¬\à(xŒ¸\n÷)ô\Íˆ\äK\Ú\èq?\ÔB<P˜‰®\àCÀ*?±©üR¢(Wø&\Â6·6xŸŠLX@\Ä–F\à·{lg1‰±¿\Ü\ì}GS;\Ú1\Ó\Úy–5)]a6\\\è…\ŞÚş¥¯\Î®¥g\É1`\Íø\è˜B¿4¢ø&\é\Â6¥˜üõ÷:‚Ÿ¨:Ú•q\Åş£\ïZfLp\Ék!œÀıÜ¿Š€\Ú*6\\w\Â\í\ÑÜ°·Q:\Ûu7Eğ¿\ã»/I\äDu\Ì\Ğ`ı\Z\ËÏˆBô˜LHO\âmÊ¡S§\çğÆ¬0\ï\Ü\ßuÏˆ¹¬TÇ¢\Ãm\\öüã¨¬´\Ü†\"\à\ì\ä”6Kª\ÔÔŠûpdDÍƒ\Éqù¤8‡\Ò)d\ÎûT»ú&\Â\Ø:±\Ô\í3e\Û/Õ»\Ïôˆv\ï¾el}2\Û\æaš3\ÍÇ«lü\Ê\á\ÆËš\ëÌ½v\Z\é\æ\'%T¹œG/\în@¡\ê\ÂöLÁ\ëjòº„\ä4\\5J†e\ÉK—SI˜`a¿±\ærY‰^\ÌøT\Î5\×õ*\Éÿ\03{\àü\Åû•X\ØKi\Û\ï-#ù†´Xzw0\rû¨\àh”B€\0\ÈEnŞ\â\ëzÔ±¨£\Ã%¸\"¿¦>¾`‘§\ÊB\ÖióS*ÉU½ñ\r°µgÜ‰`æ ˆ¯‘¨İ¼»#\Z»q~x€\Ø\ÓY•\Êm\n#Zx•‡\×ğ™L¢Æ½hu.Udõ7ˆ5ÙŒXÎ‚;>o\ÜPyC\àŒ\Õş!Á•\ZmŸ\ÄW69Š]y·p›î„©`(18`‰ˆø¦®[À.ï‰C5^f—“©$W\ï£&p\Æ‹ÿ\0sViI‰G”Eè¯™O\0˜%ó‹”\ÚRŠ\è²e|¶ø†À\ã8œX\å±\à†Jc¯bõ\êŒú\àı\Ê>µM˜Z\æ6\Â\0_•¿R\àº<¯ˆ\Ñ=Ba¸#\Êø\"5”z¨­ˆ9\ä¦aü±\ÍL˜\åysC”ºù1c²úƒÈºoù±,YÁköYÁM²”°8\Ìø\0^\åj\ï2\İ/ˆü\â ‘ö\ÍÍ‘qÁ] ]ã¯ˆ¼g\İ\Z\Ş\Ğ6ƒ®@††8\\|\Ñ\\\Øm-X%üM¹H\'´>‘¨e[ş\ÌH0\Z¨HsØ¨—|\Å\åµ\Õa,\ne‡m%\ÕxŒ\r¿›œ\î3(û\Ì\'j\Ç\ÌX=\Ù,¢¡\â¹ñ,	’ ô%\×Q99\ïŠX\Æa¯•.úq\nğ0\Ñ\Zô¹\É5÷C\Z*!9¼\Ñ(!–X<€Ê‹I$¦òBˆ ˜.¯uoŸP­iú˜\rC£\ÜP\Ø\æ}°A[¾\àmüGdˆG¸U~L07\Óù„\Ñ~3\â+8‰Ş¢prñ,[£\è(\ì([{ñ2M.º¼ÀPÿ\0˜õ´ş%*3t³>&ˆ÷{`›‚\ë\Ñ\0Œiö&)L8¬–†µ=\ä~\â¾P{ÿ\0±g‚\Ç/sz,):K4\Ì÷Ä‹uüxF\İÀ^òb\åZÜ°.‘w\î3­]<1Iqv>f \Ö\'ö˜7U{–·‡‰•p|\Ì2\í&T\çQ8şr\nR\Øú|\'¥zn1\Ä}ıLu*WÁ\0–¡[\Ã\Ä#-‚< \Şû\n¨\Z¨x0‡ya“z§Ï¬üG¤K‡W/0TA,}-\áGñ*U—?ˆÑ¶\î\'msz”ùGH·ek	•l\ì?™<ó\î\İ\Ñ®\Îù†(xJQmó7[jYkX\êsÇ®!rùd\à9‰\Ã\'a¯ˆ¶7ğ¤W\ÚwÈƒr&‡8y•3&QX•©Ÿ…IBPM.D@$\Ød®wB	8¿Rß™}GZ™\ÄĞTy D\Û*£‘\Ô\"ê¡‚qQ³\Ï\Ş6uµ\\.\Z=ºf%‹ƒR\Ë	K­T³\Ñø†s_–Ì¾ fôË¢‰\Ø\Ó7\Ñ.‡\Íp\ß’7\Ü2ú!>ªZ¦y\ê»A;®f|’™¼Šÿ\0¹G17ú‚E¯2\èk7\0™¨”¥¥®Š¼\İöu†ñ¬Á`,¡\á—\Ãæ”‡\ïX¯\æ?¸Œº\ä\ìÍ˜ñ‰’Á¨Võø ƒ†´LÖ¼\Ëu­\æ|Ô°µ\"÷«¥ş‰\ìmúF:]M\ä^H¢ükOÚ•lc0*“#.ò\ÒN.wnŒ\æU!¹“BªZ¾R\íp³òüGz“´\Ññ\Äe\ÚòÍ¨†§Zšw\åGg|õû™[u\ZSA†\ã\æ\Ô\×;\"r\Å~\Ì0\0˜Á÷~˜B+\ÍjQA\Ó\n\ÄEŒ­Â§\'N!\ÃJo\Äpµ\Ö\æ\n\å\Üû„7\ê#º==l›S\í/Q†¶\n›¨\ë\Ìş\Ì-ğ©I6½EB#ø¬­Zÿ\0›ûF\ÛU)[\ì3q\Ñ9Mlò<KC°\Ï¡\éŒ\â ›\ê©ùYVqc01¼\ÔNº÷+U•À\ÆJ”ƒt~`}KJôVhwd¨jc¥_Ü¨­T/’\ë@öR¢¿`\äAr˜\Î¸‡dQñ”õLò\Í*ğñWW¨\Ûa´ˆ™yO/±¬™7\ê-c}¬\è€ysú•ö)q5XòK4Ç–\çf¼³.\ã\Ê2\Û55%9–â‘«\æx37h\\¦û–2\Õ÷\ê\'hô™“–\å\Z\ê1Iw÷&U–G=D2­Z¹/6ÿ\0sÆ«|¢¥\í9…]{f–şh…Z²q9”X\î\àMGı÷±\ÖeÏ„E\\3A†’\å\Ç\İ}§= ×‡ı\Ë\"\Ôm‰\Ú\'¾3.*\î\æ6\ê}ÿ\0\ìsAnœ[o’¥\ëi$6jeş(™\Z˜¼ˆ¯«£Ÿœ?©ò§†IƒB\æ²#€>X\ìôKfEuù„q–~\Õ\ã Á§¿¡,¢¤Ìˆ;\×\ÈA^¿ÀO\Ä8>«,x ;,·\â\ëWÜ·hh˜|Ä¾X\É\ËŒ÷˜¢÷O&\"œ\Ç\rÀ\Ü&1¡\ï¨»÷˜¹I6Oi‹X›ƒLSñT\ç\Û\Zÿ\0\å\Æ`{fˆ½¨l10sHÿ\0\ßyC@GR!­m\Şú…5¨h65³Œ[5˜\Ù2J\×æ”±_07¯SŸz\Æ\É4F\Zb³£\æZ{!…¸·[J¹—Ã‹[‚8¼38‚m\Í.S\â“x×‰_\ÏQ¸ó2\r\î±6\Û/\ÄÂ5z„Kaô\Ìø\Ô\ĞÁ±q\ØOLL3\Ä¿	3-³<§³/.?¨Ô™ı\Í	¸À¯€ˆ¾\æAK²˜x·\ÄGd4‘€\ŞMÀ¨¨WDz‡¤÷.~Y”M’\è)’öÀ\çy}°„@Z\ÑaPG/r\íƒ\æ81SO1”`\ï,\Âñöa²>É¿\Ş\ï\Ø.\0¼JX\ÆZúË½’—÷a­?I[+*·¡²~e˜‹Tn\îP\"™º\Û3÷Ï‰^o\é>\ÔGöš\0\\ÿ\0\ÈÕœ¹¸ğ­A\åC)+€~sx>§\í‰^U”{0–\é5\Z1sµ\"V­\è©pœœq(§R¨\ì¯´c“\í¢ÿ\0u1\Ô/ˆ¥†¦\ïO˜_)W“P¨\Ó\ÜÄ¯i\Ôj\'H>&:¡\à\æj\ÕğE\Ñò®oÜ­\Û\Ü\Ğ0!O°w/G\æ\è*!¡™³m2xú$µ\Ù¿©zQ1z¸£;©†·2n«‰}„rQ‰\\n\æC\îÀ«^¾\\q¢h÷ao\Ş@@TTÚº\'pÌ§z:ˆ»x³¦\Î”-=JŠ˜\ê€\ÌÅª!\ågñ8æ »\ÕÁ¦¼G•”„sŠ…|wO¸¨;¯11·©xc\'p	€}\â†\Ü®m9I\Ê>„¯¥Lmj­‚5v¹/¬±°†©¸\áÉ™Ğ²m»a\ægs;»¶ ù‚<’º˜¹F\Ë\0\×r¼„!m%¶pø¨ƒ7\Ù<o²/²x_dğ¾\Èô¾\È.)]#İ•\î‰Re]@±OHK\ç‚ZiÜ¯\Ã\ì”ooD°·ñ \ÊüSJ|&dl­=\İ;\à•\è`\è•ß©ûtD\r\ë\à†(o¤ÀıHGøŒ?‚V{ø#şÿ\Ú\0\0\0\0\0\0Q7¸¾x»^şqƒS\Ë\r[Á\á\å6\ÕüO.\ï«<g\ç	¹¸Ô|ÿ\0¿÷l\İ§p£¹m°o\0|\Ò³\Äj N\Ô\ÓQà¼»\"\ê\Ö/’	Wò¦º+”o\Ãö\Ä\ëy¨d«R’’¿ƒ\í.wôø&ù	øŒpE\æš<)%ƒ\Ë0*~\Z¥ª\Ü\Ô±\ÌüZó±;i\Í”\íó[=­2\Ü\'Y\Õ\È\ì.EÊ¨’.\ÜB\İ\ËBJ\Ğ\nPŒ…m©…6¹r“¥ê¬Kpn^\åI8Õ‡X\Ùx\ÕÉ‚µfŒ4`«™ˆ¯rr\Zls.ßŸ\Ç70Œ\Ó\êP1\ìWÃ¯™¡r	ˆ2S9<\0 \Ôp‚\å²÷†8°\Õ\àp=0ğojS€FüJ”˜¾\æ%ì¥4^œ˜­j®bó\0¡ñ\Èu\ïAô`{ÿ\Ä\0 \0\0\0\0\0\0\0\0!1AQa 0qÿ\Ú\0?\Ü~¡9?Ğ‚]¶\Ç\í·–$½‚ùşt_÷ƒù–~·Øˆp\ÎÊºŠ\ä\ËÇ€á¤‹,}\Û\á!68fV9w6ıE\ë,ƒ.­–²O¼µAd\Ë,\äöõ¬ñ€“\Óc´\Í,\à:O»mº\á\ê\Î÷be¢t½ ÷\í\ÒA¿‡\Óg¶.Á}R2]4Nn\ã\ÃÁ\í\ä—K\'öş·›¿±ò;Gv\0\İ\Äõ\ìù}¡²c\İ\æ\ìG\Ã\å³w\í‡`òAg>ƒ7n¯„‡\Ø.ú3w…t´öÃ\\c¨e‡ğˆ=D1–º†1‘À‚ß¢u\å–Î\İ6ø\Ã\n´…\ß¿`ÙŸ+±f\Ï\ê\ês\í\âK\Ô0·\\¿7Y\Ó>¢Ù´v\íR\Ãm=c~8\ÙÙˆŸ%\Ö\ßK\Ñ\Ç\Óü%ˆ\í¤÷\ÜD\Æs¹[ô—$\ï¼\ÑI\î!“m«¶ñ\Æô6vóŒù:…ò¬\ãO²úú\Ø÷ŠK\ÔbøMWºY6r\éb\ÂğÚƒ-Mö\Êlñ(£É„\'¼OoeÙ¼l½\ÍŞ¬õ\Â0ò\ÚÛ´f\Ù\ÜiÉ‹¨—\äc\×\á\ß\èqCÕ™Ô»\Û\év?’Ü’/‰\ß\å\Ğ\Â\Î\0wos\í\ìw³0—B{[xˆg/\ä).\ã.‹òø@\ãt\Ùu^:\ã2\å™d\ìøo¼v\àöpQö`ŸnÀ{µû\í›\'yl\ë =²G\n\êW\ç\Én\Ù\Ôö\êÍ³8Ydo‡\ê\r¿›2\rºY–ZÉ…†ö±ùaùc<‘ùòE\È?,~_ÿ\Ä\0 \0\0\0\0\0\0\0\0!1AQaq0¡ÿ\Ú\0?¯\Â__ñ·ˆWW\ï\Ô|	rı‰]İ³>}O’‡—XO¨ø±õ}l\Î+¯`>D\ã\"\Ó\É2\Ù/\Ñ«¸üvŸ\îRrñ:\Æò™VC5\î}¶\Û\Êü·HòÅš[&\ÎNZµ–Ûø\Şq\"\Æ\Ú\ÌIñu“ôZµùj\Ómvt9/ÕƒEkòü>Zv\0Á¿¼^Üœl‡“cmƒ£d\ã-\Ü|>I„¹\îB\Zõ|+²Ae²\Ñ\Âv^6\å\ê\âüF7S\Ñ,‰·]Kz\ŞgÏûµHÃ“\×nA¾¦\ÂÈ¬—è“»e¤ô’©#OŸd\'dZZrf\é]YD]°,\Z·\á8{Î‡²XÛ\ÂA’k\ÜCô…òúú>\'­˜l:\ìÁ†Ç³\äAœù4eô\Òü/í—¨a°a²ğZß¯7Fzdr\ÃP<³$ü·{`x_v¸Jl\Û\ËcÌ¿\ïg{>„e\ëH÷:E„`^^\á \ä·#>/±‰\'\ãöĞ¹¾}-„{\ä\ÈÁ\È#nµ€lø¼I°\ã\ê\à\'¡ğH\Èú†\Zû=¿\Ø]òy<{5„\Ñ¬¨sYõm\ç—!\äO\Éı¯Ã½&<¹¶.\ã \ê\ä\ßbŠ\Ë\á#Ï\í\å\n\×a‰Y·&û¿)i‘KBN\Ú^‚8»‡ÁSIß†À-®õ€’Ş¦œ›¶¦A\Ñù}_\í\ËkG\á;\Û\Äğ”ş¿ö#1\É\Í\ÉÏ²ß»GvWƒõ\ä\ÇOˆNnF›­‹»’=–rVıö\ß\ÉÌºB\Éû\Ë<½F>6m³O\Û<0\Ç/Ş—ùl\ïÀ°\ï	#\É>Ò¾Ò·\ÙRo°¿ao²¥s²¿moÿ\Ä\0\'\0\0\0\0\0\0!1AQaq‘¡±Á\Ñğ\áñ ÿ\Ú\0\0?£Wô‹r+Á=a–\"v@ğn`fdˆ„Ÿü¹_ú\ÂT\Ô?ğ„X•r\ì¯ó¾ıD\ßü\Ïq\ëôV%–N¼û\0W’›\àÿ\0\àÿ\0\Õ\á*\Z!+?øO—ŸH¥®\ßâ¥©\åg‚*.pˆ2\İR\Ï2\êĞ¥øIõ!g\Ò\\SI\àLr(!<¥\ÛD\íT\ÇqúAQ§9‡_cD%\Ó\Ôğ A9ÿ\0\ÃS•/\Õñ3Ñ¯A\â*ô?\ë\Ú9sQñ¥+\éò­Û¯\Ñ\Z¼‡\Ù	§\ßCğÀ®Â˜)’\Û\ä\êiÁ\Ø\ìza†±\ï¨$¨V2\Üs„\\\ïQ\áô¨\Îc\ç(\Ë_c\Zğ[¿\Ê\Ô\à\çG©\Ì\ZÔºƒ/ÿ\08˜\å\Ó>\"\"u«5¬@\Ë	¼û\â~R‚/+\ãò\Â-@\Í\è’üLMúR\ÑÕ\æ%|\å=¥ğš£\Ëğ*W’L>N/¹¬°‘ñ\Ñ\ïP›LlY®÷]•ÀU¬\Ë÷Íµ¬[\Ó\r§¤H(9\r[\â:r\ÃÁ\èş\áGT\ÉD|\Õß¼»[c\Ä%\ë\Ö\Ôi®\Ş\Ä\ß \êºòhvÌ¹³1Ÿ\Ğñ0¥lŒú½:‹:@ğ~YAóe£xJy[—\× }ü\Ï9@H\Ó˜ùó\í´§—\Î\êrB½G\äñ£*\r9\îi~Xƒ;[}X„V\ìKÂ‹\Ïa\İn¢\Ğæ£˜i\é0\Ê@Qª\î\nRƒHl{ş\î%\rm—¼½#sw’úı0ó–\à1`Ì¬5¿\\ò–O`\íñ¥\í6»ƒGOû¼øˆG\Í^V3L8ü\æö`Ø4	\ÏşZ˜»~vÊ¿YR¢®;E$ÁcC»üŒ\Æº‹Ršrºˆ‚\\H¥iºÌ¨\n\n¨\àm,/o™Eg\"\ßin¾¾(\'6c¿\Ö9Ÿ\Õõ†´go>e\×\Û#$\Î\Æ+\Ô4A¶¿	\ïÀv\ê?*¯\Ë¤|	\Â+\Ñü\Ä~„?õ9uyóbğ˜˜ƒŠ•1\Ö\Ğ÷DÍ¸˜€\åÄ¯\â\İ\Ê%@\ÃZñ.\ÕCJ9yø\ÔÛ‘lP.€k@x€¶q\0Š¸H–e+#Üº\n–øô=÷0ô¬¯PĞ†B>:€ ü†\Ö\Ïb¥\Ø¡±t=b–µ\à‚di_<%ş\nXßV #•\Ğ\ã\ã÷õ\ÙN©~\æ¸1\Ì<*¢|¿1‰<J-ù<‚€{n*\æ\í¶\Ö`\Ñ\\LLÁ—¨F¬´FMËŠr\×mül˜uX¿ô„*ck\ë\ÔBŸW\Ã5M@xxe‘¤Â´o\ë±I‹Õ—Y\ï]}#¦Cƒƒû²e\È*§\ï/\âZ”E¡©„\Ì{Dµn:~zC¹p\0´\Ñ0Z\ß,Ê”\'¨\î	ŒzüL\à\Ê\\©p\Ü \Ë1Óˆô¶k~ \ÔV@4í£³Ï´\ì1Op\ÊÀÅ›ş\Ã\è£\Öl—¶™Mp 0oş}#ÍŠCR\í\îa\Õ\ÂK¹Sõ`J{N„cœi³X}.4»ò—c©õ”öŠ5ªµ08•¸,APóCV\Øfó”şõı\ÊÙ³8şøŠc« 1·2ş´Ê²®øIJ‡¬\Ï\'\Ò.P\ÒrZù\Ì[Œv.şœ2°\Ä\ÔJXŒ\åûa¿Ä¡[¬øC\Ì\àCõ¹Uƒg\×û\ï47 ¨\Üõ˜\ã8Q4”vBT\ÜF\İ²\Åj4mzú\Ë\ÚC›ptK\Ôx(–±a¾™`Áwa72	‘†%~O~`#@¯\ÍÂ¼\Ø\å\ä\ê?XÆª¯´T‹´LÙw²®J•m\Âæ nñş\âÌƒÊ”ÿ\0\"siYyÑªƒ\Ä\n§‰~¢Œ›­\Ä4Vp\î\rfE¯Oö=\ÃV[Ë¸ö\àÊ–\ËøøPH=n‚û\\J\í\nn!¤Ì©U°gCGó\Ö\Z,òU\ÍL^%š£V\â`vÕ•ó\0~Q\Ûğ\É\ér•\ê_\Ä,+nŸï¬©d/“!AP2@]\ãÌ¶€g§õÀÀ\ÅUKşMc|\Óøñú—~ƒõş“ıc\r\ÎÀÜ†%˜\Ë\å\ä<a\Òş\ìGy^-;™r)»\æ!\Ö\ë‰cd„Ú€¼/R- \Ú\Ø\\\â£Z–÷(†U¶dTôƒ\ë(@–ûDc\Û\ÑZx\Èz\ßR„\×Nj<q\Ì\ÅjV<¯\ÄB#¦®øu\rø^,ú^%À š2HR¯ll\ÅJ\ÒB¬²\Ó\Ü?\ÑıD 	\Ğ\àT9\é~!Œ\çQ3-‚c¸‚YN_v1hıJ…­eıK\Ù³„v\âİ’œJb»/ª\ÙHz\â‹\Êø*`v\í|\Ë#¶^\ÕPƒ­lt§ˆ®¡·\Ük²_{@¦¸€\ÓÏ¼Pdf\ÎO–\ä}\êT>³vˆ}*1œ\Z\ì\Ô]ÁM}c2\n\Å&Ÿ¹ñ”½¡¼\Õâ‘„Ã©H+\áL˜c\Ó?\à\à¥\â4¦—¤kóGO¨Ÿcü‰3`\åø\r.\Æ\äò¯i`\Ê#\Å®^\â…\æ4(G,R@L5ÇˆBA\î©ì–š<\Æ\àğAıJq\Í\ä>óY–£Á\é˜Å¯\Äw±‡.bq\ŞU¿x?•¡“\Õ~`\æ²Y›\Ôd´\Ñuöa\ÇUOT>|2\í\âÆ§¥\Æ\êoşy˜ú\íü¡0^’‡†Ë£º9cªI/ƒ][pc\İ\â]\'$\ÑùVQK\Åı¡¨R®Wµj³Á+)%¼¸\Ã-›‘»?ùŞ¿‰ñ¯#ø?p°‰\á\ä\Èy´>{…±nŒó\×\êkú¤\éŠ\Â\Ç#¢²DQ+¢\ê†yP!<œuQô¼Œ\ÛE\æ#+&]«\Z³yÉ‰LTta\Î\â™M\îb‹v{ªù‰O\Ëúÿ\0ˆ\èW,Júü&R\Z!\é\0w\ëN¼\Åâ·”z\ë®ˆ\ÃO‚~a\Ä@®\×,aš®%7›1gª\í/Áp.k¸ºD¨y\r×¤É£Áw.F·*-\Æ	º”\ë½_ùM\Ók¼@µ¨<T`.u…†\Z7bs,b\"µa\ãu\íöŒ|¨\×\ĞFjfÔ‹{\Ş4b˜…;E\r--\Ê\íC‚V™\ä\æ²z\àWÖ«i\Úù”ôUôó½°\ïó`xª€¿”£Œ¢\"T\Ë+œœ\â\"\êS\ï\È@\0w(÷\È\ÂôP\î¢\nHö–j\0À±¿ü\çCY}\0„mšLñ€üÁI°¿\ßù8®%\ä\èõÙºB\èõUQBÀÀ@—_¬EV‹\ã\ÏÜó÷U\Ğ\Ëm\'˜gµ\ÆÖ¯  \Ä#©LXlvÑ¶‰Š€1\Òğ¸fªyı|?XK‚õÅ«|™©\å¤$ª,‚v\Õ:\àüŸQ™‡G¼$G\ãÄ° .ˆW{ 	^\'õ¨¶Jòÿ\0‘Õ–6\Ü@cEtÀ6K\î\'€Šp?‘f^V\n÷X¼\"\è+?\ØTLz§\îB«h™q\àóˆxˆ«ø¯Ì¯\Ú ×œû0 ]\rJ°´S„K^‰¹ôÊ¡“†m5\Z\İp\\˜ŠÁØ…˜­KV¯ó¯\ÔOŠ(ù\Ô/\âZ¯8`\'¬.ZI±¯Y±£‡]¯\Öv¤ğÿ\0·›\':w)¾“oµ	`\àKˆ\Ë\æ\Ã\æ™æ’IEX\Ç;K±*”av™«}x¬W\ì·-Z¶\Ñ\Õ\ß\Ú,­­w’\ã<¦ıO\ÄuH¯}K¡WÈ&\ÏEqM…ç¿;%hWµŸh›q9i\Z\rl{@j\ÓJŞ¸\Ä\Ç÷¥lr€\Ø/\Å@B|\çó9½\ár\ïpU£ªd÷„[\ß±\rú\á\äœ\åŒÀú\ÕÓŸ1\í=+\ÉK˜M\×\ÒÂ¼L•.\0P°f—z0dQ¡\çø”`A\äf \Õa;˜–aKÍ¸ûŸš+h¤+­ƒó\0–\Z\Ç\r\İ1L4bÆ©û€ªÑ«û»ı\Ëc!E§\ì\r{A\âò\Öİµ\Ö7¤L#JšsV5(…Š1EjU7\â\nÚŒ\Ğü\Æ[ò<\ÌD]V7\0 HO#\İFh§™w\â,+\ÈÀ\ÄT\Ş\"\"õ9ˆk\Zõ„RW\ÄS‡\"¥r\éñ\É0»1›Ï†+WdW³O\Ş‚k\ÓD¸™)G\r8ú\ÂC4Â¹~%Kpd\Ç\äµ7rbôjgµ`ÛˆE\Ûs4«mr~!\Ù+µ®ô°Õ›R©\\SŒJ(hÁ1N\Úú\Ì\Ü¼,°º¸1\æ†75\æp\Ê\ï#\È\Â\nr”²Ï˜‚+Á–ƒÔ®F#1\éó-:w 1MÁJL\ZÌ³˜\n¼Á=;TF\Åü¾\î9ª\ì«üA\Ô\ß ˜ú\Ì¥e¦˜H\æ\îPRñ¶Õ§«\Zwö\Ú_\Ù²®–.\\=!(-\àğõ1L³\Ö,UYK\Ê[\Å+\Ïı˜Â¼ »%oºğò}jVbœ°:er\ËiK-½\Ô\å\íólBe\Ã%±I÷(U\ê1¢	i£Ä§ºycCœ\îT¸XôØœfÀq\ë0ğ\ZGk±†Á¹fV¸‹E“G\Ä Ko`™Zzı \çoUõƒ\í3£X¡ì¤ˆyH§­øÿ\0#ŠÆ¼>a¦øYı`EYù\"È¬£\å\ß\ÅË´ a8¸¡ô¹]–N‚\×\É\É\ï(v®\åjXATó°½–,6,\Å@z2U¨=b4/ºs‡\âüŸR_md½\ÄZªYø_\Ú\Ğ^‰\n¹_£jª¹Ye\ã\é\ãñÎ”(ººø‰€œ,Å‚€7%Q\ÚPYğ,pP¿¬ «­\ì:f¾¶!‹‹@;”_“\Şz!FU`\ï\ÅB5Å£\à_x\é5±@\íT7}“³[~²÷²\ÈAQˆt#Ioª3\n\à\è\âP»_¸\Ô+2«¯êŒ¬^Å®Í©¾WÒ˜\ÎW	ı¸•@\ØúfS\ÌT\nº·\íó)„\Èó‘“Ñ‹\rVZ´e¶	µ7‰KA¯h/§P„\äº\ÌùF\Z\Ç\ì:š)6\n§\Ê\Ë°*b\ê&€1[\Ï\âx;GEÇ¸°¶¦¼©Z\Ë\İ¿ø,+\Ğ!)…ñµøû\Äe#\0\ÌI\\šŠ…7·\íûJÁ¦¯\êw…Tø•iÁ\è\ÎÇ´C‰Îf¼\ÂUŸ‡C™[²\æß‘\â\ÑK)\Æ\î;ıœ¨¢¾\Z¾&\Ûp,–°ø	LƒD9şó!´ .ø\r\î\â©U”\Ñ\Ô\nKnª\ëª÷ 1\à\í%™Š¾Ò˜`\ëü»\"‰\ÒÂ½gxT6Ÿ†}R \0\Ñ%¥õ2‡‚]š4ö÷~\Ä˜)TN!W\rCA~\æ\ÍS¢ú»_?\ÜW^öo÷8%5©q†š»\ïù\É2 Š¿ ù\è«?	=ó\Z\ãIHr\ácy>ˆ¬ònU„y}u.nÔ²\æ\\n—pv¼°\\‚i\âbªœX[\ï´15Ú¿h•”\İÿ\0ËW6›}!€ù*ô&r°\rÓ˜u\á~D!:Rµyš\é\ë–\íö-†\äò\\fº[&\ìÌ g¡\áj\Ş\Æ>`QD4!³®º‡N+\á¬pÓ¾\ä56Ë¦ÇŸ\ËÔE§o9=§sN‡\è\Ì\ç…-Û¡>.[¨„\×\"~\Ø`(«;x\ÍQ¿\Ã>`¼D\\kk\ŞQˆ.‹\ï¯ö\0ToØ˜ğ¾b\Ê\Ã\æŒ\ÄS\Òg\"Pr‰˜\Å#£k‚P–À\Ùuş\Ô\é \èqX®¡J‚¯OX5c9—^b:\Î\ÖW\ìLg&.b\èH\r«\ŞbòTÉ²ğ¤Š\Å,\ßÊ›“¶š#\éH\"Yœ\ì\æUw½»4VOm}¹‰X9J¡·\â¸\Õñu\Ø\\\Ù\àÿ\0’`S\Öñ0-*ùH™Æ°1eù\Ä:j7[<õ\Ç\àV”3™¡o\Z;†	*´\çw™`(†)ô\×\ê PùkOX‹?\ë\ÂB™¶\é 6ü|\Ë\æ•@–«5ñRö\â®\Z \İz‘ø¬ŒE7‹S{Š+	_ı¡u\ã\0p\Ìz®®:½j\ç\ï0”K³±‡ŒyŒ\ë¨\å\Å_Gt¬j§Áª5§N»Šª\r\r\ä£HÀ:\ĞNu„²,¶ü7	eŠOx\è­a\\•ÿ\0 · h\ìóıÔ¤wÈœŸÔ¸¥R‡¾ş²\ÆQE´\0¯¬Nt”[	œ\ëY\ÜU€Ô•\èù©p\äş¹w`,7v\ËTµVaóZ©f\èm¹\î8ö–k\\^w6şq)\Í\âe\r2\Z©\î7ğ\r²†Ÿ0J¬í‡\İJT\ìÇ€û¡‰—@8j}\ÛVYe\Û\Ğ\ç‰d¸-F¹r‘rN\ØVıZ€%¡Ex4·Â‹\ÄÀ\Ë\ÉV÷^i‚b\×9—™A¦°Çˆ¸°<š]\ÂÀ.Š\æ:5Cj­³~YwP\áe—…ª\ã¸\ã\ÔÃ£—~’ µfÚ»\Ûñ.˜0:\r#¨ƒnûú@Tj«W¬hq,°ƒJ¬G¤¬\Ê\r¸Y\Â÷– i…+O¤Ò™\Zú@\Ò.¤»\r\Ìù\nZyZ\ÉÇ\Ñ\ĞhqCË±„e÷‰¬\Z\á\Óq\Õ	r1nµo0—†¦\Üq\é^\å^>²!–Mx\Ä1P\ç\0ü¿IE\ïPŠ4ö˜}4Z_@\Zñ3•\0c	X\ìª\ä¬\ËU2ŠGŸ¬<\è\n\ZGw\×û2¡\íu\âñ\É)„ƒu5V¤QHf\Ëi¥\×Ô‰‡tª²Áñ)oµ>\ê\Ãu¥™nÅŠ\Ô[l¨Œz°Rf¸\ÇU_kÁm5€Pü±›ò™¼–\Ğ_1ÀuŸ£`«\rª\0[Ï¬²Š£1\è9™p\Ë@\Êÿ\0ûyIö5L¼4÷/şJ¨·ô†Tñ#-u[a\â!¤\Úm…sÿ\0vÅ\íuƒ\ë\êSjX[’ı{‚\Æt®’\Ö\Ş[_ˆ£k¦gõ=¡\Ûa\\¼½\ÔoH=\'Ü”nl©±\×OI\Ô\Z*ô¬jú\ã±`s\0x\×\Æà¤‚Ÿ^ZŞ¯q«n•}ˆß¬\Érˆ\è^Ÿ\ÌÀ\Â\ßˆvV9©\Ê\Ø\ËªaH‹m”\ì³¡V‰G\ê	¸\Ò\å.²ô™†R¯Ş®\Şe\'µ¸\n–\íH¾cwXa·º­°Š\ËG|}¡\ç‡«\Ã\Z‚j\Û.°%¨k+9È¬\Ğqr\İ\âœsER\Â@‘UÀk\\Ë€¼9\îUK›Ê°˜ wª,/òÅ…»¼ğhñ59V´dò \æP÷@®u„=iŸ1ş!-X­zP\ÔÜ€\Ê\ìÏ¨{Bš3$!*»\Ë^X¶¡o.®&[hFA^(\íf£\0Šs[\"r¹¥½u`\Ò\ß\É\\\\ •ÁXD \×U\Ò@À¾\ZyËŒ²À\r¶Ú\í\Ä=ƒ!^k\ÚS‚ğ#¿06ve\0*\×0%ó\rR\Û¾ñ&A¬v²5·\Ú1ˆz\n‡­	\Äpu= ø•jˆ9º/†\ZA`h_a}\æG*F¥[«±»~„H¨>ÁÇ“q*7ÁNš\ÌE\çlCÍ°\'.\ï\Ízn?p6Æ©bTûnP\Å\Ñ\"\n•n@¾£·|†Gº¢/×—\ÂH©šmµJñ,\íÆ”ò`|Êzª”{a¸š‚ƒ°`\n\Åd¬8\Îù‡\Ñqvø?XŠ¥1Ş +˜\Ú#Uvo÷3›©hw‚¥ñ\î„\r‘¿H±j\"PX}ÔŠ))™\\–g˜§G\Ş=@K\Ì\á\ß\ã\Ú+\0¹ón`1}ı¤g\Ö÷À`{\n+BY ]ªùqF¹ech£ÀQh8»\ÊK^Cª\Ù­“CkWp©”o«\Ù\ã˜p\ÄE-›«‚M\Ç4]	‘\Íy¨1hÛ·„ş¨â†²C\Ù\è\\_„R®+^¼\Ë	\ÒW W\æ3¢‰`—\Û\×¹n8|ÁqT$P*şF…$\Ø#cŸ›`\Z´§\ë`‚R\Û_ûg“H€\Ğ÷q‘K\Ûx¹P$Qd\âı\êZ^1´\ŞŞ® \Å&XLÌœ¹\É6w^c a“^¿òPj•§/™¼¦\\>\í[+®\ßF\0±\\\ÄõBN\"\Ñ\è†\ê­+\âW7r‚=%·a\Ú_«\Ñ5f¨Q.S\Âl÷US—ˆù—B¹“÷ÊŠ ]j\ÆO_¨J†›^ˆËµQb\á8üÍ„¥Gœ\Ël¹€°ªw¸»:\åo¯:e\Ğ\×\ÆÁ=*+š7—t/\Ú&C4É\"¬€µ\Åj6Â†)¾³ğC1fh­%\r\Ğs‹i`/ğó£:\È]\nõ¯8·8¿û³c\Ğ-U\àfÿ\0˜R°™0¯0Q6r¾†xsF<\ç÷PxªÕ§ó\nû„Y\í#yÀ\Ø£6*”Æ¯¾ı¥ixP¨h(\è\Ä60\ÚÖ³ö¦®p°8ö¸\äA\å|²’\ZrQbP“t\Ó}p\ËpAró*±±µtÿ\0b„k‘V¦\Ú\×õÌº\Õ\Â\èoš`!n\ê\Û\ZT‹t\ÕÉ˜·5ÑµeW´´2ŒÖ‡şC) :ƒrÃy•¡wX\Å@\"fwO5Ñ¼µ3Æ€ºğ\Ğ\í\Öù\Ï_\Ş`eWe\Æzş\î 6\Ô\áu€#kƒ@+^jı\ê=UY§®e”²[ğ`>Qöt\î/ÀE\â&ü­\Ô\0\ÊEAu6­S}\Ô.TÀı\Ëf£ª\áö]\×-\Æ|K¨/\"\Û+\Ì\ÙA„cš\n˜\ĞZ“Ò–8ğ7‰\nøGj„¶\ïú˜ˆ\Î\Û*e\ÙlLŸ™–E\Z\Ü\'V5\\Ü·t.S|wˆj\nù¡û\Êt\Õ,¢bø÷ƒCJc?ˆ\Çb\ç\Ö;;³ûñ\Ø\Õúk¸³l*\èÇ§¬©\ŞõwÌ±‚\Z\ÚÔªSkR„\î3\éÙ·\Ämª_ø›\r÷>ò€Ò‹\ZOôøŒ†\Ævyú\ÂÒ²xj\0º/3%ked°\Ù\Î\á\Ë\Ò1À‰Š\Ã\n2~¿X´dn€P¯\ÉLW\Í>b”\nQ$Tºr|\Âj¨2^â¢€\ìy®¯\æi£@m“š\ßQHª‚+C\Æ+9Ä¤\ÕIŠ/W\âÀŠù\Â}¥˜.i=4Ê–€4p½ekGKª!¢«^biì«¯N=¦\Ô¢ù¬x•¤Ä¦\ÒóPª%öuıˆŸhı,\×ÿ\0‘\ÒU¡f‚ƒ\àÃ²}?\á„;”g ¼:\ØıØ€d³B\ëúK˜r¸6u¹u´\Êd\\÷\Z\İe\ì´Rµ™ £\Í\ŞU\0©N“5˜Fuµ!\Õ\Äz–‹2Ö­M÷P=4§—·³\na&(ydÇˆy\í\åkX=\Ö:€°òÛ²š\Ö>±j;ª(\×ùqÏ›@*\Ø~‚_h>\Õtı \Ú\Æ\Ì\'$§[]–Pşf \0b†,¼&‡\'‚Xvÿ\0} U—\âVu‹W~€Ywœ/ÁŒ—Q‚™I(\ÚyŒP½\Ó\ë\Ï?B)&– \åB\Ú}!Ÿ°e`…\é\ËY+_\Ö\Æ=`\rªw‰F`²jªÁ†”U\ä\Ät\áÎ–\Ş]†·\ÊNH¼\\÷˜\ÂI¡;õ–˜¸…3û‡L‚\èñ\\\æ\éºüı\"±\0X]¬,\Êbz±›÷\"”^<ƒ¶R×‹û@\n`\Úf\à\ZlÏ§_¨K-‰JğWü‚\ŞmÓ¯T\×V3\ßò\í\Ğù)øpeGŸŸˆÁ5\Î-¹O\ãKÿ\0%¬\0\'_•o\Äj\ïW”\n\nwnØË”20-µyÃˆ•6Bm›S…3N\àE‡7A~’\áö\ß\êc\×,¸\Ö\æ\Õ>¤¸#‹šÀ\ç\ÖgA‡fØ¡6\Û\çüÎ³y\Ïöb\ÒTb8\Ü\Ä+­ıQ\Î\Í¸Œ¥\Æ(¿°÷\Õ\î]Èµ›¸[GŞ¼Nšg%/qÆˆ\Æ~¯\í\Ê¿¹\ÏñdH,\rÁpm¥o9¨#‹<Nk÷\0F\Ù\ç	÷€Z\àˆˆY\è—\íR¯(­pH>‹^ûŠÁ¦ş¬úX\Ø1k\ÌU+È»O#\ÉÂ’÷\Û\ì»\0¨\î?\ÕÔ–õeĞ´‚ ˆ£Võ=¢˜\ÒÒ´rJ lN\Í:ŒşRZò„\È2\Ô\Ù\Å@w¨\Z\Ë\0\Ô>ŒlTª¡\ì\ËP¬DŒb\ì@\ëH\Å\ë¶\à—ŠX\á\ëõûB@m\ìõ4¼>Ò\r\ÙukûöK#U—½¤P\É\é¹@	xˆÀY÷%\×\r}\Ù~,\'^Tøü<\Ä2‹Éœ\ÂWpù7¨„0\n‡E;Ad²W¢\Ë5\r\r\Ñ\ZÏˆ\è`\Z³K\Ö\Ø/zo/g\î\Æ2	a¼6K\r€…@\Ä\r2ª“Š€EùŒ¡#%\äEk\0\çKö~{pµR0˜ 3\Èó0IÀ\ã¹xSX±\ÊG\×B\Ï\ï¼P{]\Ó]²ˆ@ºNS¯½Bı”\Ğ|b¦\Èk¿\Åkÿ\0”¾i8_|\âo\ØÂ¼úF3vZ=£\Ğ*†\×W\é„õ0h8æ˜£\'«_˜aZ\È/¼4\â›g–Ø™–\ÍFh\Ô0dSS\à‰Zyµ·\ë°q0d‡Â’—\ëQx¥»\éeÁU\"\Í\nO_\Ä>›v½7*‡¼¹+Ñ˜†m¯s]i¯Wo‹Ç©)\ëVG\êykMPüÁKb‘_6%‚\"uú•\á\Î\éÜ¥G+…Ÿxb‰¡(=õqôµ\Êm*Y+x\ÅF:\â„ôª–Jiy<>\"!™7œ‡\Ş3\åI°O\Ë\ËXÀYnƒ4i€\ÂÅ˜\í–T\ÛT,8*.n\ÌY-hºª\ÄakV—)U\Ïs5,³‰@—tDÅ¡\ã\Ä!62Ö¦\Ë\n\Ç\Ş\0-ñ0hL|¸¥\0p£&¥%l\ê¦ø¹˜òX¹R$¿†- Q;rŸe\Ä0\ØòqmQ\Ô\Î=p~‰‰A^%`\å—xrMû\Z]@U»n2i8@Á•£ƒŞ¸ƒ\äSMUÿ\01hØ¨wóW\rŠ\ì\îÿ\0S@ğ^\àe\Z\È?z„\r÷\çˆ\0ŠN-ûb0ª]õY@b\Ò\å‡\É\×X—\ä4 ,¸¨¥·ª.gÅ¢N\ã@%Ç¦º\İ]Õ—W\×\Ú\0K\×U¿\âZŠ¢õø%–r0pø\Æ\ãd\Ò\Ã\0V\î~«0°\Ô- Õ„\È©\\.\åÔ‚(sˆ“†S^uÆ \äVƒ\Éå—¥e\ÉÇ™aİ“\rU\ÓR\\GYY`\ÆZP\ã¸e:0\Ò\Âc÷¨\07\ÖKU’z\çõ4‚\Ã…¶W\Òô!B°m¸—È™(«·¦l0\çˆg v˜»Œ\ÛL¨[\Çü€¥,EY|À\Ü\ZYşË‰¤po\æá‹œÆ—¿L\Ë\ìQC_\äqpTÍJªpM\êJøœ­\Ã/wõ¿A……µo³½2\à¸ b½}¾\Ğ\ÑN·‘óÖ»0QC5\Ë~ŸX\0Š6\ç\âüEgº¥µõ¹f8wcTólğjóp\ë [O?©fn—A¼\âœ\äy\îb,\0›\Æıe3	é¦¼UzC5hmÁ©YT\ÓXk¼M„s\Ì(ƒw”\î`†Š¢sxª;\ŞhŸ§\ÒQTXl\çõ\İ\ÔP\Ù\çñ\Ó	m\ÖôıH³Ÿ\ãñ1\Ä/ñı&?\ëøöiı\Ï\í(Vœ-Å®«® jxñ,Pš*½%o,ıQd,	AB/¾\nƒŸ7¤°Ó¿\Õ\Â\íÊ\ï¨õ²lÇ¤L\Ûÿ\0„­¯•x½!Z)‹~<A7`Sºı#™\È@ó>‘€`\Õÿ\0”0Hq}!QŒ|{FP}#\Ä&3U×‰\\Kò|EŠ›[»5Ô¢\rz¼\Ïÿ\Ù',11,'El Salvador','San Salvador','Rompiendola como siempre'),(18,'Paola','pao@pao.com','12345678','chica.jpg',_binary 'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿ\Â\0£\0\ì\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0§ªıÁ\Ô\îüõ‹Ÿõciw’²\ä†\ì½Ñ»/tw\İ\Ã\Ş÷¶÷}\í½\ßwow\İ\Û\İ\çqï¢œ†k—z‹I,«¢\ì\Ù4\Õb=\ë›\İ\ØõLû\nv/ ñşN!\ZY(b¦\î\Æh}\ïto{\İÛ£ñ‰B\íªgM\×\íš\î)L¾’2¬\â\é0jF\ìj•\'\\T†!-`õ\Æ2éŒ¢v¢ˆ˜\Ûro\Ïö\Ü=ö» ş„”)0\×\Ñy\ê\àV’óYZ*÷\İ2\Ø\ãöX´hò^tö\Ã\"\Ø3ŒÑ¥\ç£C¤m:¥“ÿ\00ùhL\Èáš¬\Ñ/\ÏS\ëS¼/0ÿ\0\Ï\é!\ä‹Ae–.\ÔöH[mÎ¹>\Ê4]+k‹F\ç½\'R\Õğ\ßc~‹;MV.œ¡\'N&r(oš-\Õfi*9]Ô•úL»8\Õ\Ëü¾§š“P\Ó\È-ı.\É\í¸oŸ\Ê\ĞhñÚŒ¸<46‡^%ƒf\Õn~b\Öuú\'sOQ‰˜0uVdGF¿<\Öf•\\,\ï\ÎI€\Z\İG_\ËQòN3\ï6e)¹•ÍŠ­«Nn˜}¶\Ì)\×\âi©\èÅ¸Ú“™i\êhQ¯\Ì\ëTœ”\â‚8¼V™K.C±õùH0v?m\ÛÂ‚°‚l§µ\İ\Û%\ío¶I<†Ñ–£¶‹ôTn\ÙFj¶oº\Å\á1²M$`yY:½`lŸ=_ô¼\Ó.:Â\íõ\È›¨ò·\ÓeŸ*Eœ\×[g|ûi‘\Ö\í710µ€K\æeõ\ÇnÎ®„ÜšA·5¢9‡=\Z\Æ8m–\r¶s’õ9¡\ÉqX\ÎW0Yõsœ–E\"ŸFˆ\Í:\åó]*\'w[F˜\Íp¥?û\ß\Ê\ê1\ßZùWÑ•õøúóŠ7¢Y\Ñóıó\Ş\íù¡\Ş]6¨‘ˆ\Æ¯??ˆm\'„%`\0\ÍD2\Èı\æ[]MJ\Û\Ç\ãm>ˆ¡\Ğ;~kª°Ê‹€+«\È\0û„Y¦\Æks=\Óõù\ág\"¦Œ¤õ•ÛŠµ\Ø˜¤]§\Õ¹(9ú‹\ä»h\ßg\æ:Â”­˜\É]ªO€”b\Ñ\×mİ™\ëÁı0-\æ4,¨‹*—ˆ£¯\ÊtÎº¤i»v!:¾«…Fù¤†>»„T2·\Ó\Şüÿ\0\ép¬l¹ö5.›!›LMÑ€\\\ín3’ts–XmÃ°4³T\Ê\Æú\Ì!Z\íˆ^\à@ık$ñ?:{]\ì\ëª\å¤}d	³n+f •X,\Î\Ü#u:qSl\é£›¤\Ğ\È?:0²²siw÷q©_¤+V´}\ZGHüş”³Q\ë)ú.\'\Ù\ïL®?>0´$VZ÷y†0¹é¬—g&psª›ŠGG¸6EË¡\Ë\ËL\ÅC€¢«µ’±‰6¤s“ñı$¿gt±\Şxnˆ\íª\Î\×\Ë\Òw\Íõxc…\Ï2L\íJtk7¬TŠ\äH\Ù|\ê¹(9µ—:p\Åus0º&tBó©Õ„B)\Ò\Ìf\Ç)\å÷¼\Ğ+m\Õ\Î\n^Æ³*¨u°y¹®{i\Ùe_ ºt\\|M\Â\0\Î\ìVÆ’£^\Âõ°\èé£—\Û\ÆÍªw—C¡ ‘İ¡gL\äèª³pL8\æ˜\Õb\×+.Y|y¬íŒº\"ºd\ØB\ÑG§³^Y\Õs®.œ\êgi•\És\ë;¸\×;\ÍiÊœ]Z3„ùµÕ‘L©J\Ó;°\Ã;\Ô;\Å\Æ\ÔsŞt³.k2˜)c†tJ¢„\ÄWÀ¦\Òe\Ä\ä\è4H2#\\\Â9PÌ†¯6Ò¶\êù‡W\Ì\È[¢_UgHwÑxWÉ¸ú¡e°³¤šJMOn\èn\Êÿ\0RtP\ÌteÕµQ:R\Ü”Rh,˜Q\ã´W\0\Æñ¿\0L¢ùR\"#(\Ã]œJ+,-`b\è:1|‘\ãe3¶Ò”L¬\àK¤¦„\íF\Ö\Z.¥\rUŒ”Z\ã´w\ÓwD\n\å½\Â\èNz¼BF\È\è‘sŞ½nOW\Ç\Ñ<®\ã \ËkEDõs—jø\Õ\\ªŸe:<WË™¯…©‘ƒ«7¨¼h\nğÑ¶R¬Î˜tµıÁ€¤:P=\Ôb¦õ^^ŒÆ‚,x\ï<\îŒ2·_O/…83¬´O0o \í¤\ï\Z\ÑU£X²™D~\Ö5EH\æ´.7‰\ÆgIeh,E•<•bF¼#<\î¾\Î$£U»I­\Ì\ìj\èPGtE|\í:Š\ŞË›U%8yoù»%ûe©\Ù§\á\Ê\Òp!X0ZÑ°\ï\Z\éyz–şşk%­\îg¯”ªi+³‹•ª\â\ÔUv”kœ\ÎşGhÏ‘œö¯²\à>µ\íD\çÓ« \ìÍŒû\â{\\·–\á\\ûÌµe´¹\î6\é\Ù~{;G•ƒ\ÙT÷j\îÓ”8E¼ŒT\Ùeq\Ú\ßW\í¥\èLû\Ü;õ4\ï½\äz²Ÿ¼S‘÷±½\Õ\ÎPõ£t}\åj§\ïQ#x1}÷²\Äox\ëª÷¶\åö\Ü+\Ş\Z©{\Ø\Æ^ğ?ÿ\Ä\0-\0\0\0\0\0\0!\"1#2A B$34@0ÿ\Ú\0\0\ï,,)ÿ\0\ê²\åHr›~ª\ÅbdE!‡ÿ\0#0QnAoME¡šFŸHa\ÅhÔ²\Äf¬\Ö\á\Çò\ßÿ\0¥¶ŠÃ»X@”\ã=‘pF\ÄYõ+>¤O©H\ZYR´5µL\É}7¨^Dˆù Aš²¬„²€\ïù]gmI,Ql0³Â†\Ì@V„X\Ö\ÑT\ÇÉ®\â\Ù\ÔVÇ¶\0\Ë<0‹\Â\ÒÛ¸Ë¯1¯m‹šo— ù\Ç\Ít4Ø¶ü‚+1v¢¦±¨¥j[\ïZ ª\Ë\ç\ØIn]¶O™\ĞÇ³$\îı\êQmS*¼˜\Şc7‹®ğÖˆ\í¸”5‡\'Ö«°u±­\Î<†-\ÍS\×`uS\ë’üššÍEBµÈ»Œ®¥¤fõ?-eŒ}:O·	ü·¢’­‰—\ÜK\íĞµ\Ë66¸§¦Ê°•fN0q“„T \Üa¦1\ÄÃ¿ŒG\åÜ°ñ¬y8tö\Ó\"\Ş\ØP¸\Õ\çf5\ì\ã\ë‹\ì\é?\Ãx\ËZt\Ü^\ãSHWSP¬º\Ì\Ú5Ü³ô¾-±ZeŸn\r|œ°T N£”np «û:G­	È±\Ğ›aU\Å2\ë¶\×\Ûv\Ze3Q¡ù¥\í\Îa/\Z\íû–u\\+EY\Ç×©{0}l\Ö4¶œ\åu ¿\Æ\Ñ\ã>¾-lş\Ç\ÄOœFòÿ\0ô¥‡\Z\ÛU\Şı\ÛUb¬k\Ñß­·\éHŸÎ‘ ş,&e\\’\í«E;Yğ\Èy\Øş+\ê\Ç¢(€MzaY]i½\ĞJü+ŸeØµ\×Ô¬Y\Ô\È\Z3h6ZıP)ÿ\0.gùS9\ÕØ˜‡\Ì_Œ&ûŒ\'X±U\ÆMbº Î¦\Úg\×Q;\Êë®·µ+´ı6<8\Øó#Š\ì…\äøÕ¢£\ã#‰\çğ°x|s\Ë\èA•\áÒ‘±\ée\êX–ıJÏŠ›·y±VeS’\ß\ã°\çø\Ü)ş7ÄŸ\ãqg&œŒ\äg#-s¼›9Z¦)\âh\ÎnT\æİª¯\Ì?t¼ø\'\ËX©R\Æ¹•Zz•¼\é3÷*:-0¬G§u\ÃÛ€\Õ>\Ôû3\ìÀ\Í7d\ä\Ú\ä\Ò\âc\Åù¦®\éÁ¡±\Ü\ÒY«\Åñº|ğ‰R­Æ°£\'¿¹Å ù?\0\è\ëi\Ó.p5\ëuÁ\Â{&’qYÓ¬w\Ëıd8õß•k\ãôÜ–G¦\'k:M{­*T*\élğDj÷\ZÏ¥ª Dx¸Áñ_\ã[q4g–\å\Zš»šÂ¶³-nöW÷\'I\í~+e&%85‘¹w	‘…M§Ê¯£7\Üğ_”O‘5\ë\'lñ!üWğ¬\Æù\Ç¶ù<RœÖ˜F\Ş\Æü-\ÈT~Œ>\á˜?Šù|\Ûû\çõ&k—«??ù/¦m\èü¸\ÓS\Ñ}\ïBcÔ›•¯óı[\á:–\Ä0\Z—eqò[;xõ§\è\Ã\Øf{û³\ÈZ4fn¥3–u›ˆ%<Bf\å§\ÆQİ†4”üGÅQ~6YT8—\ßY”f-e:£k¤õ\ç\Ôvs\ë>û0\ëØ½«UyN–\Û\Çm€\×3·+4¹FD¯(\ÌL§\Ò[ù-ò|/õò\r¢>Sn§¨\ér\Ğ¬{U:`\Ö\'\ïª6²imfv(\Ë\Ç\ÉÀ»ô«u+m‹kõ,³¶\Ó\éùLz!ğ2ƒ?£\ZTü™KltûHl\ê\ÔZ¯M’Ü¿¦l%\ã‹û\êc–MrZ\ì\å[Rº\ß\ÒZ›0Û”\Ö\áªv`§QW^–ŸŸw\ïõı›ñş‰øl\î·ò°Y[°¼Ú•®\'\ã-e}””]\æ·\Ü/¯Ê¶\Æÿ\0ƒ4±¥\í,´s\Ô?••†k\íü³²Ò¦\âjo\"¿w\nŒõ’kl•ZõU¦†\Å\È\Ú\×dq‰–{¶wgv=ÀG¾[tÈµšYóUG\äÿ\04ùw*\n!·Qûo°ã¨¶-.°Fümór,3 \ã¾;\ìW¿K‡Œ¥\Ñ\ï\Ú/¬³\Ü)©h—(|µ&|\ŞYy­C\Å~\n\îy–#B˜÷\êw\Z~®:¤\Ìt²:=†¤\Ğ\"_\ár\Ú\Şr1üG–N şW\æ¿\Ë\äñG\ÃW\Æ\Ä\rª\Òv\ÖpvQ¥øaT\\\Õ\Ï\ÖyãŠ¾HN\Û>Gş;OoC2¾2ı¨G»¼/<V\ã¶O•Ÿª˜i<ó*IU;^À0\Ğuu^\r6,\å¸~:§ş®5\\a–J—™Ä¨SD2\Ó\î\ê·ğQ\æcü,i”\İ\Ënüÿ\0¸ğj@Ã€€ø+\æ\Ô<À–hIeqª™\Õ?\çÀ³ò\è\İÌ‘\éaĞµ§P¿»—Œü–ƒ¢2-\áXN*şK\rL{4_\È/\ã_ı(<P0\Òûš¹¨gQÙ€d¯>›¥ªŸK\Úu;»t¿\åCñdh–O9_°¿Ù‡€9)¦š÷(”Ÿ?¾L¾w\ÎfCUcfûh§¼ÿ\0©¦\ã{N§ws&\Å\ÜO%\ê\Å~k£\Ú*\È;B9«©>lX\"şx£p\İ9\'™û\ê\ïbUß¾¤3j)Uö2cœ\ÇJ¾½a\Ê‡\ç~¹Ú°d{Y\ß U”\áş»$’öKI\àR&\Ú İ¶xù\ã{#yp¸\îv˜NùX®Œ&aÿ\0c¦\Ó\ÛÆ¥\ÓN\ß[m\Ä]—®\âpñsŠhN\Ø\\7¥Å‰¥²®M)¯mÇ“U_¡\'\çk}\íù\Çp‘\è³^0†…Ü«²ónµ|m™\Ù<\"´K@w¹Ku;6§\æ”\ä1¯º•j\é\Ë]Š\Í-\Îµq¶rÃ–ÀiAı\ÊQKpûØ+ò<,\î3A\Ê‡ñÀ¯²,§B\ï¥\Å\ÅC\É\Ø÷C\Öm,³1ù\Ù:róF^Q¥lN\êV,bõ¡™!Ô›n›\Õ\ÜV\Ü-\İy4¶²’\Ó\ÉSÜ¾}7¨ƒr²G\"56_r&Û‡Ã¹šœgE«x\ÅWd Š¡¨g›Ü¬s{Ù¹SÅ¬\ÇUlÚFQGq2\ì®\ç\×\ÚF¢\ÍC\àÀ8‹&LDòÏ©©©\Ô\Ü`\×k£\Ú@Vˆv(E\î¨·Sª\Ù*LJ·el\\¬{2ºŸQv\"£_e¡ˆfrk\Ò\n\ÜÀLÙ|\è©0Ôœg:€K ÷µ\ïİ¾\0\0\éŸû]\â….So2=<@)Ad\ì%O_<vnP»‹J‹‚)\\¢~›ó©H€“?|c\ÙÆ¼½\È*,x\Ãf\ã\Û\ÆYúğF\íÛ’‘k\îF¬\Õ?:\Âù¹­‹±Jx´q)\â\"\Æ_-wšp)aŒ\0PI‹½y–±\îY¶\'Ï£	ó:•ü›\ÃZœ4/¼‚kÖ¥k\Îq\Õ:0\0S5ªÁ÷Bı\Ô:Z=\Ò\àMoùaX\Í\Ş1lz-j\ny\ä\ÖqG;8Uó™‰È¦ŒA÷“\ãÁ!\Ñ|Sî¦¡\îÚ‰[?›‹~m\ã/~mW\â\îqŠ¾ˆZh™ûc\á£yFÓ¹Ò“Å£ıj|5m÷\Ãi¿I¡†³ÀSzk\×G—ÿ\0öl·v-Š¨ñ\ÍSù\0ME\ØO\Ùôwñsso\ë\Ò\×ı{\Ç>kù\'\Ü\\‚¤^!±S·\Şf\á¯Q\×D\î*w#\İW’~µx˜9cx|Xf[q¥œQ:a\Òd\×\Ì*Aò>oü’\âø\æòó±?d\Ê[\í†\ã{lşUü-\ŞF3‹+(7À†\ÓC\Æ>L\Í>ü\Z¾\Ö5[¶”\à\æ\\M\Æ÷\0\Z/s…¾r{¹B\Ş-1\î\ŞtÜµ? ™K\Zbe™U‚\É\Æ4sf\ãº\ä^¥<F¯•¹ğmO\Ó7½]•2‹\Ãno\Ò\È\í§¾µ\å©i\Ôøj.ª\Ãrù\\Š«ƒ$i\Ì\Ş\ãÙ©’\Ü¢÷\r{²i\ïVA\Ó\Û/Pù5¦ „\Ãä«¶Zÿ\0,ƒf1ò µ,ŸKAc·)k­#‹Wj¿EA\Z³–#úYB].\Ãu/‹tZ­\ßÑ“rcV°c¦-F.5BQ5-©m€‘°+\Õ-I~-vñk\0ª\èˆN\å¹ @Ù‹Yv\0˜”;A‹\àøº\Ç\Z60„\ìV	¶\Ô\ÔxÑš›\×ğ;3õúı•\Üğó\Z \Æ\Û\Ê0\î°\âô²\"\ã Š€MFø°±(	qc\ã\Ó[\ã\ÓS~ğ×Myıø5N\Î0N>–ş)\È\Â<{»\êZûa¶6\'\è6\ãEùoO\â~¡1¾fŒc\Ğz\î^Ú©X\Î~/·yB¥9lBÚƒBn™¿\"?C[ıø†\íù\r\Êw\ìû\'\ÔY>¢\ÉõO¨²_u…\Æ\áÍ€¾\ç6^-®Ev6…­;¯®\0±£\ÚóºğZü»\Z\×ĞºÈ¶¼6¸n\ëò6¸+}‘­p¯ÿ\Ä\0\"\0\0\0\0\0\0\0\0\0!1 AQ0ÿ\Ú\0?³wúY~‰\çq¹\è\Ş,\ÜX¤&9P\ÛyNˆ\Êı\\±,!-\ÆÄ	A>Š¢.Ç†ó,\é¢X‰©\Z\Ä^%\é\"8RIQVm:%\Ê\Â\ÃöG’\'h\\¡\í‰*kŒ¬R)³m¢·C„Ip¨]Š˜\áK\ÒÑ¹ĞŠ#\Ç,ƒ‹è‘²Æ©b|GÑ¡\á”>bhl\ØNH\ÖPû+\ZcTA\Ñfô9–jú\É}\Êb{´C“iTY9›bf\Ü#¡Ë‚\ä“\Å\ìX\ëFI\â8dK)RQ\ê1j³\Éû„\Èòñ\Ò#.D\Í}Kt.N±¨J-a<JO¤CQ\éº#­Z»º<¡¢/I1\ZŒ\ÜTX\â\É:¹$\"+¢\Ç!pAr>‰H–.isB¤‹LI|—x³O¢O’\Ê\äx\Ó\\\ØÇ¢f£¥‡\ÖRJ78\Òô¸ŒL‹¶j\áõ—ˆFØ‰EV“¶š1gMŸ«/\ÓKV†_\èğ™÷-ş›s\íD¤£\Ù\ç=HHÜ‡$\æó\Ìy*\âû8ø(šzO¶Qı/5\íY\át7\é\ìg\ÌVk\Ù\ã[²…QEQEÿ\Ä\0&\0\0\0\0\0\0\0\0\0!1A Q\"02aÿ\Ú\0?\â‡ªÿ\05Q\ÙŞ¤«\\l\àÅ‰\r~\ï\ãıŠ\Ğñş†ˆc±ED\èC‚f\\\\t•\ê…õ^š³ş¨\ä\ÙØ¥Z’´d‡>j1­\ÃyĞµ\"½d”A^\Ù\"Qo±ºHªeŒ—DWEYd{\×;ğÕ‰JB´÷‘™Éœ˜\Õ\n6G¢NR#\ÛŸJúß§|r>)~‰ú&{\á;K²\Ë,‡lkKK¢>ôğ¦oPº0Het)5Ö¦FD•™\Êõ‰ş.ú+\\IG‰“/TB%\íE‰b×§\ncDF\Ä\È³\İ(\Ù(P½\âÈ«zc0«5D±#\âıdúZô”z\Z0c¥l}oìŒ“\ÚD!ı¤O\ZÈ“CÁ\"8œ}Oz)V\Çµ‰KhRD’…\ÅY;&ûŠ±@hŸ‚V\ÈG¢=\ï*<Šrtqq™\é¦5\ÙG3ş\Ä±tGİ¾‘\ret¨B,±Ï¢QL\Ã\Ä/v\Ûr­å•±Gô45HÂ„G\Òô»\ïS•\"O£´G_c$\Ìn›C«ğ\Ê\Éøa¦Œ‘\èûR\Z\Òü?’\é\rtÈ»E?¢?û©#\ëj?¦r\Şió‘9ôøó1\â\ÉE\n-œÀŒøX±\Ê\'c‘—\'\ÔJ?Œ#.©—E\êõÈ²\Æ\Û\ßñ—DO±—¿\Ã‚}—\Ùe‰–Ye—¯ÿ\Ä\09\0\0\0\0\0!1 \"2AQaq‘¡BR#0br34@±ÁC’¢\áğÿ\Ú\0\0?\\\Õÿ\0\Ê\î¨\Å\n\ßR?Å—(evW\n\árU\nŠGø}\Õr §U¼Lª•@WU-Òª±HÙ¸WÊ²¨\å\×oº’ \n©Ä©\è¤\Ğ*¼WÊœE¯‰–\éeC¬e\ç>\êŠ\êêªŠ”+N%B–™*J†ª_ª‹»¢ÕŒaª4…xc;ÀO=\Õõ\ê†ŸL\èL.y÷\È\Ç €\nÑ‡Wÿ\0¥¯®Zp«\İIqœñû‘\ÎA‚´»@P«Ÿ…,Px¿\ŞR¥A]ò\'*Ü¨o²/\Ä;\èFl\ÏY;:²\Ö\í™R~yx\ËIûT“`¤\Ù|KòZA\İLş¶^\Èmˆ\ìPM\Ã\år¾9\íµ½€ÎŠŠ&ş„¯±Rˆ\ê´úfüSó\"\í¦¥4w\Îs/ı;É¤\"E\ĞkzF\ŞıÉƒhh6Uª\0\Ğ\çuÂ¨Ğ·š¥»¡3ù \n\æ¹ú/›\Ñ]ŞŠ\îô_Ú \æşÁÁN&\É_Û½ÁxPÑ” \0U`[¨dVñ\\*4…©¼;\Â`—j\ÔüC+ú¯_\×rş¹_\ÜıÁV\nÁYY[’q…†\ìC\Ùoş–™P$;¡U\Ï|€\Zş\à#ğ\Ş\Ğ@¸.eoeoeoea\è¬=È¸[\ê¸Gª\á©Û«ï¦€Q³D\Ì]q:óŸu«|OúAº\ÃÄµ´\Æ$\Ùo\ìV—\×.0¸šˆ\Ô\\M\\A02ttZ0\å\î<€Sø—†òŠ•«\naA¢œ­ú\ÚòAšd¨\Ä`ou¸Æ”KX\Â„\ÜZWôÈ°#ªÓ„7\ÜnVòƒ\nV€dúC#°TRœÕ‹\Ôy£ˆÁ›J~+\ÈøzmÔ¦—H…§K\à,C\Û\"Š\ÔA\Ó\Ía\Zu‚|¦\Íó\rt\ÂÒ‹†\'å›´©\å¶2û\æ\à¿\\´\ÎIøM\Şh‰XLia\Æv\î\éP±Oq“‚)\åÖ„ri\í•AÇ¾Pš2û r¥Ö¨ \Ü93ş<‡6®\î†#÷‰0\'\å\nÀ\Õ\î\Ë?uJl5\ÙaøR	Q½\é”;3›‘Ì¨R,P?™¥³A\Í5¬\Ã{¢\ÜÖ‡™tP¡?µ\ŞL\Ëµsv1<\Ñ‚[4p²-é”µUUYn’^NGd\ä\å*o\Ö yZ.\Z¢S´¶1¤\Ñ|9k£˜ª\Â·/5\í7Ì‡\0Zyñ?\nd}A¡­(ø\ÌE³NK†¨jm\ëR„[#¬\ïù_—‰î¯±­¼CôbrŒŠğœ†•PlWeù®~¯\\Š~£\ÍQ\ëv£˜@ƒMÛ·E\İW7\'ú¯%IP\Øòj·\Ü%D\Ño:©ÿ\0\Ç7\è)U«\rĞŠ‰i!i\Öa_`œû*\ä\ïòW\Èz«œœ{e9»\åmg¦\É;:FÄ ŒX…eP¬2\ãu«SVœŸ\ã-<ó\×\Ï\Îq´Jœ¼)J#’î€„Ş±>«¾rö\'\'«_¢(¨4\\\Ñ3|¢6#™¢‡4G`¨( Rh§)Rjr«A\ÈùµWp²\Şv	G£h6	ôDš¸¢‚>\ÙH\ár®Zº\ÕU¨Û¦\Ë`*ƒ\Ç\Åi|»K\Z)\êš\Z\0ñ°b\æƒ9\Ëö32:(ç–“ge	İ²\ræ­Í±UV\ír¤ÕœÂ›Éª—P.¡\Ì(\É\Ò\ë4uZbAª\r\r\"¨?t	²2˜\Ëÿ\0Uä¨†¡\nFT\ÌA\r2H[¦¥`;W\çsA\Îlª‡FUˆ\ãˆZš,˜ù@»_ş\Èi˜µ*0\Üü?Upwòj\Ò\Ü6œ¡\×]‚„V+uU^kt¯\Ìo\Ü)õ­\×5Zœ\àt\í4Ãˆÿ\0µ,ş›h‹¦ƒN©\ÚlıJ{]-/ _˜¾X6*0šOU\Ô6\êNTC7|Á\Ô(õ±U`Š-Õ¼{!‡†-T\Ò\Z$u\ä¿\ã~\ê“8\ë\ÙDD*Št]ÿ\0\ÚkEq\Æß¥È¹ƒF ù\Ô*·y)S*wo™BTôD!«™X òzœ¤˜_–\Ó\ä­\â\n+÷\Z’œ\êÃŒƒô”`ˆ\îh½üW«}¡P¬ø\n‚Ddôk™G°ÿ\0N\ë€\ê¾§¹¹T\É\\\ÑÑ‚/u‰\ìš#²›&ş\æT§4ùP\ßE©\ÆN|ò’œüN\Õ\â•ôd\\\"{QG5ˆ\ë*\åˆ\ïÜŒ”L\Ù~#P:™¨}“L…Iû¡Yğ´°šHr˜\Ó2ú»\Â8g¬\ä\×bPE–\Ã\İXKwi­_¶m_ç¢…¢\ì°ğ\ÅøS\Í9’@\ìñ½;§Il;ªl¹†£’ŠEM\r\çrœ\ç\ï].t”\ì|w·\r­l5¥b=¶/§„\ã‰:\Z%‚\Ò\Ü;Ş¥’°¡¾}³\Å\Çwş1+Sª÷T¨\ç˜*súå¾·I\İÓ’» ş\Ô+‡j,rs\\\ÙM\îgòlÊ†b¶\İS7µw²\íT\ä\Zxz&´‡^5tA\Í\âjcù‘;$\ÅSX,üA>–ª\å2±_\Ú}\Ó\\l\êñ\0¾†ıJZC\Ç>H<ñ4\é9O_ö¥œ\ÔYˆEÀ[y8Nö5´L\Ö{ªT\çA+\à·\ïE†\Ñ7ˆ]²*øL\àg¹Zº\'4\İ‡\æU9UX„’@X ™:uz)NŸ(\Â#vB„Gu\n;i]Liû·ÿ\0¤4\Ù\ÍNk®\Ê-\áL†[\æû\Îğ‹ˆ«¶	°\êœz¢\ŞÒ°\ßõ569&ö	\Ó\Ó\" ®ğ›\Û#tö:\êT\åS[„ÿ\0‡M[\Âz¦º§˜u\çr\âvóÿ\0\èl]&Ñƒ\ß,SöG«ŒõMğ¼\æ\ÊöZrEL\Ê1mKÂ—xU\ãk¨\È@\Îğ¨8r™t\Îò2\í™\'ˆÔ¯» D ‰\ê\åŒß¨Ju\Óby!\åBªiPO¸ª*¢A\î\ê™\Ş\åi\í\è©\Ä\ë”\ŞT„\Ùútú&;¡S°:\êq”-993¸*\èAºº’J\Åºsˆ±ZO\" X…U+¸3“Oe\n‡h7šs;#=Q\ËùJo“”FšwSòY}LiÎ‰Â—•\ä&»¦E\0\" Œ´u\ÉNtP§š“t@™›\ÇP®pE\Ù;¯\ä°ÿ\0€@\ç\ìš\åD2=ª¼f\ê\î·ğµ·°D\n*¥Q;æ©½öeG>E\á¦ET\">Œ\ÈD&öMœ¥EJt…¼ò¦£ÁT*¥q.«®€\ç\Ï>\åS\"\á=8Ts[‡R Ÿ\n4\'¸¾\ås+€.ğ¸gÊ l¡Ş«x’¾e¥¶G“º…G™\î¯_+{P*¦‹N¯U\"¼\É+\ãb\â´*®Â—B\n±\n:¹9Rª\Ê\Û}6*Šï”¨²\İ\Ã>aˆi\Ñ[`\Ã`N\\¥6do\'Wü?\Ë\ÃlõÛ€9®m*y‡<\Ö!º¨9\ÓbŸ¡\\¬v\ÜGE\á7…\İ\åyXS\îô~\åL÷U²\ìu\Êê«²\å•²\âö\\^Ë‹\Ùq{./ddû\"e4\ÊlŸe‡Túı\\•ı•\Õ\Õı¯²¿²º5WW\\J\êş\Ê\ê…q{!Uuÿ\Ä\0(\0\0\0\0\0\0!1AQaq‘¡Á±\Ñ \áğñ0ÿ\Ú\0\0?!öı§‚øš£óõ>‡\Ğ>ÿ\0\Üúl\Û\èG\à	]´N1òKCgĞ‡Ô‡øŸüQ¥ûöLÜ´\Õa\ærcıS†©²e§\äO¸Ã¨}¡”%\â_˜7ş\'øf™\âK‹ôuô*şsR†ß†&¾ŒÇ\Ãı\Äû)­_JM\æ:„_Y\"\Î\É\ê-ª\\Ç­°-Q)7u\Ó\Æ\àişC\ØôF)k©\\›øø,¢\ØL…\ïD\Û»eŒ«mŒ©M\Ç><\à\Z\îeVÍë¯¢‹\î£?\ÂeBaƒ”-÷¼º™å˜‘önq3\Ô¢Da¹”³\ÛÔ¬.\ĞNŒs\Å\ÈW™\\²\à¿AYÌ£Ê‡»°J\Õ1òü_\í\Z¾\Ì)%;\ßRº\r=Æ›>\Ò\æ3\êg„aP\àC—¦ y‰0›/µ²Q\éÿ\0¶y`qö÷\îb\ÙÛœ³;+\ì#7×™Ÿ¡ò‹ğGo·\êaA¤ŠxO=SG>ehÿ\0¸940\ï38\İÀ%Cfnø™‡RôL\Ã\'\Ügf&k¯0ü=\ÎûC,—•si~á€±jñ—ù%°\Ã\ëñ\Í¥CÔ©l2\ã<LC1A`\ßÈ³jş\Ò\ë3œ|=“0©\ØR\îµ\îS\ßn{ùˆµ‹–;­zŠ¿jú™‡\×\áùÿ\0®Ê€\çS\0zB/\Ğ>º\ÇŒÿ\0€ó™\Äú\Ç$p³‰øIÌ½\ë˜}§,)\ìu\ÍZz }Pš‰‰ÿ\0c\ê„m0MK\Z\áI­]e”0Wø2\Øñ¦7ü \áÿ\0,V8iˆ6\æ\íL°\Ü0·D&…¬zˆ÷.=g\Ó\à\ĞüÊ¾¥\Öõ\n£–©\Ë+DEKƒ—,!&!^\Â9²{¢|ABÊ©B¥\'p\ê\ÏşA=,—{Œ`¶a\×3\Ê1\r*8GL<#¡ºAfZ\íR Z(Õ¯rÁ\Ó\â\ç\ÂrO¹(\Ûpk/©“\æd—©°—TÍ˜¤=Ô¬\Ï\ÙÌ»°\ë’FÛ¿\Îiˆ\Ï3º\çoßlW{™DV3‹*¾Ê³~„î©º¡\ÜVÔ°\ÛSUœSBP%õ\Ñj\Z©qaAj\Ì\ÎR\Ô\Õ\íTbX\ê>’¾¨1 ‰\áG«-Z\â=}\Ê5=3Â‰ŠKª\ÜS1_@)<G°\Ô	¯¾\Ä\ÄcJÅ‚\îaX}0¼\Íá˜¼’\Ä\á1\îrK—¦=2\Ç0\ë8@K\×ô%Lò?3şT\ßN[IÀ+qaZf^™vwÄ¶\ë‘\æ#\"u°|Cr\ìB³1Ë²UŒ,J\éş“2\09FV»\çÇ™n—O;˜‡G/\\U\Ì!=¢O2\ÏîŸŒó?\î\Ïı	ÿ\0«2CŠ/¦\à©C	ª²\Í÷¢{tF‚†Ë¹r‹_3$%)\ä4MD\Ê\\\áŠ\ì>\Ğ\Ğ+3A—A°š>Ó‰õ6Rÿ\0ˆ‘qÆ‰¶r¬\Ï~Z©±#®lh˜Q.]ˆÁSB—\Ä\É!Zô\ê+\Õ\r;‡hc)5#­qf3R-&D¤©©R8‡S™ø˜\Û\í0ôe„\åã¸ˆ\Ä\ãŞa\â¸4é˜³‚£Ÿ0ôW$°!£\Ğf>²6\İ^%\İ ~f‘}È¼2ÁÃ±Ä¨P\ÖH²òS	bÅ£1°\ÔI46Wr\ê%\\r<®\éñ/øS_B¸ù©—´„\ãòÌ•Fò›©±¸F/S+%K\â1r\î°;‚\Ñ*Ê·“ù‹Ru0\reø%AW\Ïs\Üp•ú,û\Ü\å×»•\ï´1™\ç\áô\Ñb¢9å–·\ì3>“¶-—*˜\æb>3ùh\'#š–·|MŞ‡a1\\\Ä\Ö7v\Ç\ÚX]×g\Í\ËA¨‹­şeM\Ù³7/\×\ç\èAn\ÚÀ5¡–‰V\êQ-3\éU6m]©Tâ‡¸h1f!\Û\Ë2¯sk6\è€_0:c[•–\î\å3÷šô\ÖFó“w\î\\hX¹|\Ëpu†šg¹\Ûùœ#´\İ)sô0±K¦\Z$\ì\ßÔ¨¸µ’†fæ‰€œA\âR+#\â_¤·\Ñ“‡¸¼°f»e<Di[‹¨±\å\n\Çş2¶ì‚µvc\×\ê&õ¬·\æbW¡÷€}	‰0tûòC\æ.\è…\Üb\Ş]\ßp›†>0xA\á5ôY‡^\åV\å~Sqğ÷.\Ç\Ôif\Óü\Äû˜.ÿ\0rñUû”òÕ¢\æ\Í_©^Q:B‰\Ül¬9ºG~‡†\Ä3†7&(8¸\êT\"\åÅ„ûƒL>x˜ş\'{y<Í·}K\ĞjA”\â\î+¥&:º\Ä^\âb§G˜*l-b\æı®X8Œ/0c¸fT\É\ìs9i\ß\ÑÉˆ—C/\Ä\'’S¹N\ç)¹I©u­«\rZYY„	³L\Ã¦.ğ\Ù7-†S­¾ <\ÊÒ®W•\ÄFÓ‹sG®Ÿ0Æ€[\Ò	ƒa;·4ù¹ˆ½q6\ÊqıÁc°±9–šŒÊ±™4øc\Å¸B\Ô»aKa1-<Y\á¨|\í\Ä/õ/Sa\×‰¬\à(xŒ¸\n÷)ô\Íˆ\äK\Ú\èq?\ÔB<P˜‰®\àCÀ*?±©üR¢(Wø&\Â6·6xŸŠLX@\Ä–F\à·{lg1‰±¿\Ü\ì}GS;\Ú1\Ó\Úy–5)]a6\\\è…\ŞÚş¥¯\Î®¥g\É1`\Íø\è˜B¿4¢ø&\é\Â6¥˜üõ÷:‚Ÿ¨:Ú•q\Åş£\ïZfLp\Ék!œÀıÜ¿Š€\Ú*6\\w\Â\í\ÑÜ°·Q:\Ûu7Eğ¿\ã»/I\äDu\Ì\Ğ`ı\Z\ËÏˆBô˜LHO\âmÊ¡S§\çğÆ¬0\ï\Ü\ßuÏˆ¹¬TÇ¢\Ãm\\öüã¨¬´\Ü†\"\à\ì\ä”6Kª\ÔÔŠûpdDÍƒ\Éqù¤8‡\Ò)d\ÎûT»ú&\Â\Ø:±\Ô\í3e\Û/Õ»\Ïôˆv\ï¾el}2\Û\æaš3\ÍÇ«lü\Ê\á\ÆËš\ëÌ½v\Z\é\æ\'%T¹œG/\în@¡\ê\ÂöLÁ\ëjòº„\ä4\\5J†e\ÉK—SI˜`a¿±\ærY‰^\ÌøT\Î5\×õ*\Éÿ\03{\àü\Åû•X\ØKi\Û\ï-#ù†´Xzw0\rû¨\àh”B€\0\ÈEnŞ\â\ëzÔ±¨£\Ã%¸\"¿¦>¾`‘§\ÊB\ÖióS*ÉU½ñ\r°µgÜ‰`æ ˆ¯‘¨İ¼»#\Z»q~x€\Ø\ÓY•\Êm\n#Zx•‡\×ğ™L¢Æ½hu.Udõ7ˆ5ÙŒXÎ‚;>o\ÜPyC\àŒ\Õş!Á•\ZmŸ\ÄW69Š]y·p›î„©`(18`‰ˆø¦®[À.ï‰C5^f—“©$W\ï£&p\Æ‹ÿ\0sViI‰G”Eè¯™O\0˜%ó‹”\ÚRŠ\è²e|¶ø†À\ã8œX\å±\à†Jc¯bõ\êŒú\àı\Ê>µM˜Z\æ6\Â\0_•¿R\àº<¯ˆ\Ñ=Ba¸#\Êø\"5”z¨­ˆ9\ä¦aü±\ÍL˜\åysC”ºù1c²úƒÈºoù±,YÁköYÁM²”°8\Ìø\0^\åj\ï2\İ/ˆü\â ‘ö\ÍÍ‘qÁ] ]ã¯ˆ¼g\İ\Z\Ş\Ğ6ƒ®@††8\\|\Ñ\\\Øm-X%üM¹H\'´>‘¨e[ş\ÌH0\Z¨HsØ¨—|\Å\åµ\Õa,\ne‡m%\ÕxŒ\r¿›œ\î3(û\Ì\'j\Ç\ÌX=\Ù,¢¡\â¹ñ,	’ ô%\×Q99\ïŠX\Æa¯•.úq\nğ0\Ñ\Zô¹\É5÷C\Z*!9¼\Ñ(!–X<€Ê‹I$¦òBˆ ˜.¯uoŸP­iú˜\rC£\ÜP\Ø\æ}°A[¾\àmüGdˆG¸U~L07\Óù„\Ñ~3\â+8‰Ş¢prñ,[£\è(\ì([{ñ2M.º¼ÀPÿ\0˜õ´ş%*3t³>&ˆ÷{`›‚\ë\Ñ\0Œiö&)L8¬–†µ=\ä~\â¾P{ÿ\0±g‚\Ç/sz,):K4\Ì÷Ä‹uüxF\İÀ^òb\åZÜ°.‘w\î3­]<1Iqv>f \Ö\'ö˜7U{–·‡‰•p|\Ì2\í&T\çQ8şr\nR\Øú|\'¥zn1\Ä}ıLu*WÁ\0–¡[\Ã\Ä#-‚< \Şû\n¨\Z¨x0‡ya“z§Ï¬üG¤K‡W/0TA,}-\áGñ*U—?ˆÑ¶\î\'msz”ùGH·ek	•l\ì?™<ó\î\İ\Ñ®\Îù†(xJQmó7[jYkX\êsÇ®!rùd\à9‰\Ã\'a¯ˆ¶7ğ¤W\ÚwÈƒr&‡8y•3&QX•©Ÿ…IBPM.D@$\Ød®wB	8¿Rß™}GZ™\ÄĞTy D\Û*£‘\Ô\"ê¡‚qQ³\Ï\Ş6uµ\\.\Z=ºf%‹ƒR\Ë	K­T³\Ñø†s_–Ì¾ fôË¢‰\Ø\Ó7\Ñ.‡\Íp\ß’7\Ü2ú!>ªZ¦y\ê»A;®f|’™¼Šÿ\0¹G17ú‚E¯2\èk7\0™¨”¥¥®Š¼\İöu†ñ¬Á`,¡\á—\Ãæ”‡\ïX¯\æ?¸Œº\ä\ìÍ˜ñ‰’Á¨Võø ƒ†´LÖ¼\Ëu­\æ|Ô°µ\"÷«¥ş‰\ìmúF:]M\ä^H¢ükOÚ•lc0*“#.ò\ÒN.wnŒ\æU!¹“BªZ¾R\íp³òüGz“´\Ññ\Äe\ÚòÍ¨†§Zšw\åGg|õû™[u\ZSA†\ã\æ\Ô\×;\"r\Å~\Ì0\0˜Á÷~˜B+\ÍjQA\Ó\n\ÄEŒ­Â§\'N!\ÃJo\Äpµ\Ö\æ\n\å\Üû„7\ê#º==l›S\í/Q†¶\n›¨\ë\Ìş\Ì-ğ©I6½EB#ø¬­Zÿ\0›ûF\ÛU)[\ì3q\Ñ9Mlò<KC°\Ï¡\éŒ\â ›\ê©ùYVqc01¼\ÔNº÷+U•À\ÆJ”ƒt~`}KJôVhwd¨jc¥_Ü¨­T/’\ë@öR¢¿`\äAr˜\Î¸‡dQñ”õLò\Í*ğñWW¨\Ûa´ˆ™yO/±¬™7\ê-c}¬\è€ysú•ö)q5XòK4Ç–\çf¼³.\ã\Ê2\Û55%9–â‘«\æx37h\\¦û–2\Õ÷\ê\'hô™“–\å\Z\ê1Iw÷&U–G=D2­Z¹/6ÿ\0sÆ«|¢¥\í9…]{f–şh…Z²q9”X\î\àMGı÷±\ÖeÏ„E\\3A†’\å\Ç\İ}§= ×‡ı\Ë\"\Ôm‰\Ú\'¾3.*\î\æ6\ê}ÿ\0\ìsAnœ[o’¥\ëi$6jeş(™\Z˜¼ˆ¯«£Ÿœ?©ò§†IƒB\æ²#€>X\ìôKfEuù„q–~\Õ\ã Á§¿¡,¢¤Ìˆ;\×\ÈA^¿ÀO\Ä8>«,x ;,·\â\ëWÜ·hh˜|Ä¾X\É\ËŒ÷˜¢÷O&\"œ\Ç\rÀ\Ü&1¡\ï¨»÷˜¹I6Oi‹X›ƒLSñT\ç\Û\Zÿ\0\å\Æ`{fˆ½¨l10sHÿ\0\ßyC@GR!­m\Şú…5¨h65³Œ[5˜\Ù2J\×æ”±_07¯SŸz\Æ\É4F\Zb³£\æZ{!…¸·[J¹—Ã‹[‚8¼38‚m\Í.S\â“x×‰_\ÏQ¸ó2\r\î±6\Û/\ÄÂ5z„Kaô\Ìø\Ô\ĞÁ±q\ØOLL3\Ä¿	3-³<§³/.?¨Ô™ı\Í	¸À¯€ˆ¾\æAK²˜x·\ÄGd4‘€\ŞMÀ¨¨WDz‡¤÷.~Y”M’\è)’öÀ\çy}°„@Z\ÑaPG/r\íƒ\æ81SO1”`\ï,\Âñöa²>É¿\Ş\ï\Ø.\0¼JX\ÆZúË½’—÷a­?I[+*·¡²~e˜‹Tn\îP\"™º\Û3÷Ï‰^o\é>\ÔGöš\0\\ÿ\0\ÈÕœ¹¸ğ­A\åC)+€~sx>§\í‰^U”{0–\é5\Z1sµ\"V­\è©pœœq(§R¨\ì¯´c“\í¢ÿ\0u1\Ô/ˆ¥†¦\ïO˜_)W“P¨\Ó\ÜÄ¯i\Ôj\'H>&:¡\à\æj\ÕğE\Ñò®oÜ­\Û\Ü\Ğ0!O°w/G\æ\è*!¡™³m2xú$µ\Ù¿©zQ1z¸£;©†·2n«‰}„rQ‰\\n\æC\îÀ«^¾\\q¢h÷ao\Ş@@TTÚº\'pÌ§z:ˆ»x³¦\Î”-=JŠ˜\ê€\ÌÅª!\ågñ8æ »\ÕÁ¦¼G•”„sŠ…|wO¸¨;¯11·©xc\'p	€}\â†\Ü®m9I\Ê>„¯¥Lmj­‚5v¹/¬±°†©¸\áÉ™Ğ²m»a\ægs;»¶ ù‚<’º˜¹F\Ë\0\×r¼„!m%¶pø¨ƒ7\Ù<o²/²x_dğ¾\Èô¾\È.)]#İ•\î‰Re]@±OHK\ç‚ZiÜ¯\Ã\ì”ooD°·ñ \ÊüSJ|&dl­=\İ;\à•\è`\è•ß©ûtD\r\ë\à†(o¤ÀıHGøŒ?‚V{ø#şÿ\Ú\0\0\0\0\0\0Q7¸¾x»^şqƒS\Ë\r[Á\á\å6\ÕüO.\ï«<g\ç	¹¸Ô|ÿ\0¿÷l\İ§p£¹m°o\0|\Ò³\Äj N\Ô\ÓQà¼»\"\ê\Ö/’	Wò¦º+”o\Ãö\Ä\ëy¨d«R’’¿ƒ\í.wôø&ù	øŒpE\æš<)%ƒ\Ë0*~\Z¥ª\Ü\Ô±\ÌüZó±;i\Í”\íó[=­2\Ü\'Y\Õ\È\ì.EÊ¨’.\ÜB\İ\ËBJ\Ğ\nPŒ…m©…6¹r“¥ê¬Kpn^\åI8Õ‡X\Ùx\ÕÉ‚µfŒ4`«™ˆ¯rr\Zls.ßŸ\Ç70Œ\Ó\êP1\ìWÃ¯™¡r	ˆ2S9<\0 \Ôp‚\å²÷†8°\Õ\àp=0ğojS€FüJ”˜¾\æ%ì¥4^œ˜­j®bó\0¡ñ\Èu\ïAô`{ÿ\Ä\0 \0\0\0\0\0\0\0\0!1AQa 0qÿ\Ú\0?\Ü~¡9?Ğ‚]¶\Ç\í·–$½‚ùşt_÷ƒù–~·Øˆp\ÎÊºŠ\ä\ËÇ€á¤‹,}\Û\á!68fV9w6ıE\ë,ƒ.­–²O¼µAd\Ë,\äöõ¬ñ€“\Óc´\Í,\à:O»mº\á\ê\Î÷be¢t½ ÷\í\ÒA¿‡\Óg¶.Á}R2]4Nn\ã\ÃÁ\í\ä—K\'öş·›¿±ò;Gv\0\İ\Äõ\ìù}¡²c\İ\æ\ìG\Ã\å³w\í‡`òAg>ƒ7n¯„‡\Ø.ú3w…t´öÃ\\c¨e‡ğˆ=D1–º†1‘À‚ß¢u\å–Î\İ6ø\Ã\n´…\ß¿`ÙŸ+±f\Ï\ê\ês\í\âK\Ô0·\\¿7Y\Ó>¢Ù´v\íR\Ãm=c~8\ÙÙˆŸ%\Ö\ßK\Ñ\Ç\Óü%ˆ\í¤÷\ÜD\Æs¹[ô—$\ï¼\ÑI\î!“m«¶ñ\Æô6vóŒù:…ò¬\ãO²úú\Ø÷ŠK\ÔbøMWºY6r\éb\ÂğÚƒ-Mö\Êlñ(£É„\'¼OoeÙ¼l½\ÍŞ¬õ\Â0ò\ÚÛ´f\Ù\ÜiÉ‹¨—\äc\×\á\ß\èqCÕ™Ô»\Û\év?’Ü’/‰\ß\å\Ğ\Â\Î\0wos\í\ìw³0—B{[xˆg/\ä).\ã.‹òø@\ãt\Ùu^:\ã2\å™d\ìøo¼v\àöpQö`ŸnÀ{µû\í›\'yl\ë =²G\n\êW\ç\Én\Ù\Ôö\êÍ³8Ydo‡\ê\r¿›2\rºY–ZÉ…†ö±ùaùc<‘ùòE\È?,~_ÿ\Ä\0 \0\0\0\0\0\0\0\0!1AQaq0¡ÿ\Ú\0?¯\Â__ñ·ˆWW\ï\Ô|	rı‰]İ³>}O’‡—XO¨ø±õ}l\Î+¯`>D\ã\"\Ó\É2\Ù/\Ñ«¸üvŸ\îRrñ:\Æò™VC5\î}¶\Û\Êü·HòÅš[&\ÎNZµ–Ûø\Şq\"\Æ\Ú\ÌIñu“ôZµùj\Ómvt9/ÕƒEkòü>Zv\0Á¿¼^Üœl‡“cmƒ£d\ã-\Ü|>I„¹\îB\Zõ|+²Ae²\Ñ\Âv^6\å\ê\âüF7S\Ñ,‰·]Kz\ŞgÏûµHÃ“\×nA¾¦\ÂÈ¬—è“»e¤ô’©#OŸd\'dZZrf\é]YD]°,\Z·\á8{Î‡²XÛ\ÂA’k\ÜCô…òúú>\'­˜l:\ìÁ†Ç³\äAœù4eô\Òü/í—¨a°a²ğZß¯7Fzdr\ÃP<³$ü·{`x_v¸Jl\Û\ËcÌ¿\ïg{>„e\ëH÷:E„`^^\á \ä·#>/±‰\'\ãöĞ¹¾}-„{\ä\ÈÁ\È#nµ€lø¼I°\ã\ê\à\'¡ğH\Èú†\Zû=¿\Ø]òy<{5„\Ñ¬¨sYõm\ç—!\äO\Éı¯Ã½&<¹¶.\ã \ê\ä\ßbŠ\Ë\á#Ï\í\å\n\×a‰Y·&û¿)i‘KBN\Ú^‚8»‡ÁSIß†À-®õ€’Ş¦œ›¶¦A\Ñù}_\í\ËkG\á;\Û\Äğ”ş¿ö#1\É\Í\ÉÏ²ß»GvWƒõ\ä\ÇOˆNnF›­‹»’=–rVıö\ß\ÉÌºB\Éû\Ë<½F>6m³O\Û<0\Ç/Ş—ùl\ïÀ°\ï	#\É>Ò¾Ò·\ÙRo°¿ao²¥s²¿moÿ\Ä\0\'\0\0\0\0\0\0!1AQaq‘¡±Á\Ñğ\áñ ÿ\Ú\0\0?£Wô‹r+Á=a–\"v@ğn`fdˆ„Ÿü¹_ú\ÂT\Ô?ğ„X•r\ì¯ó¾ıD\ßü\Ïq\ëôV%–N¼û\0W’›\àÿ\0\àÿ\0\Õ\á*\Z!+?øO—ŸH¥®\ßâ¥©\åg‚*.pˆ2\İR\Ï2\êĞ¥øIõ!g\Ò\\SI\àLr(!<¥\ÛD\íT\ÇqúAQ§9‡_cD%\Ó\Ôğ A9ÿ\0\ÃS•/\Õñ3Ñ¯A\â*ô?\ë\Ú9sQñ¥+\éò­Û¯\Ñ\Z¼‡\Ù	§\ßCğÀ®Â˜)’\Û\ä\êiÁ\Ø\ìza†±\ï¨$¨V2\Üs„\\\ïQ\áô¨\Îc\ç(\Ë_c\Zğ[¿\Ê\Ô\à\çG©\Ì\ZÔºƒ/ÿ\08˜\å\Ó>\"\"u«5¬@\Ë	¼û\â~R‚/+\ãò\Â-@\Í\è’üLMúR\ÑÕ\æ%|\å=¥ğš£\Ëğ*W’L>N/¹¬°‘ñ\Ñ\ïP›LlY®÷]•ÀU¬\Ë÷Íµ¬[\Ó\r§¤H(9\r[\â:r\ÃÁ\èş\áGT\ÉD|\Õß¼»[c\Ä%\ë\Ö\Ôi®\Ş\Ä\ß \êºòhvÌ¹³1Ÿ\Ğñ0¥lŒú½:‹:@ğ~YAóe£xJy[—\× }ü\Ï9@H\Ó˜ùó\í´§—\Î\êrB½G\äñ£*\r9\îi~Xƒ;[}X„V\ìKÂ‹\Ïa\İn¢\Ğæ£˜i\é0\Ê@Qª\î\nRƒHl{ş\î%\rm—¼½#sw’úı0ó–\à1`Ì¬5¿\\ò–O`\íñ¥\í6»ƒGOû¼øˆG\Í^V3L8ü\æö`Ø4	\ÏşZ˜»~vÊ¿YR¢®;E$ÁcC»üŒ\Æº‹Ršrºˆ‚\\H¥iºÌ¨\n\n¨\àm,/o™Eg\"\ßin¾¾(\'6c¿\Ö9Ÿ\Õõ†´go>e\×\Û#$\Î\Æ+\Ô4A¶¿	\ïÀv\ê?*¯\Ë¤|	\Â+\Ñü\Ä~„?õ9uyóbğ˜˜ƒŠ•1\Ö\Ğ÷DÍ¸˜€\åÄ¯\â\İ\Ê%@\ÃZñ.\ÕCJ9yø\ÔÛ‘lP.€k@x€¶q\0Š¸H–e+#Üº\n–øô=÷0ô¬¯PĞ†B>:€ ü†\Ö\Ïb¥\Ø¡±t=b–µ\à‚di_<%ş\nXßV #•\Ğ\ã\ã÷õ\ÙN©~\æ¸1\Ì<*¢|¿1‰<J-ù<‚€{n*\æ\í¶\Ö`\Ñ\\LLÁ—¨F¬´FMËŠr\×mül˜uX¿ô„*ck\ë\ÔBŸW\Ã5M@xxe‘¤Â´o\ë±I‹Õ—Y\ï]}#¦Cƒƒû²e\È*§\ï/\âZ”E¡©„\Ì{Dµn:~zC¹p\0´\Ñ0Z\ß,Ê”\'¨\î	ŒzüL\à\Ê\\©p\Ü \Ë1Óˆô¶k~ \ÔV@4í£³Ï´\ì1Op\ÊÀÅ›ş\Ã\è£\Öl—¶™Mp 0oş}#ÍŠCR\í\îa\Õ\ÂK¹Sõ`J{N„cœi³X}.4»ò—c©õ”öŠ5ªµ08•¸,APóCV\Øfó”şõı\ÊÙ³8şøŠc« 1·2ş´Ê²®øIJ‡¬\Ï\'\Ò.P\ÒrZù\Ì[Œv.şœ2°\Ä\ÔJXŒ\åûa¿Ä¡[¬øC\Ì\àCõ¹Uƒg\×û\ï47 ¨\Üõ˜\ã8Q4”vBT\ÜF\İ²\Åj4mzú\Ë\ÚC›ptK\Ôx(–±a¾™`Áwa72	‘†%~O~`#@¯\ÍÂ¼\Ø\å\ä\ê?XÆª¯´T‹´LÙw²®J•m\Âæ nñş\âÌƒÊ”ÿ\0\"siYyÑªƒ\Ä\n§‰~¢Œ›­\Ä4Vp\î\rfE¯Oö=\ÃV[Ë¸ö\àÊ–\ËøøPH=n‚û\\J\í\nn!¤Ì©U°gCGó\Ö\Z,òU\ÍL^%š£V\â`vÕ•ó\0~Q\Ûğ\É\ér•\ê_\Ä,+nŸï¬©d/“!AP2@]\ãÌ¶€g§õÀÀ\ÅUKşMc|\Óøñú—~ƒõş“ıc\r\ÎÀÜ†%˜\Ë\å\ä<a\Òş\ìGy^-;™r)»\æ!\Ö\ë‰cd„Ú€¼/R- \Ú\Ø\\\â£Z–÷(†U¶dTôƒ\ë(@–ûDc\Û\ÑZx\Èz\ßR„\×Nj<q\Ì\ÅjV<¯\ÄB#¦®øu\rø^,ú^%À š2HR¯ll\ÅJ\ÒB¬²\Ó\Ü?\ÑıD 	\Ğ\àT9\é~!Œ\çQ3-‚c¸‚YN_v1hıJ…­eıK\Ù³„v\âİ’œJb»/ª\ÙHz\â‹\Êø*`v\í|\Ë#¶^\ÕPƒ­lt§ˆ®¡·\Ük²_{@¦¸€\ÓÏ¼Pdf\ÎO–\ä}\êT>³vˆ}*1œ\Z\ì\Ô]ÁM}c2\n\Å&Ÿ¹ñ”½¡¼\Õâ‘„Ã©H+\áL˜c\Ó?\à\à¥\â4¦—¤kóGO¨Ÿcü‰3`\åø\r.\Æ\äò¯i`\Ê#\Å®^\â…\æ4(G,R@L5ÇˆBA\î©ì–š<\Æ\àğAıJq\Í\ä>óY–£Á\é˜Å¯\Äw±‡.bq\ŞU¿x?•¡“\Õ~`\æ²Y›\Ôd´\Ñuöa\ÇUOT>|2\í\âÆ§¥\Æ\êoşy˜ú\íü¡0^’‡†Ë£º9cªI/ƒ][pc\İ\â]\'$\ÑùVQK\Åı¡¨R®Wµj³Á+)%¼¸\Ã-›‘»?ùŞ¿‰ñ¯#ø?p°‰\á\ä\Èy´>{…±nŒó\×\êkú¤\éŠ\Â\Ç#¢²DQ+¢\ê†yP!<œuQô¼Œ\ÛE\æ#+&]«\Z³yÉ‰LTta\Î\â™M\îb‹v{ªù‰O\Ëúÿ\0ˆ\èW,Júü&R\Z!\é\0w\ëN¼\Åâ·”z\ë®ˆ\ÃO‚~a\Ä@®\×,aš®%7›1gª\í/Áp.k¸ºD¨y\r×¤É£Áw.F·*-\Æ	º”\ë½_ùM\Ók¼@µ¨<T`.u…†\Z7bs,b\"µa\ãu\íöŒ|¨\×\ĞFjfÔ‹{\Ş4b˜…;E\r--\Ê\íC‚V™\ä\æ²z\àWÖ«i\Úù”ôUôó½°\ïó`xª€¿”£Œ¢\"T\Ë+œœ\â\"\êS\ï\È@\0w(÷\È\ÂôP\î¢\nHö–j\0À±¿ü\çCY}\0„mšLñ€üÁI°¿\ßù8®%\ä\èõÙºB\èõUQBÀÀ@—_¬EV‹\ã\ÏÜó÷U\Ğ\Ëm\'˜gµ\ÆÖ¯  \Ä#©LXlvÑ¶‰Š€1\Òğ¸fªyı|?XK‚õÅ«|™©\å¤$ª,‚v\Õ:\àüŸQ™‡G¼$G\ãÄ° .ˆW{ 	^\'õ¨¶Jòÿ\0‘Õ–6\Ü@cEtÀ6K\î\'€Šp?‘f^V\n÷X¼\"\è+?\ØTLz§\îB«h™q\àóˆxˆ«ø¯Ì¯\Ú ×œû0 ]\rJ°´S„K^‰¹ôÊ¡“†m5\Z\İp\\˜ŠÁØ…˜­KV¯ó¯\ÔOŠ(ù\Ô/\âZ¯8`\'¬.ZI±¯Y±£‡]¯\Öv¤ğÿ\0·›\':w)¾“oµ	`\àKˆ\Ë\æ\Ã\æ™æ’IEX\Ç;K±*”av™«}x¬W\ì·-Z¶\Ñ\Õ\ß\Ú,­­w’\ã<¦ıO\ÄuH¯}K¡WÈ&\ÏEqM…ç¿;%hWµŸh›q9i\Z\rl{@j\ÓJŞ¸\Ä\Ç÷¥lr€\Ø/\Å@B|\çó9½\ár\ïpU£ªd÷„[\ß±\rú\á\äœ\åŒÀú\ÕÓŸ1\í=+\ÉK˜M\×\ÒÂ¼L•.\0P°f—z0dQ¡\çø”`A\äf \Õa;˜–aKÍ¸ûŸš+h¤+­ƒó\0–\Z\Ç\r\İ1L4bÆ©û€ªÑ«û»ı\Ëc!E§\ì\r{A\âò\Öİµ\Ö7¤L#JšsV5(…Š1EjU7\â\nÚŒ\Ğü\Æ[ò<\ÌD]V7\0 HO#\İFh§™w\â,+\ÈÀ\ÄT\Ş\"\"õ9ˆk\Zõ„RW\ÄS‡\"¥r\éñ\É0»1›Ï†+WdW³O\Ş‚k\ÓD¸™)G\r8ú\ÂC4Â¹~%Kpd\Ç\äµ7rbôjgµ`ÛˆE\Ûs4«mr~!\Ù+µ®ô°Õ›R©\\SŒJ(hÁ1N\Úú\Ì\Ü¼,°º¸1\æ†75\æp\Ê\ï#\È\Â\nr”²Ï˜‚+Á–ƒÔ®F#1\éó-:w 1MÁJL\ZÌ³˜\n¼Á=;TF\Åü¾\î9ª\ì«üA\Ô\ß ˜ú\Ì¥e¦˜H\æ\îPRñ¶Õ§«\Zwö\Ú_\Ù²®–.\\=!(-\àğõ1L³\Ö,UYK\Ê[\Å+\Ïı˜Â¼ »%oºğò}jVbœ°:er\ËiK-½\Ô\å\íólBe\Ã%±I÷(U\ê1¢	i£Ä§ºycCœ\îT¸XôØœfÀq\ë0ğ\ZGk±†Á¹fV¸‹E“G\Ä Ko`™Zzı \çoUõƒ\í3£X¡ì¤ˆyH§­øÿ\0#ŠÆ¼>a¦øYı`EYù\"È¬£\å\ß\ÅË´ a8¸¡ô¹]–N‚\×\É\É\ï(v®\åjXATó°½–,6,\Å@z2U¨=b4/ºs‡\âüŸR_md½\ÄZªYø_\Ú\Ğ^‰\n¹_£jª¹Ye\ã\é\ãñÎ”(ººø‰€œ,Å‚€7%Q\ÚPYğ,pP¿¬ «­\ì:f¾¶!‹‹@;”_“\Şz!FU`\ï\ÅB5Å£\à_x\é5±@\íT7}“³[~²÷²\ÈAQˆt#Ioª3\n\à\è\âP»_¸\Ô+2«¯êŒ¬^Å®Í©¾WÒ˜\ÎW	ı¸•@\ØúfS\ÌT\nº·\íó)„\Èó‘“Ñ‹\rVZ´e¶	µ7‰KA¯h/§P„\äº\ÌùF\Z\Ç\ì:š)6\n§\Ê\Ë°*b\ê&€1[\Ï\âx;GEÇ¸°¶¦¼©Z\Ë\İ¿ø,+\Ğ!)…ñµøû\Äe#\0\ÌI\\šŠ…7·\íûJÁ¦¯\êw…Tø•iÁ\è\ÎÇ´C‰Îf¼\ÂUŸ‡C™[²\æß‘\â\ÑK)\Æ\î;ıœ¨¢¾\Z¾&\Ûp,–°ø	LƒD9şó!´ .ø\r\î\â©U”\Ñ\Ô\nKnª\ëª÷ 1\à\í%™Š¾Ò˜`\ëü»\"‰\ÒÂ½gxT6Ÿ†}R \0\Ñ%¥õ2‡‚]š4ö÷~\Ä˜)TN!W\rCA~\æ\ÍS¢ú»_?\ÜW^öo÷8%5©q†š»\ïù\É2 Š¿ ù\è«?	=ó\Z\ãIHr\ácy>ˆ¬ònU„y}u.nÔ²\æ\\n—pv¼°\\‚i\âbªœX[\ï´15Ú¿h•”\İÿ\0ËW6›}!€ù*ô&r°\rÓ˜u\á~D!:Rµyš\é\ë–\íö-†\äò\\fº[&\ìÌ g¡\áj\Ş\Æ>`QD4!³®º‡N+\á¬pÓ¾\ä56Ë¦ÇŸ\ËÔE§o9=§sN‡\è\Ì\ç…-Û¡>.[¨„\×\"~\Ø`(«;x\ÍQ¿\Ã>`¼D\\kk\ŞQˆ.‹\ï¯ö\0ToØ˜ğ¾b\Ê\Ã\æŒ\ÄS\Òg\"Pr‰˜\Å#£k‚P–À\Ùuş\Ô\é \èqX®¡J‚¯OX5c9—^b:\Î\ÖW\ìLg&.b\èH\r«\ŞbòTÉ²ğ¤Š\Å,\ßÊ›“¶š#\éH\"Yœ\ì\æUw½»4VOm}¹‰X9J¡·\â¸\Õñu\Ø\\\Ù\àÿ\0’`S\Öñ0-*ùH™Æ°1eù\Ä:j7[<õ\Ç\àV”3™¡o\Z;†	*´\çw™`(†)ô\×\ê PùkOX‹?\ë\ÂB™¶\é 6ü|\Ë\æ•@–«5ñRö\â®\Z \İz‘ø¬ŒE7‹S{Š+	_ı¡u\ã\0p\Ìz®®:½j\ç\ï0”K³±‡ŒyŒ\ë¨\å\Å_Gt¬j§Áª5§N»Šª\r\r\ä£HÀ:\ĞNu„²,¶ü7	eŠOx\è­a\\•ÿ\0 · h\ìóıÔ¤wÈœŸÔ¸¥R‡¾ş²\ÆQE´\0¯¬Nt”[	œ\ëY\ÜU€Ô•\èù©p\äş¹w`,7v\ËTµVaóZ©f\èm¹\î8ö–k\\^w6şq)\Í\âe\r2\Z©\î7ğ\r²†Ÿ0J¬í‡\İJT\ìÇ€û¡‰—@8j}\ÛVYe\Û\Ğ\ç‰d¸-F¹r‘rN\ØVıZ€%¡Ex4·Â‹\ÄÀ\Ë\ÉV÷^i‚b\×9—™A¦°Çˆ¸°<š]\ÂÀ.Š\æ:5Cj­³~YwP\áe—…ª\ã¸\ã\ÔÃ£—~’ µfÚ»\Ûñ.˜0:\r#¨ƒnûú@Tj«W¬hq,°ƒJ¬G¤¬\Ê\r¸Y\Â÷– i…+O¤Ò™\Zú@\Ò.¤»\r\Ìù\nZyZ\ÉÇ\Ñ\ĞhqCË±„e÷‰¬\Z\á\Óq\Õ	r1nµo0—†¦\Üq\é^\å^>²!–Mx\Ä1P\ç\0ü¿IE\ïPŠ4ö˜}4Z_@\Zñ3•\0c	X\ìª\ä¬\ËU2ŠGŸ¬<\è\n\ZGw\×û2¡\íu\âñ\É)„ƒu5V¤QHf\Ëi¥\×Ô‰‡tª²Áñ)oµ>\ê\Ãu¥™nÅŠ\Ô[l¨Œz°Rf¸\ÇU_kÁm5€Pü±›ò™¼–\Ğ_1ÀuŸ£`«\rª\0[Ï¬²Š£1\è9™p\Ë@\Êÿ\0ûyIö5L¼4÷/şJ¨·ô†Tñ#-u[a\â!¤\Úm…sÿ\0vÅ\íuƒ\ë\êSjX[’ı{‚\Æt®’\Ö\Ş[_ˆ£k¦gõ=¡\Ûa\\¼½\ÔoH=\'Ü”nl©±\×OI\Ô\Z*ô¬jú\ã±`s\0x\×\Æà¤‚Ÿ^ZŞ¯q«n•}ˆß¬\Érˆ\è^Ÿ\ÌÀ\Â\ßˆvV9©\Ê\Ø\ËªaH‹m”\ì³¡V‰G\ê	¸\Ò\å.²ô™†R¯Ş®\Şe\'µ¸\n–\íH¾cwXa·º­°Š\ËG|}¡\ç‡«\Ã\Z‚j\Û.°%¨k+9È¬\Ğqr\İ\âœsER\Â@‘UÀk\\Ë€¼9\îUK›Ê°˜ wª,/òÅ…»¼ğhñ59V´dò \æP÷@®u„=iŸ1ş!-X­zP\ÔÜ€\Ê\ìÏ¨{Bš3$!*»\Ë^X¶¡o.®&[hFA^(\íf£\0Šs[\"r¹¥½u`\Ò\ß\É\\\\ •ÁXD \×U\Ò@À¾\ZyËŒ²À\r¶Ú\í\Ä=ƒ!^k\ÚS‚ğ#¿06ve\0*\×0%ó\rR\Û¾ñ&A¬v²5·\Ú1ˆz\n‡­	\Äpu= ø•jˆ9º/†\ZA`h_a}\æG*F¥[«±»~„H¨>ÁÇ“q*7ÁNš\ÌE\çlCÍ°\'.\ï\Ízn?p6Æ©bTûnP\Å\Ñ\"\n•n@¾£·|†Gº¢/×—\ÂH©šmµJñ,\íÆ”ò`|Êzª”{a¸š‚ƒ°`\n\Åd¬8\Îù‡\Ñqvø?XŠ¥1Ş +˜\Ú#Uvo÷3›©hw‚¥ñ\î„\r‘¿H±j\"PX}ÔŠ))™\\–g˜§G\Ş=@K\Ì\á\ß\ã\Ú+\0¹ón`1}ı¤g\Ö÷À`{\n+BY ]ªùqF¹ech£ÀQh8»\ÊK^Cª\Ù­“CkWp©”o«\Ù\ã˜p\ÄE-›«‚M\Ç4]	‘\Íy¨1hÛ·„ş¨â†²C\Ù\è\\_„R®+^¼\Ë	\ÒW W\æ3¢‰`—\Û\×¹n8|ÁqT$P*şF…$\Ø#cŸ›`\Z´§\ë`‚R\Û_ûg“H€\Ğ÷q‘K\Ûx¹P$Qd\âı\êZ^1´\ŞŞ® \Å&XLÌœ¹\É6w^c a“^¿òPj•§/™¼¦\\>\í[+®\ßF\0±\\\ÄõBN\"\Ñ\è†\ê­+\âW7r‚=%·a\Ú_«\Ñ5f¨Q.S\Âl÷US—ˆù—B¹“÷ÊŠ ]j\ÆO_¨J†›^ˆËµQb\á8üÍ„¥Gœ\Ël¹€°ªw¸»:\åo¯:e\Ğ\×\ÆÁ=*+š7—t/\Ú&C4É\"¬€µ\Åj6Â†)¾³ğC1fh­%\r\Ğs‹i`/ğó£:\È]\nõ¯8·8¿û³c\Ğ-U\àfÿ\0˜R°™0¯0Q6r¾†xsF<\ç÷PxªÕ§ó\nû„Y\í#yÀ\Ø£6*”Æ¯¾ı¥ixP¨h(\è\Ä60\ÚÖ³ö¦®p°8ö¸\äA\å|²’\ZrQbP“t\Ó}p\ËpAró*±±µtÿ\0b„k‘V¦\Ú\×õÌº\Õ\Â\èoš`!n\ê\Û\ZT‹t\ÕÉ˜·5ÑµeW´´2ŒÖ‡şC) :ƒrÃy•¡wX\Å@\"fwO5Ñ¼µ3Æ€ºğ\Ğ\í\Öù\Ï_\Ş`eWe\Æzş\î 6\Ô\áu€#kƒ@+^jı\ê=UY§®e”²[ğ`>Qöt\î/ÀE\â&ü­\Ô\0\ÊEAu6­S}\Ô.TÀı\Ëf£ª\áö]\×-\Æ|K¨/\"\Û+\Ì\ÙA„cš\n˜\ĞZ“Ò–8ğ7‰\nøGj„¶\ïú˜ˆ\Î\Û*e\ÙlLŸ™–E\Z\Ü\'V5\\Ü·t.S|wˆj\nù¡û\Êt\Õ,¢bø÷ƒCJc?ˆ\Çb\ç\Ö;;³ûñ\Ø\Õúk¸³l*\èÇ§¬©\ŞõwÌ±‚\Z\ÚÔªSkR„\î3\éÙ·\Ämª_ø›\r÷>ò€Ò‹\ZOôøŒ†\Ævyú\ÂÒ²xj\0º/3%ked°\Ù\Î\á\Ë\Ò1À‰Š\Ã\n2~¿X´dn€P¯\ÉLW\Í>b”\nQ$Tºr|\Âj¨2^â¢€\ìy®¯\æi£@m“š\ßQHª‚+C\Æ+9Ä¤\ÕIŠ/W\âÀŠù\Â}¥˜.i=4Ê–€4p½ekGKª!¢«^biì«¯N=¦\Ô¢ù¬x•¤Ä¦\ÒóPª%öuıˆŸhı,\×ÿ\0‘\ÒU¡f‚ƒ\àÃ²}?\á„;”g ¼:\ØıØ€d³B\ëúK˜r¸6u¹u´\Êd\\÷\Z\İe\ì´Rµ™ £\Í\ŞU\0©N“5˜Fuµ!\Õ\Äz–‹2Ö­M÷P=4§—·³\na&(ydÇˆy\í\åkX=\Ö:€°òÛ²š\Ö>±j;ª(\×ùqÏ›@*\Ø~‚_h>\Õtı \Ú\Æ\Ì\'$§[]–Pşf \0b†,¼&‡\'‚Xvÿ\0} U—\âVu‹W~€Ywœ/ÁŒ—Q‚™I(\ÚyŒP½\Ó\ë\Ï?B)&– \åB\Ú}!Ÿ°e`…\é\ËY+_\Ö\Æ=`\rªw‰F`²jªÁ†”U\ä\Ät\áÎ–\Ş]†·\ÊNH¼\\÷˜\ÂI¡;õ–˜¸…3û‡L‚\èñ\\\æ\éºüı\"±\0X]¬,\Êbz±›÷\"”^<ƒ¶R×‹û@\n`\Úf\à\ZlÏ§_¨K-‰JğWü‚\ŞmÓ¯T\×V3\ßò\í\Ğù)øpeGŸŸˆÁ5\Î-¹O\ãKÿ\0%¬\0\'_•o\Äj\ïW”\n\nwnØË”20-µyÃˆ•6Bm›S…3N\àE‡7A~’\áö\ß\êc\×,¸\Ö\æ\Õ>¤¸#‹šÀ\ç\ÖgA‡fØ¡6\Û\çüÎ³y\Ïöb\ÒTb8\Ü\Ä+­ıQ\Î\Í¸Œ¥\Æ(¿°÷\Õ\î]Èµ›¸[GŞ¼Nšg%/qÆˆ\Æ~¯\í\Ê¿¹\ÏñdH,\rÁpm¥o9¨#‹<Nk÷\0F\Ù\ç	÷€Z\àˆˆY\è—\íR¯(­pH>‹^ûŠÁ¦ş¬úX\Ø1k\ÌU+È»O#\ÉÂ’÷\Û\ì»\0¨\î?\ÕÔ–õeĞ´‚ ˆ£Võ=¢˜\ÒÒ´rJ lN\Í:ŒşRZò„\È2\Ô\Ù\Å@w¨\Z\Ë\0\Ô>ŒlTª¡\ì\ËP¬DŒb\ì@\ëH\Å\ë¶\à—ŠX\á\ëõûB@m\ìõ4¼>Ò\r\ÙukûöK#U—½¤P\É\é¹@	xˆÀY÷%\×\r}\Ù~,\'^Tøü<\Ä2‹Éœ\ÂWpù7¨„0\n‡E;Ad²W¢\Ë5\r\r\Ñ\ZÏˆ\è`\Z³K\Ö\Ø/zo/g\î\Æ2	a¼6K\r€…@\Ä\r2ª“Š€EùŒ¡#%\äEk\0\çKö~{pµR0˜ 3\Èó0IÀ\ã¹xSX±\ÊG\×B\Ï\ï¼P{]\Ó]²ˆ@ºNS¯½Bı”\Ğ|b¦\Èk¿\Åkÿ\0”¾i8_|\âo\ØÂ¼úF3vZ=£\Ğ*†\×W\é„õ0h8æ˜£\'«_˜aZ\È/¼4\â›g–Ø™–\ÍFh\Ô0dSS\à‰Zyµ·\ë°q0d‡Â’—\ëQx¥»\éeÁU\"\Í\nO_\Ä>›v½7*‡¼¹+Ñ˜†m¯s]i¯Wo‹Ç©)\ëVG\êykMPüÁKb‘_6%‚\"uú•\á\Î\éÜ¥G+…Ÿxb‰¡(=õqôµ\Êm*Y+x\ÅF:\â„ôª–Jiy<>\"!™7œ‡\Ş3\åI°O\Ë\ËXÀYnƒ4i€\ÂÅ˜\í–T\ÛT,8*.n\ÌY-hºª\ÄakV—)U\Ïs5,³‰@—tDÅ¡\ã\Ä!62Ö¦\Ë\n\Ç\Ş\0-ñ0hL|¸¥\0p£&¥%l\ê¦ø¹˜òX¹R$¿†- Q;rŸe\Ä0\ØòqmQ\Ô\Î=p~‰‰A^%`\å—xrMû\Z]@U»n2i8@Á•£ƒŞ¸ƒ\äSMUÿ\01hØ¨wóW\rŠ\ì\îÿ\0S@ğ^\àe\Z\È?z„\r÷\çˆ\0ŠN-ûb0ª]õY@b\Ò\å‡\É\×X—\ä4 ,¸¨¥·ª.gÅ¢N\ã@%Ç¦º\İ]Õ—W\×\Ú\0K\×U¿\âZŠ¢õø%–r0pø\Æ\ãd\Ò\Ã\0V\î~«0°\Ô- Õ„\È©\\.\åÔ‚(sˆ“†S^uÆ \äVƒ\Éå—¥e\ÉÇ™aİ“\rU\ÓR\\GYY`\ÆZP\ã¸e:0\Ò\Âc÷¨\07\ÖKU’z\çõ4‚\Ã…¶W\Òô!B°m¸—È™(«·¦l0\çˆg v˜»Œ\ÛL¨[\Çü€¥,EY|À\Ü\ZYşË‰¤po\æá‹œÆ—¿L\Ë\ìQC_\äqpTÍJªpM\êJøœ­\Ã/wõ¿A……µo³½2\à¸ b½}¾\Ğ\ÑN·‘óÖ»0QC5\Ë~ŸX\0Š6\ç\âüEgº¥µõ¹f8wcTólğjóp\ë [O?©fn—A¼\âœ\äy\îb,\0›\Æıe3	é¦¼UzC5hmÁ©YT\ÓXk¼M„s\Ì(ƒw”\î`†Š¢sxª;\ŞhŸ§\ÒQTXl\çõ\İ\ÔP\Ù\çñ\Ó	m\ÖôıH³Ÿ\ãñ1\Ä/ñı&?\ëøöiı\Ï\í(Vœ-Å®«® jxñ,Pš*½%o,ıQd,	AB/¾\nƒŸ7¤°Ó¿\Õ\Â\íÊ\ï¨õ²lÇ¤L\Ûÿ\0„­¯•x½!Z)‹~<A7`Sºı#™\È@ó>‘€`\Õÿ\0”0Hq}!QŒ|{FP}#\Ä&3U×‰\\Kò|EŠ›[»5Ô¢\rz¼\Ïÿ\Ù',11,'El Salvador','San Salvador','Rompiendola como siempre'),(19,'Grecia Maria ','gre@gre.com','76684337',NULL,NULL,27,'El Salvador','San Salvador','La mera mera '),(20,'Gabriela Lopez','gaby@gaby.com','76684337',NULL,NULL,28,'El Salvador','San Salvador','agaeg'),(21,'Brayan el bajista','bra@bra.com','76684337',NULL,NULL,32,'El Salvador','San Salvador','sdgserger');
/*!40000 ALTER TABLE `emprendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprendimiento`
--

DROP TABLE IF EXISTS `emprendimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprendimiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) NOT NULL COMMENT '"Huevo", "Pez dorado", "Tiburon"',
  `descripcion` varchar(500) NOT NULL,
  `historia` varchar(500) NOT NULL,
  `eslogan` varchar(500) NOT NULL,
  `inversion_inicial` double NOT NULL,
  `fecha_fundacion` date NOT NULL,
  `venta_aÃ±o_anterior` double NOT NULL,
  `oferta_porcentaje` double NOT NULL,
  `id_emprendedor` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nombre_foto` varchar(300) DEFAULT NULL,
  `foto` longblob,
  `video` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_emprendedor_idx` (`id_emprendedor`),
  CONSTRAINT `fk_emprendimiento_emprendedor1` FOREIGN KEY (`id_emprendedor`) REFERENCES `emprendedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprendimiento`
--

LOCK TABLES `emprendimiento` WRITE;
/*!40000 ALTER TABLE `emprendimiento` DISABLE KEYS */;
INSERT INTO `emprendimiento` VALUES (1,'tiburon','CanciÃ³n','Mientras me baÃ±aba tuve una iluminaciÃ³n','No tengo dinero ni nada que dar',0,'1971-07-28',1.234578912345679e16,0.3,6,'Alma JÃ³ven',NULL,NULL,NULL),(2,'Huevo','Somos four','Cuando se saliÃ³ Zayn','Four',5218.22,'2020-07-28',500,0.56,8,'Four',NULL,NULL,NULL),(3,'Huevo','eargag','aerger','shtrhh',12314,'2020-07-08',123,11,19,'shsth',NULL,NULL,NULL),(4,'Huevo','gear','eargeag','dafgare',123,'2020-08-03',123214,12,20,'agae',NULL,NULL,NULL),(5,'Huevo','aerg','aegr','adfg',120434,'2020-07-29',123,12,21,'asdgaf',NULL,NULL,NULL);
/*!40000 ALTER TABLE `emprendimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_emprendimiento` int NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_especialidad_emprendimiento1_idx` (`id_emprendimiento`),
  KEY `fk_especialidad_categoria1_idx` (`id_categoria`),
  CONSTRAINT `fk_especialidad_categoria1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`),
  CONSTRAINT `fk_especialidad_emprendimiento1` FOREIGN KEY (`id_emprendimiento`) REFERENCES `emprendimiento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,1,1),(2,2,2),(3,2,10);
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fundador`
--

DROP TABLE IF EXISTS `fundador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fundador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_emprendedor` int NOT NULL,
  `id_emprendimiento` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fundador_emprendedor1_idx` (`id_emprendedor`),
  KEY `fk_fundador_emprendimiento1_idx` (`id_emprendimiento`),
  CONSTRAINT `fk_fundador_emprendedor1` FOREIGN KEY (`id_emprendedor`) REFERENCES `emprendedor` (`id`),
  CONSTRAINT `fk_fundador_emprendimiento1` FOREIGN KEY (`id_emprendimiento`) REFERENCES `emprendimiento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fundador`
--

LOCK TABLES `fundador` WRITE;
/*!40000 ALTER TABLE `fundador` DISABLE KEYS */;
/*!40000 ALTER TABLE `fundador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardado`
--

DROP TABLE IF EXISTS `guardado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_inversionista` int NOT NULL,
  `id_producto` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_guardado_inversionista1_idx` (`id_inversionista`),
  KEY `fk_guardado_productos1_idx` (`id_producto`),
  CONSTRAINT `fk_guardado_inversionista1` FOREIGN KEY (`id_inversionista`) REFERENCES `inversionista` (`id`),
  CONSTRAINT `fk_guardado_productos1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardado`
--

LOCK TABLES `guardado` WRITE;
/*!40000 ALTER TABLE `guardado` DISABLE KEYS */;
/*!40000 ALTER TABLE `guardado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `especificaciones` varchar(500) NOT NULL,
  `oferta` double NOT NULL,
  `porcentaje` double NOT NULL,
  `fecha` date NOT NULL,
  `id_emprendimiento` int NOT NULL,
  `id_inversionista` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_historial_emprendimiento1_idx` (`id_emprendimiento`),
  KEY `fk_historial_inversionista1_idx` (`id_inversionista`),
  CONSTRAINT `fk_historial_emprendimiento1` FOREIGN KEY (`id_emprendimiento`) REFERENCES `emprendimiento` (`id`),
  CONSTRAINT `fk_historial_inversionista1` FOREIGN KEY (`id_inversionista`) REFERENCES `inversionista` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interes`
--

DROP TABLE IF EXISTS `interes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_inversionista` int NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_interes_inversionista1_idx` (`id_inversionista`),
  KEY `fk_interes_categoria1_idx` (`id_categoria`),
  CONSTRAINT `fk_interes_categoria1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`),
  CONSTRAINT `fk_interes_inversionista1` FOREIGN KEY (`id_inversionista`) REFERENCES `inversionista` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interes`
--

LOCK TABLES `interes` WRITE;
/*!40000 ALTER TABLE `interes` DISABLE KEYS */;
INSERT INTO `interes` VALUES (1,1,1),(2,1,4),(3,1,8),(4,2,1),(5,2,2),(6,2,3),(7,2,9),(8,3,4),(9,3,5),(10,3,6),(11,3,11),(12,5,3),(13,5,8),(14,5,11),(15,6,3),(16,6,4),(17,6,5),(18,7,1),(19,7,6),(20,7,9),(21,8,2),(22,8,3),(23,8,7),(24,9,2),(25,9,6),(26,9,8),(27,10,2),(28,10,4),(29,10,7),(30,11,2),(31,11,6),(32,11,9);
/*!40000 ALTER TABLE `interes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inversionista`
--

DROP TABLE IF EXISTS `inversionista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inversionista` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `biografia` varchar(200) NOT NULL,
  `email` varchar(150) NOT NULL,
  `tipo` tinyint DEFAULT NULL COMMENT '"1-Individuo", "2-Empresa"',
  `id_usuario` int NOT NULL,
  `pais` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `foto` longblob,
  `nombre_foto` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inversionista_usuario1_idx` (`id_usuario`),
  CONSTRAINT `fk_inversionista_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inversionista`
--

LOCK TABLES `inversionista` WRITE;
/*!40000 ALTER TABLE `inversionista` DISABLE KEYS */;
INSERT INTO `inversionista` VALUES (1,'Mark Cuban','DueÃ±o de los Dallas Maveriks','mark@$$.com',0,1,'','',NULL,NULL),(2,'Lori Greiner','Mi patrimonio es de 70 millones ;)','lori@baby.com',0,2,'','',NULL,NULL),(3,'Grupo Poma','Millonarios ','poma@gmail.com',1,7,'El Salvador','San Salvador',NULL,NULL),(4,'Grupo Poma','Millonarios ','poma@gmail.com',1,7,'El Salvador','San Salvador',NULL,NULL),(5,'Inversores s.a de s.v','Grupo millonario','invii@gmail.com',1,10,'Mexico','Veracruz',NULL,NULL),(6,'Macro','Macri is life','macro@gmail.com',2,18,'Lituania','Belgrado',NULL,NULL),(7,'Totto Ito','Vendemos mochilas','TottoIto@gmail.com',NULL,21,'El Salvador','Usu',NULL,NULL),(8,'Melanie PeÃ±a','Soy el torito del mundo','mel@mel.com',NULL,25,'El Salvador','San Salvador',NULL,NULL),(9,'Maribel de Lopez','agaeg','mariltraducciones@gmail.com',NULL,29,'El Salvador','San Salvador',NULL,NULL),(10,'Pablo Mate','sgsergh','pablo@pablo.com',NULL,30,'El Salvador','San Salvador',NULL,NULL),(11,'Guillermo LÃ³pez','ggerh','gui@gui.com',NULL,31,'El Salvador','San Salvador',NULL,NULL);
/*!40000 ALTER TABLE `inversionista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones` (
  `idnotificaciones` int NOT NULL AUTO_INCREMENT,
  `mensaje` varchar(200) NOT NULL,
  `id_emprendedor` int NOT NULL,
  PRIMARY KEY (`idnotificaciones`),
  KEY `fk_notificaciones_emprendedor1_idx` (`id_emprendedor`),
  CONSTRAINT `fk_notificaciones_emprendedor1` FOREIGN KEY (`id_emprendedor`) REFERENCES `emprendedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `nombre_foto` varchar(300) DEFAULT NULL,
  `foto` longblob,
  `descripcion` varchar(300) NOT NULL,
  `costo_unitario` double NOT NULL,
  `precio_venta` double NOT NULL,
  `patente` tinyint NOT NULL,
  `id_emprendimiento` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productost_emprendimiento1_idx` (`id_emprendimiento`),
  CONSTRAINT `fk_productost_emprendimiento1` FOREIGN KEY (`id_emprendimiento`) REFERENCES `emprendimiento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reaccion`
--

DROP TABLE IF EXISTS `reaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reaccion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `id_producto` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reaccion_productos1_idx` (`id_producto`),
  CONSTRAINT `fk_reaccion_producto1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reaccion`
--

LOCK TABLES `reaccion` WRITE;
/*!40000 ALTER TABLE `reaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `reaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `rol` tinyint NOT NULL COMMENT '"1-admin","2-inversionista", "3-emprendedor"',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'markcubar','12345',2),(2,'lorigreiner','lori90',2),(3,'pupusasmary','pupas123',3),(4,'crown','beautycrown123',3),(5,'admin1','admin123',1),(6,'LorenaG','laLorena',2),(7,'PomaG','roble',2),(8,'PomaG','roble',2),(9,'PomaG','roble',2),(10,'invi','invi12345',2),(11,'LaPao','12345',3),(12,'Chema','chema12345',3),(13,'Chema','chema12345',3),(14,'Chema','chema12345',3),(15,'Chema','chema12345',3),(16,'Glit','123gln',3),(17,'Glit','123gln',3),(18,'macro','macro',2),(19,'PomaG','prueba',3),(20,'BonCo','1234578',3),(21,'TottoIto','12345',2),(22,'JuanGa','12345',3),(23,'FedeLorca','1234578',3),(24,'Los1D','164970',3),(25,'ToritoMel','12345',2),(26,'chejitoGuapo123','12345',3),(27,'GreMaria','12345',3),(28,'gabuxi','1234',3),(29,'mariLopez','12345',2),(30,'pabloMate','12345',2),(31,'guille','12345',2),(32,'chivobeard','12345',3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-03 12:41:54
