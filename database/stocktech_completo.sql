-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: stocktech
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `stocktech`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `stocktech` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `stocktech`;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Processadores','Processadores para computadores'),(2,'Placas de vídeo','Placas de vídeo dedicadas'),(3,'Memórias RAM','Memórias para computadores'),(4,'Armazenamento','SSDs e HDs'),(5,'Placas-mãe','Placas principais'),(6,'Fontes','Fontes de alimentação'),(7,'Periféricos','Teclados e mouses'),(8,'Monitores','Monitores para computadores'),(9,'Gabinetes','Gabinetes para computadores'),(10,'Refrigeração','Coolers e sistemas de refrigeração');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cpf_cnpj` (`cpf_cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'João Silva','111.111.111-11','(98) 99999-1111','joao@email.com'),(2,'Maria Oliveira','222.222.222-22','(98) 99999-2222','maria@email.com'),(3,'Pedro Santos','333.333.333-33','(98) 99999-3333','pedro@email.com'),(4,'Ana Costa','444.444.444-44','(98) 99999-4444','ana@email.com'),(5,'Lucas Ferreira','555.555.555-55','(98) 99999-5555','lucas@email.com'),(6,'Carla Souza','666.666.666-66','(98) 99999-6666','carla@email.com'),(7,'Rafael Lima','777.777.777-77','(98) 99999-7777','rafael@email.com'),(8,'Fernanda Alves','888.888.888-88','(98) 99999-8888','fernanda@email.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_fornecedor` int NOT NULL,
  `id_funcionario` int NOT NULL,
  `data_compra` datetime DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(10,2) DEFAULT '0.00',
  `status` enum('PENDENTE','RECEBIDA','CANCELADA') COLLATE utf8mb4_unicode_ci DEFAULT 'PENDENTE',
  PRIMARY KEY (`id_compra`),
  KEY `fk_compra_fornecedor` (`id_fornecedor`),
  KEY `fk_compra_funcionario` (`id_funcionario`),
  KEY `idx_compra_data` (`data_compra`),
  CONSTRAINT `fk_compra_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`),
  CONSTRAINT `fk_compra_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`),
  CONSTRAINT `compra_chk_1` CHECK ((`valor_total` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,3,'2026-01-10 09:00:00',4500.00,'RECEBIDA'),(2,2,3,'2026-01-15 10:30:00',3200.00,'RECEBIDA'),(3,3,5,'2026-02-05 14:00:00',2800.00,'RECEBIDA'),(4,4,3,'2026-02-20 11:00:00',1500.00,'RECEBIDA'),(5,5,5,'2026-03-10 15:00:00',2100.00,'PENDENTE'),(6,1,3,'2026-11-22 15:27:41',6500.00,'PENDENTE');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id_estoque` int NOT NULL AUTO_INCREMENT,
  `id_produto` int NOT NULL,
  `quantidade_atual` int NOT NULL DEFAULT '0',
  `data_atualizacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_estoque`),
  UNIQUE KEY `id_produto` (`id_produto`),
  CONSTRAINT `fk_estoque_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `estoque_chk_1` CHECK ((`quantidade_atual` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,1,15,'2026-11-19 19:52:53'),(2,2,12,'2026-11-19 19:52:53'),(3,3,8,'2026-11-19 19:52:53'),(4,4,10,'2026-11-19 19:52:53'),(5,5,30,'2026-11-19 19:52:53'),(6,6,25,'2026-11-19 19:52:53'),(7,7,20,'2026-11-19 19:52:53'),(8,8,15,'2026-11-19 19:52:53'),(9,9,10,'2026-11-19 19:52:53'),(10,10,12,'2026-11-19 19:52:53'),(11,11,18,'2026-11-19 19:52:53'),(12,12,14,'2026-11-19 19:52:53'),(13,13,25,'2026-11-19 19:52:53'),(14,14,35,'2026-11-19 19:52:53'),(15,15,10,'2026-11-19 19:52:53'),(16,16,8,'2026-11-19 19:52:53'),(17,17,15,'2026-11-19 19:52:53'),(18,18,12,'2026-11-19 19:52:53'),(19,19,20,'2026-11-19 19:52:53'),(20,20,7,'2026-11-19 19:52:53');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Tech Distribuidora LTDA','12.345.678/0001-90','(11) 3333-1111','contato@techdist.com.br'),(2,'Global Hardware LTDA','23.456.789/0001-01','(11) 3333-2222','vendas@globalhardware.com.br'),(3,'InfoParts Brasil','34.567.890/0001-12','(21) 3333-3333','contato@infoparts.com.br'),(4,'Mega Componentes LTDA','45.678.901/0001-23','(31) 3333-4444','vendas@megacomponentes.com.br'),(5,'Digital Supply LTDA','56.789.012/0001-34','(41) 3333-5555','contato@digitalsupply.com.br');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` enum('ADMINISTRADOR','VENDEDOR','ESTOQUISTA') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_funcionario`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'Carlos Mendes','111.222.333-44','carlos@stocktech.com','ADMINISTRADOR',1),(2,'Mariana Rocha','222.333.444-55','mariana@stocktech.com','VENDEDOR',1),(3,'Roberto Alves','333.444.555-66','roberto@stocktech.com','ESTOQUISTA',1),(4,'Juliana Martins','444.555.666-77','juliana@stocktech.com','VENDEDOR',1),(5,'Felipe Costa','555.666.777-88','felipe@stocktech.com','ESTOQUISTA',1);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_preco_produto`
