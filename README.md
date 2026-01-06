# Estudo de Caso — Projeto de Dados

## 1. Introdução ao Problema

A empresa precisava responder a perguntas estratégicas de diferentes áreas:

* **CFO**: Qual a receita média e total separada por tipo de loja (Food x Good)?
* **CFO**: Qual a receita média e total por estado?
* **Marketing**: Quais os 20 entregadores que mais percorreram distância total para bonificação?
* **Pricing**: Qual a distribuição da distância média percorrida pelos motoboys por estado?
  
Essas questões exigiram organização e tratamento rigoroso dos dados, garantindo análises consistentes, confiáveis e de fácil interpretação pela diretoria. Os insights foram apresentados por meio de gráficos claros e recomendações estratégicas, facilitando a tomada de decisão e estão na pasta **/Insights**.

---

## 2. Subida dos Dados

Os dados foram disponibilizados inicialmente em arquivos brutos.
Eles foram **subidos para o banco de dados via Python**, garantindo que cada tabela ficasse disponível de forma padronizada, permitindo as etapas seguintes da arquitetura de dados.

Tabelas e suas relações:
<img width="1489" height="716" alt="Modelo_Banco" src="https://github.com/user-attachments/assets/ce3b3030-dacf-435f-b359-d51eb01b0402" />

---

## 3. Arquitetura Medalhão

Foi utilizada a arquitetura **Medalhão (Bronze → Silver → Golden)**, que organiza os dados em camadas:

* **Bronze**: Tabelas brutas, representando a extração inicial dos dados (dim_drivers, dim_hubs, dim_stores, fat_orders, fat_deliveries, fat_payments).
* **Silver**: Tabelas refinadas, com normalizações, limpeza de colunas e junções básicas para enriquecer os dados (ex: silver_orders, silver_deliveries, silver_lojas, silver_payments).
* **Golden**: Camada final, onde são criadas tabelas e visões diretamente relacionadas às perguntas de negócio, como:

  * Receita média e total por segmento de loja.
  * Receita média e total por estado.
  * Ranking dos 20 entregadores com maior distância percorrida.
  * Distância média percorrida por motoboys em cada estado.

Essa arquitetura garantiu clareza, escalabilidade e facilidade de manutenção.

<img width="1024" height="1024" alt="Arquitetura_Medalhao" src="https://github.com/user-attachments/assets/d161be8e-9ca8-4498-8235-a89da18be123" />

---

## 4. Criação do Dashboard (Power BI)

Um dashboard foi desenvolvido no **Power BI**, com o objetivo principal de **acompanhar os dados das perguntas feitas pelos executivos e times da empresa**.

O dashboard foi dividido em **páginas temáticas**:

* **Página CFO**: Receita média e total por segmento e por estado.
* **Página Marketing**: Ranking dos 20 entregadores com maior distância percorrida.
* **Página Pricing**: Distribuição da distância média percorrida por motoboys em cada estado.

Essa estrutura facilitou a navegação e permitiu que cada área tivesse uma visão clara de suas métricas-chave.

O link para o Dashboard: [Link Dashboard](https://app.powerbi.com/view?r=eyJrIjoiNmQzMzUzZDctYzNkNC00YTg1LWFmNzItZmY1MmVjZGM3YjJkIiwidCI6IjlkYmYzMjZlLTIxODUtNGM3OC1iY2NhLTBmNTdmOTc4ZjNkYSJ9)
<img width="1158" height="647" alt="Dashboard_Delivery" src="https://github.com/user-attachments/assets/96d9c1b1-7578-4889-be38-481c6c19d21c" />

---

## 5. Resumo Executivo do Case

Este case analisou dados operacionais e financeiros para apoiar decisões estratégicas nas frentes de **Marketing, Pricing e CFO**, com foco em **eficiência operacional e crescimento sustentável**.

### 📊 Principais Resultados

* **Tipo de loja**: o segmento **Food** concentra a **maior receita total**, porém com **ticket médio mais baixo**, indicando oportunidade de aumento do valor por pedido. Já o segmento **Good** apresenta **ticket médio elevado**, mas **menor receita total**, sugerindo foco em **expansão da base de clientes**.
* **Regiões / Estados**: **SP e RJ** lideram em receita e ticket médio, sendo mercados prioritários. **RS e PR** possuem menor participação, mas apresentam potencial de crescimento com estratégias regionais e incentivos.
* **Logística e Pricing**: diferenças relevantes na **distância média percorrida por estado** indicam a necessidade de **precificação regionalizada**, alinhando custos operacionais à rentabilidade.
* **Marketing Operacional**: a identificação dos entregadores com maior distância percorrida embasou **ações de bonificação e retenção**, contribuindo para maior eficiência e sustentabilidade da operação.

O projeto evidencia como a **organização, tratamento e visualização dos dados em dashboards** permitem transformar análises em **decisões de negócio claras e acionáveis**. Para todos os inisights, gráficos e recomendações vá na pasta de **/insights**.


---


## 6. Importância do Projeto

Este projeto demonstrou:

* A relevância de organizar dados em uma arquitetura estruturada (Medalhão) para garantir qualidade e rastreabilidade.
* Como os dados podem ser transformados em **insights acionáveis**, auxiliando decisões estratégicas de diferentes áreas.
* A utilidade de dashboards interativos para **democratizar o acesso às informações**, permitindo que executivos e gestores explorem os indicadores de forma dinâmica.

Em resumo, a iniciativa fortaleceu a cultura de dados da empresa, mostrou o impacto direto da análise de dados no negócio e criou bases sólidas para futuras análises.
