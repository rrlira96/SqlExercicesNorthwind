--Retorne os nomes dos produtos que come�am com as letras a, d, de m a z, ordenados por nome.
SELECT ProductName
FROM Products
WHERE 
ProductName LIKE 'a%' OR
ProductName LIKE 'd%' OR
ProductName LIKE '[m-z]%'
GO

--Retorne os nomes dos fornecedores que est�o sem homepage informada na tabela.
SELECT CompanyName
FROM Suppliers
WHERE HomePage IS NULL
GO

--Mostre a lista de pa�ses dos clientes da empresa (tabela Customers), sem repeti��es
SELECT DISTINCT Country
FROM Customers
GO

--Mostre os nomes dos clientes que n�o fizeram pedidos.
SELECT C.CompanyName
FROM Customers C
WHERE NOT EXISTS (SELECT * 
				  FROM Orders
				  WHERE C.CustomerID = Orders.CustomerID)
GO

--Listar sem repeti��es os nomes de empregados que fizeram pedidos no m�s de Janeiro/1997
SELECT DISTINCT E.FirstName
FROM Employees E JOIN Orders O
ON E.EmployeeID = O.EmployeeID
WHERE convert(nvarchar(50), O.OrderDate, 126) 
LIKE '1997-01-%'
GO

--Listar os nomes das empresas clientes atendidas por Nancy Davolio, sem repeti��es
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
