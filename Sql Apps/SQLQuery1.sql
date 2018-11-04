USE AdventureWorks2014
/* SELECT Objects */ 
SELECT * from Person.Person
/* Where  */
SELECT * FROM Person.Person WHERE FirstName LIKE '[aA]%'
/* LIKE */
SELECT * from HumanResources.Employee WHERE Gender LIKE 'F%'
/* Between */
SELECT * from Person.Address WHERE AddressID BETWEEN 1 and 5
/* In */
SELECT * from Production.Product WHERE ProductID IN(320,321,322)
/* IsNull Op */
SELECT * from Production.Product WHERE Color is NULL
/* Isnull Func */
SELECT ProductID,Name,ProductNumber,MakeFlag,ISNULL(Color,'renk girilmemis') as Color from Production.Product 
/* Coalesce func */
SELECT ProductID,Name,ProductNumber,MakeFlag,COALESCE(Color,'renk girilmemis') as Color from Production.Product 
/* Order By  */
SELECT * from Person.Person ORDER BY FirstName DESC
/* Top */
SELECT top 5 * from Person.Person
/* Aggregate func  */
SELECT 
		COUNT(p.BusinessEntityID) as [Count],
		SUM(p.EmailPromotion) as SumEmailPromotion,
		AVG(p.EmailPromotion) as AvgEmailPromotion
 from Person.Person p
 /* Group by  */
 SELECT   so.ProductID,COUNT(so.ProductID) as Toplam from Sales.SalesOrderDetail so
 group BY so.ProductID 
 order BY Toplam desc
 /* Case-when */
 SELECT JobTitle,BirthDate,MaritalStatus,
	CASE Gender
	WHEN 'M' THEN 'Male'
	WHEN 'F' THEN 'Female'
	ELSE 'No'
	END AS Gender
  from HumanResources.Employee
  /* inner-join */
  SELECT so.SalesOrderID,so.OrderQty,so.ProductID,so.UnitPrice,sh.RevisionNumber,sh.Status from Sales.SalesOrderDetail so
  INNER JOIN Sales.SalesOrderHeader sh 
  ON so.SalesOrderID = sh.SalesOrderID
  /* ############### */
  /* table sample */
  SELECT * from HumanResources.Employee TABLESAMPLE(10) REPEATABLE(10)
  /* Group by cube  */
  SELECT ss.ProductID,COUNT(ss.ProductID) as Toplam from Sales.SalesOrderDetail ss 
  GROUP BY CUBE(ss.ProductID) 
  /* Group by roll up  */
  SELECT sd.ProductID,COUNT(sd.ProductID) from Sales.SalesOrderDetail sd
  group by ROLLUP(sd.ProductID)
  /* Row Number */
  SELECT pp.BusinessEntityID,pp.FirstName,pp.LastName,pp.Title,pp.PersonType,
  ROW_NUMBER() OVER(PARTITION BY pp.PersonType ORDER BY pp.BusinessEntityID) as [Row_Number]
   from Person.Person pp 
  /* Rank */
  SELECT pp.BusinessEntityID,pp.FirstName,pp.LastName,pp.Title,pp.PersonType,
  RANK() OVER(PARTITION BY pp.FirstName ORDER BY pp.PersonType) as [Rank]
   from Person.Person pp 
   /* Dense Rank */
   SELECT pp.BusinessEntityID,pp.FirstName,pp.LastName,pp.Title,pp.PersonType,
  DENSE_RANK() OVER(PARTITION BY pp.FirstName ORDER BY pp.PersonType) as [Dense_RAnk]
   from Person.Person pp 
   /* Ntile */
   SELECT he.BusinessEntityID,he.NationalIDNumber,he.JobTitle 
	,NTILE(5) OVER(PARTITION BY he.LoginID ORDER BY he.JobTitle)
    from HumanResources.Employee  he
	/* ######################################## */
	/* Default Using */
	USE SampleDb2
	CREATE TABLE DenemeTable(
	ID int not null identity(1,1) primary key,
	Name nvarchar(50),
	CreatedDate datetime default(getDate())
	)
	insert into DenemeTable(Name) VALUES('Ertan Akpinaroglu')
	INSERT INTO DenemeTable(Name) OUTPUT INSERTED.Name VALUES('C.E')
	SELECT * from DenemeTable
	/* Identity insert  */
	SET IDENTITY_INSERT DenemeTable ON
	insert INTO DenemeTable(ID,Name) VALUES(3,'All of')
	SET IDENTITY_INSERT DenemeTable OFF
	/* select insert proc */
	CREATE PROCEDURE sp_DenemeTableGet
	AS 
	BEGIN 
	SELECT * from DenemeTable
	END
	
	insert into DenemeTable(Id,Name,CreatedDate) EXECUTE sp_DenemeTableGet
	/* outputs */
	insert into DenemeTable(Name) 
	OUTPUT INSERTED.Name VALUES('Selamlar')

	DELETE from DenemeTable
	OUTPUT DELETED.Name,DELETED.ID
	 WHERE ID = 3