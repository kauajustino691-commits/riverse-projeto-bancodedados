# riverse-projeto-bancodedados
Projetar e implementar um banco de dados relacional (em MySQL 8) estruturado para gerir toda a operação de uma loja online de vestuário sustentável, garantindo integridade, consistência e rastreabilidade das informações.

# 🌿 Riverse Moda Sustentável — Modelagem de Banco de Dados

Projeto Integrador desenvolvido para a criação e implementação de um banco de dados relacional em **MySQL 8** voltado para o e-commerce de vestuário sustentável **Riverse** ("Vista o Amanhã").

---

## 🚀 Sobre o Projeto
O sistema foi concebido para suportar a operação completa de uma plataforma de comércio eletrónico focada em vestuário desportivo e casual de alta performance fabricado com materiais reciclados. A modelagem soluciona desafios operacionais complexos, tais como:

* **Controle Fracionado por SKU:** Gestão individualizada de inventário por variações de tamanho, cor e material (como algodão, linho e garrafas PET recicladas).
* **Preservação Histórica de Preços:** Garantia de que alterações futuras nos preços do catálogo não modifiquem os registos contábeis de compras efetuadas no passado.
* **Rastreabilidade Operacional:** Vínculo direto e auditável entre o cliente, múltiplos endereços, itens do pedido, métodos de pagamento e expedição logística.

---

## 🛠️ Tecnologias Utilizadas
* **SGBD:** MySQL 8 (com suporte a transações ACID, restrições `CHECK`, integridade referencial via `FOREIGN KEY` e tipos de dados precisos como `DECIMAL` e `TIMESTAMP`).
* **Modelagem:** Estruturado na 3ª Forma Normal (3FN), contemplando Modelo Conceitual (DER) e Modelo Lógico (Esquema Relacional).

---

## 📂 Estrutura do Repositório
* `/docs`: Documentação técnica completa e apresentação profissional em formato PDF.
* `/sql`: Scripts DDL (criação de tabelas e restrições), DML (povoamento inicial com dados de teste) e DQL (consultas de validação e relatórios gerenciais).

---

## 👥 Integrantes do Grupo (Projeto Integrador)
* **Eduardo de Mattos Borges** — RGM: `04950253-1`
* **Kauã Justino da Silva** — RGM: `50011944`
* **Julia Morales Ferreira** — RGM: `48208043`
* **Davi Guimarães da Silva** — RGM: `48163872`
* **Mateus Moreira** — RGM: `49827189`
* **Jennifer Santos** — RGM: `04981472-9`

---

## 📄 Licença
Este projeto está sob a licença **MIT** — sinta-se livre para utilizar, estudar e adaptar para fins educacionais e profissionais.
