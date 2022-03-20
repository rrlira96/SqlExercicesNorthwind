--Retorne os nomes dos produtos que começam com as letras a, d, de m a z, ordenados por nome.
SELECT ProductName
FROM Products
WHERE 
ProductName LIKE 'a%' OR
ProductName LIKE 'd%' OR
ProductName LIKE '[m-z]%'
GO

--Retorne os nomes dos fornecedores que estão sem homepage informada na tabela.
SELECT CompanyName
FROM Suppliers
WHERE HomePage IS NULL
GO

--Mostre a lista de países dos clientes da empresa (tabela Customers), sem repetições
SELECT DISTINCT Country
FROM Customers
GO

--Mostre os nomes dos clientes que não fizeram pedidos.
SELECT C.CompanyName
FROM Customers C
WHERE NOT EXISTS (SELECT * 
				  FROM Orders
				  WHERE C.CustomerID = Orders.CustomerID)
GO

--Listar sem repetições os nomes de empregados que fizeram pedidos no mês de Janeiro/1997
SELECT DISTINCT E.FirstName
FROM Employees E JOIN Orders O
ON E.EmployeeID = O.EmployeeID
WHERE convert(nvarchar(50), O.OrderDate, 126) 
LIKE '1997-01-%'
GO

--Listar os nomes das empresas clientes atendidas por Nancy Davolio, sem repetições
SELECT DISTINCT C.CompanyName
FROM Customers C 
JOIN Orders O 
ON C.CustomerID = O.CustomerID
JOIN Employees E
ON O.EmployeeID = E.EmployeeID
WHERE E.FirstName = 'Nancy'
GO

--Mostrar os nomes e telefones de clientes e empregados.
SELECT C.CompanyName, C.Phone
FROM Customers C 
UNION
SELECT EmployeeName = (E.FirstName + ' ' + E.LastName),
		E.HomePhone
FROM Employees E
GO

SELECT *
FROM Orders 
GO

SELECT *
FROM Customers
GO

SELECT *
FROM Employees
GO
