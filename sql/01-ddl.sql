-- Criação e seleção do Banco de Dados para MySQL 8
CREATE DATABASE IF NOT EXISTS riverse_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE riverse_db;

-- 1. Tabela de Clientes
CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabela de Endereços (Rastreabilidade de múltiplos endereços por cliente)
CREATE TABLE endereco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    cep VARCHAR(10) NOT NULL,
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id) ON DELETE CASCADE
);

-- 3. Tabela de Produtos (Base do vestuário sustentável)
CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    material_principal VARCHAR(50) NOT NULL -- Ex: Algodão orgânico, Linho, PET reciclado
);

-- 4. Tabela de Variações / SKU (Controle fracionado por tamanho, cor e preço)
CREATE TABLE sku_produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    codigo_sku VARCHAR(50) UNIQUE NOT NULL,
    tamanho VARCHAR(10) NOT NULL, -- Ex: P, M, G, GG
    cor VARCHAR(30) NOT NULL,
    preco_atual DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL DEFAULT 0,
    FOREIGN KEY (produto_id) REFERENCES produto(id) ON DELETE CASCADE,
    CONSTRAINT chk_estoque_positivo CHECK (estoque >= 0),
    CONSTRAINT chk_preco_positivo CHECK (preco_atual > 0)
);

-- 5. Tabela de Pedidos
CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    endereco_id INT NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_pedido VARCHAR(30) NOT NULL DEFAULT 'Pendente',
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (endereco_id) REFERENCES endereco(id)
);

-- 6. Tabela de Itens do Pedido (Garante a preservação histórica do preço no momento da transação)
CREATE TABLE item_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    sku_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL, 
    FOREIGN KEY (pedido_id) REFERENCES pedido(id) ON DELETE CASCADE,
    FOREIGN KEY (sku_id) REFERENCES sku_produto(id),
    CONSTRAINT chk_qtd_positiva CHECK (quantidade > 0)
);