--

DROP TABLE IF EXISTS `historico_preco_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_preco_produto` (
  `id_historico` int NOT NULL AUTO_INCREMENT,
  `id_produto` int NOT NULL,
  `preco_custo_anterior` decimal(10,2) NOT NULL,
  `preco_custo_novo` decimal(10,2) NOT NULL,
  `preco_venda_anterior` decimal(10,2) NOT NULL,
  `preco_venda_novo` decimal(10,2) NOT NULL,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_historico`),
  KEY `fk_historico_produto` (`id_produto`),
  CONSTRAINT `fk_historico_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_preco_produto`
--

LOCK TABLES `historico_preco_produto` WRITE;
/*!40000 ALTER TABLE `historico_preco_produto` DISABLE KEYS */;
INSERT INTO `historico_preco_produto` VALUES (1,1,650.00,650.00,899.90,999.90,'2026-11-22 20:04:41'),(2,3,1400.00,1400.00,1899.90,999.90,'2026-11-22 20:16:51'),(3,2,550.00,550.00,799.90,999.00,'2026-11-24 22:39:59');
/*!40000 ALTER TABLE `historico_preco_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_compra`
--

DROP TABLE IF EXISTS `item_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_compra` (
  `id_item_compra` int NOT NULL AUTO_INCREMENT,
  `id_compra` int NOT NULL,
  `id_produto` int NOT NULL,
  `quantidade` int NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_item_compra`),
  UNIQUE KEY `id_compra` (`id_compra`,`id_produto`),
  KEY `fk_item_compra_produto` (`id_produto`),
  CONSTRAINT `fk_item_compra_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  CONSTRAINT `fk_item_compra_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `item_compra_chk_1` CHECK ((`quantidade` > 0)),
  CONSTRAINT `item_compra_chk_2` CHECK ((`valor_unitario` >= 0)),
  CONSTRAINT `item_compra_chk_3` CHECK ((`subtotal` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_compra`
--

LOCK TABLES `item_compra` WRITE;
/*!40000 ALTER TABLE `item_compra` DISABLE KEYS */;
INSERT INTO `item_compra` VALUES (1,1,1,5,650.00,3250.00),(2,1,5,10,90.00,900.00),(3,1,7,2,175.00,350.00),(4,2,3,2,1400.00,2800.00),(5,2,14,5,60.00,300.00),(6,2,13,1,100.00,100.00),(7,3,8,5,300.00,1500.00),(8,3,6,5,160.00,800.00),(9,3,11,2,250.00,500.00),(10,4,15,1,650.00,650.00),(11,4,17,3,180.00,540.00),(12,4,19,6,50.00,300.00),(13,5,2,2,550.00,1100.00),(14,5,9,2,500.00,1000.00),(15,6,1,10,650.00,6500.00);
/*!40000 ALTER TABLE `item_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_venda`
--

DROP TABLE IF EXISTS `item_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_venda` (
  `id_item_venda` int NOT NULL AUTO_INCREMENT,
  `id_venda` int NOT NULL,
  `id_produto` int NOT NULL,
  `quantidade` int NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_item_venda`),
  UNIQUE KEY `id_venda` (`id_venda`,`id_produto`),
  KEY `fk_item_venda_produto` (`id_produto`),
  CONSTRAINT `fk_item_venda_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `fk_item_venda_venda` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`),
  CONSTRAINT `item_venda_chk_1` CHECK ((`quantidade` > 0)),
  CONSTRAINT `item_venda_chk_2` CHECK ((`valor_unitario` >= 0)),
  CONSTRAINT `item_venda_chk_3` CHECK ((`subtotal` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda`
--

LOCK TABLES `item_venda` WRITE;
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
INSERT INTO `item_venda` VALUES (1,1,1,1,899.90,899.90),(2,2,5,1,149.90,149.90),(3,2,7,1,229.90,229.90),(4,3,3,1,1899.90,1899.90),(5,4,13,1,199.90,199.90),(6,4,14,4,99.90,399.60),(7,5,16,1,1199.90,1199.90),(8,6,20,1,399.90,399.90),(9,7,4,1,1499.90,1499.90);
/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_validar_estoque_venda` BEFORE INSERT ON `item_venda` FOR EACH ROW BEGIN
    DECLARE v_estoque INT;

    IF NEW.quantidade <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A quantidade deve ser maior que zero';
    END IF;

    SELECT quantidade_atual
    INTO v_estoque
    FROM estoque
    WHERE id_produto = NEW.id_produto
    FOR UPDATE;

    IF v_estoque < NEW.quantidade THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Estoque insuficiente para inserir o item da venda';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `movimentacao_estoque`
--

DROP TABLE IF EXISTS `movimentacao_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacao_estoque` (
  `id_movimentacao` int NOT NULL AUTO_INCREMENT,
  `id_produto` int NOT NULL,
  `id_funcionario` int NOT NULL,
  `tipo` enum('ENTRADA','SAIDA') COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade` int NOT NULL,
  `data_movimentacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `motivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_movimentacao`),
  KEY `fk_movimentacao_funcionario` (`id_funcionario`),
  KEY `idx_movimentacao_data` (`data_movimentacao`),
  KEY `idx_movimentacao_produto` (`id_produto`),
  CONSTRAINT `fk_movimentacao_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`),
  CONSTRAINT `fk_movimentacao_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `movimentacao_estoque_chk_1` CHECK ((`quantidade` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacao_estoque`
--

LOCK TABLES `movimentacao_estoque` WRITE;
/*!40000 ALTER TABLE `movimentacao_estoque` DISABLE KEYS */;
INSERT INTO `movimentacao_estoque` VALUES (1,1,3,'ENTRADA',5,'2026-01-10 09:30:00','Compra de mercadorias'),(2,5,3,'ENTRADA',10,'2026-01-10 09:35:00','Compra de mercadorias'),(3,3,3,'ENTRADA',2,'2026-01-15 11:00:00','Compra de mercadorias'),(4,8,5,'ENTRADA',5,'2026-02-05 14:30:00','Compra de mercadorias'),(5,15,3,'ENTRADA',1,'2026-02-20 11:30:00','Compra de mercadorias'),(6,1,3,'SAIDA',1,'2026-03-01 10:10:00','Venda de produto'),(7,5,3,'SAIDA',1,'2026-03-02 11:40:00','Venda de produto'),(8,7,3,'SAIDA',1,'2026-03-02 11:40:00','Venda de produto'),(9,3,3,'SAIDA',1,'2026-03-05 14:10:00','Venda de produto'),(10,16,3,'SAIDA',1,'2026-03-12 09:40:00','Venda de produto');
/*!40000 ALTER TABLE `movimentacao_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `nome` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_barras` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preco_custo` decimal(10,2) NOT NULL,
  `preco_venda` decimal(10,2) NOT NULL,
  `estoque_minimo` int DEFAULT '5',
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `codigo_barras` (`codigo_barras`),
  KEY `fk_produto_categoria` (`id_categoria`),
  KEY `idx_produto_nome` (`nome`),
  CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `produto_chk_1` CHECK ((`preco_custo` >= 0)),
  CONSTRAINT `produto_chk_2` CHECK ((`preco_venda` >= 0)),
  CONSTRAINT `produto_chk_3` CHECK ((`estoque_minimo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,1,'Intel Core i5 12400F','Processador Intel de 12ª geração','100000000001',650.00,999.90,5,1),(2,1,'AMD Ryzen 5 5600','Processador AMD Ryzen','100000000002',550.00,999.00,5,1),(3,2,'RTX 3060 12GB','Placa de vídeo NVIDIA','100000000003',1400.00,999.90,3,1),(4,2,'RX 6600 8GB','Placa de vídeo AMD','100000000004',1100.00,1499.90,3,1),(5,3,'Memória RAM DDR4 8GB','Memória 3200MHz','100000000005',90.00,149.90,10,1),(6,3,'Memória RAM DDR4 16GB','Memória 3200MHz','100000000006',160.00,249.90,10,1),(7,4,'SSD 480GB','SSD SATA','100000000007',150.00,229.90,5,1),(8,4,'SSD NVMe 1TB','SSD M.2 NVMe','100000000008',300.00,449.90,5,1),(9,5,'Placa-mãe B550','Placa-mãe AMD AM4','100000000009',500.00,699.90,3,1),(10,5,'Placa-mãe H610','Placa-mãe Intel LGA1700','100000000010',400.00,579.90,3,1),(11,6,'Fonte 500W','Fonte de alimentação 80 Plus','100000000011',220.00,329.90,5,1),(12,6,'Fonte 650W','Fonte de alimentação 80 Plus Bronze','100000000012',300.00,449.90,5,1),(13,7,'Teclado Mecânico','Teclado mecânico RGB','100000000013',120.00,199.90,5,1),(14,7,'Mouse Gamer','Mouse gamer RGB','100000000014',60.00,99.90,5,1),(15,8,'Monitor 24 polegadas','Monitor Full HD','100000000015',650.00,899.90,3,1),(16,8,'Monitor 27 polegadas','Monitor IPS Full HD','100000000016',850.00,1199.90,3,1),(17,9,'Gabinete Gamer','Gabinete com lateral de vidro','100000000017',180.00,299.90,3,1),(18,9,'Gabinete Office','Gabinete compacto','100000000018',100.00,169.90,3,1),(19,10,'Cooler para CPU','Cooler de refrigeração','100000000019',50.00,89.90,5,1),(20,10,'Water Cooler 240mm','Sistema de refrigeração líquida','100000000020',250.00,399.90,3,1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_historico_preco` AFTER UPDATE ON `produto` FOR EACH ROW BEGIN
    IF OLD.preco_custo <> NEW.preco_custo
       OR OLD.preco_venda <> NEW.preco_venda THEN

        INSERT INTO historico_preco_produto (
            id_produto,
            preco_custo_anterior,
            preco_custo_novo,
            preco_venda_anterior,
            preco_venda_novo
        )
        VALUES (
            OLD.id_produto,
            OLD.preco_custo,
            NEW.preco_custo,
            OLD.preco_venda,
            NEW.preco_venda
        );

    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_funcionario` int NOT NULL,
  `data_venda` datetime DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(10,2) DEFAULT '0.00',
  `status` enum('PENDENTE','FINALIZADA','CANCELADA') COLLATE utf8mb4_unicode_ci DEFAULT 'PENDENTE',
  PRIMARY KEY (`id_venda`),
  KEY `fk_venda_cliente` (`id_cliente`),
  KEY `fk_venda_funcionario` (`id_funcionario`),
  KEY `idx_venda_data` (`data_venda`),
  CONSTRAINT `fk_venda_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_venda_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`),
  CONSTRAINT `venda_chk_1` CHECK ((`valor_total` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,1,2,'2026-03-01 10:00:00',899.90,'FINALIZADA'),(2,2,4,'2026-03-02 11:30:00',379.80,'FINALIZADA'),(3,3,2,'2026-03-05 14:00:00',1899.90,'FINALIZADA'),(4,4,4,'2026-03-08 15:30:00',599.50,'FINALIZADA'),(5,5,2,'2026-03-12 09:30:00',1199.90,'FINALIZADA'),(6,6,4,'2026-03-15 16:00:00',399.90,'PENDENTE'),(7,7,2,'2026-03-18 13:00:00',1499.90,'FINALIZADA');
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_compras_detalhadas`
--

DROP TABLE IF EXISTS `vw_compras_detalhadas`;
/*!50001 DROP VIEW IF EXISTS `vw_compras_detalhadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_compras_detalhadas` AS SELECT 
 1 AS `id_compra`,
 1 AS `data_compra`,
 1 AS `fornecedor`,
 1 AS `funcionario`,
 1 AS `produto`,
 1 AS `quantidade`,
 1 AS `valor_unitario`,
 1 AS `subtotal`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_estoque_produtos`
--

DROP TABLE IF EXISTS `vw_estoque_produtos`;
/*!50001 DROP VIEW IF EXISTS `vw_estoque_produtos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_estoque_produtos` AS SELECT 
 1 AS `id_produto`,
 1 AS `produto`,
 1 AS `categoria`,
 1 AS `preco_custo`,
 1 AS `preco_venda`,
 1 AS `estoque_minimo`,
 1 AS `quantidade_atual`,
 1 AS `ativo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_produtos_estoque_baixo`
--

DROP TABLE IF EXISTS `vw_produtos_estoque_baixo`;
/*!50001 DROP VIEW IF EXISTS `vw_produtos_estoque_baixo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_produtos_estoque_baixo` AS SELECT 
 1 AS `id_produto`,
 1 AS `produto`,
 1 AS `categoria`,
 1 AS `quantidade_atual`,
 1 AS `estoque_minimo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_vendas_detalhadas`
--

DROP TABLE IF EXISTS `vw_vendas_detalhadas`;
/*!50001 DROP VIEW IF EXISTS `vw_vendas_detalhadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_vendas_detalhadas` AS SELECT 
 1 AS `id_venda`,
 1 AS `data_venda`,
 1 AS `cliente`,
 1 AS `vendedor`,
 1 AS `produto`,
 1 AS `quantidade`,
 1 AS `valor_unitario`,
 1 AS `subtotal`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'stocktech'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_calcular_lucro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_calcular_lucro`(
    p_preco_custo DECIMAL(10,2),
    p_preco_venda DECIMAL(10,2)
) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    RETURN p_preco_venda - p_preco_custo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_vendido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_vendido`(
    p_id_produto INT
) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE v_total INT;

    SELECT COALESCE(SUM(iv.quantidade), 0)
    INTO v_total
    FROM item_venda iv
    INNER JOIN venda v
        ON iv.id_venda = v.id_venda
    WHERE iv.id_produto = p_id_produto
      AND v.status = 'FINALIZADA';

    RETURN v_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_valor_estoque` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_valor_estoque`(
    p_id_produto INT
) RETURNS decimal(12,2)
    READS SQL DATA
BEGIN
    DECLARE v_valor DECIMAL(12,2);

    SELECT
        p.preco_custo * e.quantidade_atual
    INTO v_valor
    FROM produto p
    INNER JOIN estoque e
        ON p.id_produto = e.id_produto
    WHERE p.id_produto = p_id_produto;

    RETURN COALESCE(v_valor, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_consultar_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_compra`(
    IN p_id_compra INT
)
BEGIN
    SELECT
        c.id_compra,
        f.razao_social AS fornecedor,
        func.nome AS funcionario,
        c.data_compra,
        c.valor_total,
        c.status
    FROM compra c
    INNER JOIN fornecedor f
        ON c.id_fornecedor = f.id_fornecedor
    INNER JOIN funcionario func
        ON c.id_funcionario = func.id_funcionario
    WHERE c.id_compra = p_id_compra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_consultar_estoque` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_estoque`(
    IN p_id_produto INT
)
BEGIN
    SELECT
        p.id_produto,
        p.nome AS produto,
        c.nome AS categoria,
        e.quantidade_atual,
        p.estoque_minimo,
        CASE
            WHEN e.quantidade_atual = 0 THEN 'SEM ESTOQUE'
            WHEN e.quantidade_atual <= p.estoque_minimo THEN 'ESTOQUE BAIXO'
            ELSE 'ESTOQUE NORMAL'
        END AS situacao
    FROM produto p
    INNER JOIN categoria c
        ON p.id_categoria = c.id_categoria
    INNER JOIN estoque e
        ON p.id_produto = e.id_produto
    WHERE p.id_produto = p_id_produto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_itens_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_itens_compra`(
    IN p_id_compra INT
)
BEGIN
    SELECT
        ic.id_item_compra,
        p.nome AS produto,
        ic.quantidade,
        ic.valor_unitario,
        ic.subtotal
    FROM item_compra ic
    INNER JOIN produto p
        ON ic.id_produto = p.id_produto
    WHERE ic.id_compra = p_id_compra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_produtos_mais_vendidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_produtos_mais_vendidos`(
    IN p_limite INT
)
BEGIN
    SELECT
        p.id_produto,
        p.nome AS produto,
        SUM(iv.quantidade) AS quantidade_vendida,
        SUM(iv.subtotal) AS valor_total_vendido
    FROM item_venda iv
    INNER JOIN produto p
        ON iv.id_produto = p.id_produto
    INNER JOIN venda v
        ON iv.id_venda = v.id_venda
    WHERE v.status = 'FINALIZADA'
    GROUP BY
        p.id_produto,
        p.nome
    ORDER BY quantidade_vendida DESC
    LIMIT p_limite;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_compra`(
    IN p_id_fornecedor INT,
    IN p_id_funcionario INT,
    IN p_id_produto INT,
    IN p_quantidade INT,
    IN p_valor_unitario DECIMAL(10,2)
)
BEGIN
    DECLARE v_id_compra INT;
    DECLARE v_subtotal DECIMAL(10,2);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    IF p_quantidade <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A quantidade deve ser maior que zero';
    END IF;

    IF p_valor_unitario < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O valor unitário não pode ser negativo';
    END IF;

    SET v_subtotal = p_quantidade * p_valor_unitario;

    INSERT INTO compra (
        id_fornecedor,
        id_funcionario,
        data_compra,
        valor_total,
        status
    )
    VALUES (
        p_id_fornecedor,
        p_id_funcionario,
        NOW(),
        v_subtotal,
        'PENDENTE'
    );

    SET v_id_compra = LAST_INSERT_ID();

    INSERT INTO item_compra (
        id_compra,
        id_produto,
        quantidade,
        valor_unitario,
        subtotal
    )
    VALUES (
        v_id_compra,
        p_id_produto,
        p_quantidade,
        p_valor_unitario,
        v_subtotal
    );

    COMMIT;

    SELECT
        v_id_compra AS id_compra,
        v_subtotal AS valor_total,
        'PENDENTE' AS status;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `stocktech`
--

USE `stocktech`;

--
-- Final view structure for view `vw_compras_detalhadas`
--

/*!50001 DROP VIEW IF EXISTS `vw_compras_detalhadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_compras_detalhadas` AS select `c`.`id_compra` AS `id_compra`,`c`.`data_compra` AS `data_compra`,`f`.`razao_social` AS `fornecedor`,`func`.`nome` AS `funcionario`,`p`.`nome` AS `produto`,`ic`.`quantidade` AS `quantidade`,`ic`.`valor_unitario` AS `valor_unitario`,`ic`.`subtotal` AS `subtotal`,`c`.`status` AS `status` from ((((`compra` `c` join `fornecedor` `f` on((`c`.`id_fornecedor` = `f`.`id_fornecedor`))) join `funcionario` `func` on((`c`.`id_funcionario` = `func`.`id_funcionario`))) join `item_compra` `ic` on((`c`.`id_compra` = `ic`.`id_compra`))) join `produto` `p` on((`ic`.`id_produto` = `p`.`id_produto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_estoque_produtos`
--

/*!50001 DROP VIEW IF EXISTS `vw_estoque_produtos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_estoque_produtos` AS select `p`.`id_produto` AS `id_produto`,`p`.`nome` AS `produto`,`c`.`nome` AS `categoria`,`p`.`preco_custo` AS `preco_custo`,`p`.`preco_venda` AS `preco_venda`,`p`.`estoque_minimo` AS `estoque_minimo`,`e`.`quantidade_atual` AS `quantidade_atual`,`p`.`ativo` AS `ativo` from ((`produto` `p` join `categoria` `c` on((`p`.`id_categoria` = `c`.`id_categoria`))) join `estoque` `e` on((`p`.`id_produto` = `e`.`id_produto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_produtos_estoque_baixo`
--

/*!50001 DROP VIEW IF EXISTS `vw_produtos_estoque_baixo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_produtos_estoque_baixo` AS select `p`.`id_produto` AS `id_produto`,`p`.`nome` AS `produto`,`c`.`nome` AS `categoria`,`e`.`quantidade_atual` AS `quantidade_atual`,`p`.`estoque_minimo` AS `estoque_minimo` from ((`produto` `p` join `categoria` `c` on((`p`.`id_categoria` = `c`.`id_categoria`))) join `estoque` `e` on((`p`.`id_produto` = `e`.`id_produto`))) where (`e`.`quantidade_atual` <= `p`.`estoque_minimo`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vendas_detalhadas`
--

/*!50001 DROP VIEW IF EXISTS `vw_vendas_detalhadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vendas_detalhadas` AS select `v`.`id_venda` AS `id_venda`,`v`.`data_venda` AS `data_venda`,`cli`.`nome` AS `cliente`,`func`.`nome` AS `vendedor`,`p`.`nome` AS `produto`,`iv`.`quantidade` AS `quantidade`,`iv`.`valor_unitario` AS `valor_unitario`,`iv`.`subtotal` AS `subtotal`,`v`.`status` AS `status` from ((((`venda` `v` left join `cliente` `cli` on((`v`.`id_cliente` = `cli`.`id_cliente`))) join `funcionario` `func` on((`v`.`id_funcionario` = `func`.`id_funcionario`))) join `item_venda` `iv` on((`v`.`id_venda` = `iv`.`id_venda`))) join `produto` `p` on((`iv`.`id_produto` = `p`.`id_produto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-24 23:09:27
