-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Dez-2020 às 19:31
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `kali`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `commands`
--

CREATE TABLE `commands` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `examples` text DEFAULT NULL,
  `tool` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `command` text DEFAULT NULL,
  `example` varchar(150) DEFAULT NULL,
  `sudo` int(1) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `commands`
--

INSERT INTO `commands` (`id`, `name`, `description`, `examples`, `tool`, `type`, `command`, `example`, `sudo`, `category`) VALUES
(1, 'Verificar portas específicas', NULL, 'nmap -p 80,443 8.8.8.8', 1, 'input', '-p', 'Exemplo: 80,443 OU 1-65536', NULL, 'PORT SPECIFICATION AND SCAN ORDER'),
(28, 'Ping Scan - desativar a varredura da porta', NULL, NULL, 1, 'checkbox', '-sL', NULL, NULL, 'HOST DISCOVERY'),
(29, 'Pular descoberta de host', NULL, NULL, 1, 'checkbox', '-Pn', NULL, NULL, 'HOST DISCOVERY'),
(30, 'Rastrear o caminho de salto para cada host', NULL, NULL, 1, 'checkbox', '--traceroute', NULL, NULL, 'HOST DISCOVERY'),
(31, 'Use o resolvedor DNS do sistema operacional', NULL, NULL, 1, 'checkbox', '--system-dns', NULL, NULL, 'HOST DISCOVERY'),
(32, 'Excluir hosts/redes', NULL, NULL, 1, 'input', '--exclude', 'Exemplo: 192.168.0.1', NULL, 'TARGET SPECIFICATION'),
(33, 'Habilitar detecção de sistema operacional', NULL, NULL, 1, 'checkbox', '-O', NULL, NULL, 'OS DETECTION'),
(34, 'Varredura de protocolo IP', NULL, NULL, 1, 'checkbox', '-sO', NULL, NULL, 'SCAN TECHNIQUES'),
(35, 'Pesquisa de devolução de FTP', NULL, NULL, 1, 'checkbox', '-b', NULL, NULL, 'SCAN TECHNIQUES'),
(36, 'Excluir as portas especificadas da pesquisa', NULL, NULL, 1, 'input', '--exclude-ports', 'Exemplo: 80,443 OU 1-65536', NULL, 'PORT SPECIFICATION AND SCAN ORDER'),
(37, 'Faça a varredura das 100 portas mais comuns', NULL, NULL, 1, 'checkbox', '-F', NULL, NULL, 'PORT SPECIFICATION AND SCAN ORDER'),
(40, 'Detecção de serviço (Padrão)', NULL, NULL, 1, 'checkbox', '-sV', NULL, NULL, 'SERVICE/VERSION DETECTION'),
(42, 'Detecção de SO, versão, verificação de script e traceroute', NULL, NULL, 1, 'checkbox', '-A', NULL, NULL, 'MISC'),
(43, 'Número da versão impressa', NULL, NULL, 1, 'show', '-V', NULL, NULL, 'MISC'),
(44, 'Imprima esta página de resumo da ajuda', NULL, NULL, 1, 'show', '-h', NULL, NULL, 'MISC'),
(45, 'Ativar varredura IPv6', NULL, NULL, 1, 'checkbox', '-6', NULL, NULL, 'MISC'),
(47, 'UDP Scan', NULL, NULL, 1, 'checkbox', '-sU', NULL, NULL, 'SCAN TECHNIQUES'),
(48, 'Verificar vulnerabilidades', NULL, NULL, 1, 'checkbox', '-sS -sC -Pn --script vuln', 'nmap -sS -sC -Pn --script vuln scanme.nmap.org ', NULL, NULL),
(49, 'Verificar exploits', NULL, NULL, 1, 'checkbox', '-Pn -sS -sC --script exploit', 'nmap -Pn -sS -sC --script exploit scanme.nmap.org  ', NULL, NULL),
(50, 'Faça a varredura para testar a vulnerabilidade de ataque DoS', NULL, NULL, 1, 'checkbox', '-Pn -sS -sC --script dos', 'nmap -Pn -sS -sC --script dos scanme.nmap.org ', NULL, NULL),
(52, 'Execute ataques DoS com um simulador', NULL, NULL, 1, 'checkbox', '--max-parallelism 750 -Pn --script http-slowloris --script-args http-slowloris.runforever=true', 'nmap --max-parallelism 750 -Pn --script http-slowloris --script-args http-slowloris.runforever=true scanme.nmap.org', NULL, NULL),
(53, 'Encontre subdomínios', NULL, NULL, 1, 'checkbox', '-p 80 --script dns-brute.nse', 'nmap -p 80 --script dns-brute.nse vulnweb.com', NULL, NULL),
(54, 'Verificar todas as 65535 portas', NULL, NULL, 1, 'checkbox', '-p-', NULL, NULL, NULL),
(55, 'Digitalize usando conexão TCP', NULL, NULL, 1, 'checkbox', '-sT', NULL, NULL, 'SCAN TECHNIQUES'),
(56, 'Verificar portas UDP', NULL, NULL, 1, 'checkbox', '-sU -p 123,161,162', NULL, NULL, NULL),
(57, 'Detecção de serviço (Agressivo)', NULL, NULL, 1, 'checkbox', '--version-intensity 5', NULL, NULL, 'SERVICE/VERSION DETECTION'),
(58, 'Detecção de serviço (Mais leve)', NULL, NULL, 1, 'checkbox', '-sV --version-intensity 0', NULL, NULL, 'SERVICE/VERSION DETECTION'),
(59, 'Verificar usando scripts de segurança padrão', NULL, NULL, 1, 'checkbox', '-sV -sC', NULL, NULL, NULL),
(60, 'Verificar refletores UDP DDOS', NULL, NULL, 1, 'checkbox', '–sU –A –PN –n –pU:19,53,123,161 –script=ntp-monlist,dns-recursion,snmp-sysdescr', NULL, NULL, NULL),
(61, 'Reúna títulos de página de serviços HTTP', NULL, NULL, 1, 'checkbox', '--script=http-title', NULL, NULL, 'HTTP Service Information'),
(62, 'Obtenha cabeçalhos HTTP de serviços da web', NULL, NULL, 1, 'checkbox', '--script=http-headers', NULL, NULL, 'HTTP Service Information'),
(63, 'Encontre aplicativos da web em caminhos conhecidos', NULL, NULL, 1, 'checkbox', '--script=http-enum', NULL, NULL, NULL),
(64, 'Mostrar apenas portas abertas (ou possivelmente abertas)', NULL, NULL, 1, 'checkbox', '--open', NULL, NULL, NULL),
(65, 'Mostrar interfaces de host e rotas', NULL, NULL, 1, 'checkbox', '--iflist', NULL, NULL, NULL),
(66, 'Varredura usando ping de protocolo IP', NULL, NULL, 1, 'checkbox', '-PO', NULL, NULL, NULL),
(67, 'Varredura usando UDP ping', NULL, NULL, 1, 'checkbox', '-PU', NULL, NULL, NULL),
(68, 'Verificação TCP Fin para verificar firewall', NULL, NULL, 1, 'checkbox', '-sF', NULL, NULL, 'Scan a firewall for security weakness'),
(69, 'Verificação de TCP Xmas para verificar firewall', NULL, NULL, 1, 'checkbox', '-sX', NULL, NULL, 'Scan a firewall for security weakness'),
(70, 'TCP Null Scan para enganar um firewall para gerar uma resposta', NULL, NULL, 1, 'checkbox', '-sN', NULL, NULL, 'Scan a firewall for security weakness'),
(71, 'Executar uma expansão DNS TLD', NULL, NULL, 3, 'checkbox', '-t', NULL, NULL, NULL),
(72, 'Executar Brute Force de DNS', NULL, NULL, 3, 'checkbox', '-c', NULL, NULL, NULL),
(73, 'Execute uma consulta reversa de DNS', NULL, NULL, 3, 'checkbox', '-n', NULL, NULL, NULL),
(74, 'Use este servidor DNS', NULL, NULL, 3, 'input', '-e', 'Definir um servidor DNS...', NULL, NULL),
(75, 'Limite o número de resultados com os quais trabalhar', NULL, NULL, 3, 'input', '-l', 'Google vai de 100 a 100...', NULL, NULL),
(76, 'Comece no resultado número', NULL, NULL, 3, 'input', '-s', 'Padrão 0', NULL, NULL),
(77, 'Fonte de dados', NULL, NULL, 3, 'input', '-b', 'Ex.: google,bing,linkedin', NULL, NULL),
(78, 'Use this source address', NULL, NULL, 8, 'input', '-S', NULL, NULL, NULL),
(79, 'Limit time to wait per try', NULL, NULL, 8, 'input', '-t', NULL, NULL, NULL),
(80, 'Don\'t query IPv6 servers', NULL, NULL, 8, 'checkbox', '-4', NULL, NULL, NULL),
(81, 'Show all details and informations', NULL, NULL, 8, 'checkbox', '-v', NULL, NULL, NULL),
(82, 'Retry limit', NULL, NULL, 8, 'input', '-r', 'Ex: 1', NULL, NULL),
(83, 'Specific the register type', NULL, NULL, 8, 'input', '-q', 'Ex: A, AAA, MX, NS, TXT', NULL, NULL),
(84, 'Enable overview of received answers', NULL, NULL, 8, 'checkbox', '-o', NULL, NULL, NULL),
(85, 'Enable negative cache', NULL, NULL, 8, 'checkbox', '-C', NULL, NULL, NULL),
(86, 'Disable local caching', NULL, NULL, 8, 'checkbox', '-c', NULL, NULL, NULL),
(87, 'Verifique o nome do host e pesquise por hosts virtuais', NULL, NULL, 3, 'checkbox', '-v', NULL, NULL, NULL),
(88, 'Search', NULL, NULL, 15, 'input', 'search', 'To use this, clean target\'s field.', NULL, NULL),
(90, 'Search emails with the local-part', NULL, NULL, 15, 'checkbox', '--local-part', NULL, NULL, NULL),
(91, 'Search emails with the password', NULL, NULL, 15, 'checkbox', '--password', NULL, NULL, NULL),
(92, 'Search emails with the domain', NULL, NULL, 15, 'checkbox', '--domain', NULL, NULL, NULL),
(93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `tools` varchar(100) DEFAULT NULL,
  `command` varchar(500) DEFAULT NULL,
  `output` text DEFAULT NULL,
  `solution` text DEFAULT NULL,
  `dataHour` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tools`
--

CREATE TABLE `tools` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `fullname` varchar(150) DEFAULT NULL,
  `categories` varchar(300) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `site` varchar(100) DEFAULT NULL,
  `github` varchar(500) DEFAULT NULL,
  `released` tinytext DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `cmd` varchar(100) DEFAULT NULL,
  `target` varchar(10) DEFAULT NULL,
  `resume` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `category2` varchar(100) DEFAULT NULL,
  `solution` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tools`
--

INSERT INTO `tools` (`id`, `name`, `fullname`, `categories`, `description`, `site`, `github`, `released`, `avatar`, `cmd`, `target`, `resume`, `category`, `category2`, `solution`) VALUES
(1, 'Nmap', 'Nmap: the Network Mapper', 'information-gathering vulnerability -analysis', 'https://tools.kali.org/information-gathering/nmap', 'https://insecure.org/', NULL, 'Yes', 'assets/img/nmap.jpg', 'nmap', NULL, 'Nmap (“Network Mapper”) é um utilitário gratuito e de código aberto (licença) para descoberta de rede e auditoria de segurança. Muitos sistemas e administradores de rede também o consideram útil para tarefas como inventário de rede, gerenciamento de agendas de atualização de serviço e monitoramento de host ou tempo de atividade de serviço.', 'Coleta de informações', 'Análise de Vulnerabilidade', NULL),
(3, 'theHarvester', 'theHarvester', 'information-gathering ', 'https://tools.kali.org/information-gathering/theharvester', NULL, 'https://github.com/laramies/theHarvester', 'Yes', NULL, 'theHarvester', '-d', 'O objetivo deste programa é coletar e-mails, subdomínios, hosts, nomes de funcionários, portas abertas e banners de diferentes fontes públicas como motores de busca, servidores de chave PGP e banco de dados de computador SHODAN.', 'Coleta de informações', NULL, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `commands`
--
ALTER TABLE `commands`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `commands`
--
ALTER TABLE `commands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT de tabela `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de tabela `tools`
--
ALTER TABLE `tools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
