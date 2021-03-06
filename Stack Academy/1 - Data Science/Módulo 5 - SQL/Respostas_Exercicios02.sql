-- EXERCICIOS 02

-- 1. CONTA A QUANTIDADE DE PEDIDOS E AGRUPE POR CIDADE (UTILIZE AS TABELAS ORDERS E CUSTOMERS)

SELECT CLIENTE.CUSTOMER_CITY,
	   SUM(ORDER_ID),
FROM   ORDERS PEDIDO INNER JOIN CUSTOMERS CLIENTE
ON PEDIDO.CUSTOMER_ID = CLIENTE.CUSTOMER_ID
GROUP BY CLIENTE.CUSTOMER_CITY

-- 2. SELECTIONE O ID DO PEDIDO, O STATUS, O ID DO CLIENTE, A CIDADE DO CLIENTE E O ESTADO MESMO QUE ESTE NÃO ESTEJA PRESENTE NA TABELA CUSTOMER

SELECT ORDER_ID
	  ,PEDIDO.ORDER_STATUS
	  ,CLIENTE.CUSTOMER_ID
	  ,CLIENTE.CUSTOMER_CITY
	  ,CLIENTE.CUSTOMER_STATE
FROM ORDERS PEDIDO LEFT JOIN CUSTOMERS CLIENTE
ON PEDIDO.CUSTOMER_ID = CLIENTE.CUSTOMER_ID

-- 3. SELECIONE O ID DO PEDIDO, A QUANTIDADE DE FOTOS, O PREÇO, O TIPO DE PAGAMENTO E O VALOR DE PAGAMENTO DOS PRODUTOS QUE TEM MAIS DE 3 FOTOS
-- UTILIZE AS TABELAS: PEDIDOS, PAGAMENTOS E ITENS

SELECT PEDIDOS.ORDER_ID AS ID_PEDIDO
	  ,PRODUTOS.PRODUCT_PHOTOS_QTY AS QTD_FOTOS_PRODUTO
	  ,ITENS.PRICE AS PRECO
	  ,PAGAMENTOS.PAYMENT_TYPE AS TIPOP_PAGAMENTO
	  ,PAGAMENTOS.PAYMENT_VALUE AS VALOR_PAGAMENTO
FROM ORDER_ITEMS ITENS INNER JOIN PRODUCTS PRODUTOS
ON ITENS.PRODUCT_ID = PRODUTOS.PRODUCT_ID

INNER JOIN ORDERS PEDIDOS
ON PEDIDOS.ORDER_ID = ITENS.ORDER_ID

WHERE PRODUTOS.PRODUCT_PHOTOS_QTY > 3
	