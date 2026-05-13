INSERT INTO [dbo].[FactInternetSales]
SELECT TOP 1 
    [ProductKey], 
    20140513 as [OrderDateKey], 
    20140520 as [DueDateKey],   
    20140520 as [ShipDateKey],   
    [CustomerKey], [PromotionKey], [CurrencyKey], [SalesTerritoryKey], 
    'SO99999' as [SalesOrderNumber], 
    [SalesOrderLineNumber], [RevisionNumber], [OrderQuantity], [UnitPrice], 
    [ExtendedAmount], [UnitPriceDiscountPct], [DiscountAmount], [ProductStandardCost], 
    [TotalProductCost], [SalesAmount], [TaxAmt], [Freight], 
    [CarrierTrackingNumber], [CustomerPONumber], 
    '2014-05-13' as [OrderDate], 
    '2014-05-20' as [DueDate], 
    '2014-05-20' as [ShipDate]
FROM [dbo].[FactInternetSales];