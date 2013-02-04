
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 01/28/2013 17:35:15
-- Generated from EDMX file: E:\AntikaMarketim\AntikaMarketim\Models\DataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ProductCategory_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductCategory] DROP CONSTRAINT [FK_ProductCategory_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductCategory_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductCategory] DROP CONSTRAINT [FK_ProductCategory_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderCart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cart] DROP CONSTRAINT [FK_OrderCart];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductTag_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductTag] DROP CONSTRAINT [FK_ProductTag_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductTag_Tag]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductTag] DROP CONSTRAINT [FK_ProductTag_Tag];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderOrderStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderStatus] DROP CONSTRAINT [FK_OrderOrderStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_ShippingDeliveryAddress]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Address_DeliveryAddress] DROP CONSTRAINT [FK_ShippingDeliveryAddress];
GO
IF OBJECT_ID(N'[dbo].[FK_ShippingBillingAddress]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Address_BillingAddress] DROP CONSTRAINT [FK_ShippingBillingAddress];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderShipping]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Shipping] DROP CONSTRAINT [FK_OrderShipping];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderMoneyTransfer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MoneyTransfer] DROP CONSTRAINT [FK_OrderMoneyTransfer];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoryCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Category] DROP CONSTRAINT [FK_CategoryCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductImageFileName]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ImageFileName] DROP CONSTRAINT [FK_ProductImageFileName];
GO
IF OBJECT_ID(N'[dbo].[FK_DeliveryAddress_inherits_Address]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Address_DeliveryAddress] DROP CONSTRAINT [FK_DeliveryAddress_inherits_Address];
GO
IF OBJECT_ID(N'[dbo].[FK_BillingAddress_inherits_Address]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Address_BillingAddress] DROP CONSTRAINT [FK_BillingAddress_inherits_Address];
GO
IF OBJECT_ID(N'[dbo].[FK_Antique_inherits_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product_Antique] DROP CONSTRAINT [FK_Antique_inherits_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_AntiqueCart_inherits_Cart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cart_AntiqueCart] DROP CONSTRAINT [FK_AntiqueCart_inherits_Cart];
GO
IF OBJECT_ID(N'[dbo].[FK_Payment_inherits_MoneyTransfer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MoneyTransfer_Payment] DROP CONSTRAINT [FK_Payment_inherits_MoneyTransfer];
GO
IF OBJECT_ID(N'[dbo].[FK_Chargeback_inherits_MoneyTransfer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MoneyTransfer_Chargeback] DROP CONSTRAINT [FK_Chargeback_inherits_MoneyTransfer];
GO
IF OBJECT_ID(N'[dbo].[FK_WireTransfer_inherits_Payment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MoneyTransfer_WireTransfer] DROP CONSTRAINT [FK_WireTransfer_inherits_Payment];
GO
IF OBJECT_ID(N'[dbo].[FK_MainCategory_inherits_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Category_MainCategory] DROP CONSTRAINT [FK_MainCategory_inherits_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_SubCategory_inherits_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Category_SubCategory] DROP CONSTRAINT [FK_SubCategory_inherits_Category];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product];
GO
IF OBJECT_ID(N'[dbo].[Tag]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tag];
GO
IF OBJECT_ID(N'[dbo].[Category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category];
GO
IF OBJECT_ID(N'[dbo].[Cart]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cart];
GO
IF OBJECT_ID(N'[dbo].[Order]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order];
GO
IF OBJECT_ID(N'[dbo].[ShippingOption]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ShippingOption];
GO
IF OBJECT_ID(N'[dbo].[OrderStatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderStatus];
GO
IF OBJECT_ID(N'[dbo].[Address]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Address];
GO
IF OBJECT_ID(N'[dbo].[MoneyTransfer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MoneyTransfer];
GO
IF OBJECT_ID(N'[dbo].[BankAccount]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BankAccount];
GO
IF OBJECT_ID(N'[dbo].[Shipping]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Shipping];
GO
IF OBJECT_ID(N'[dbo].[ImageFileName]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ImageFileName];
GO
IF OBJECT_ID(N'[dbo].[Address_DeliveryAddress]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Address_DeliveryAddress];
GO
IF OBJECT_ID(N'[dbo].[Address_BillingAddress]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Address_BillingAddress];
GO
IF OBJECT_ID(N'[dbo].[Product_Antique]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product_Antique];
GO
IF OBJECT_ID(N'[dbo].[Cart_AntiqueCart]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cart_AntiqueCart];
GO
IF OBJECT_ID(N'[dbo].[MoneyTransfer_Payment]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MoneyTransfer_Payment];
GO
IF OBJECT_ID(N'[dbo].[MoneyTransfer_Chargeback]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MoneyTransfer_Chargeback];
GO
IF OBJECT_ID(N'[dbo].[MoneyTransfer_WireTransfer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MoneyTransfer_WireTransfer];
GO
IF OBJECT_ID(N'[dbo].[Category_MainCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category_MainCategory];
GO
IF OBJECT_ID(N'[dbo].[Category_SubCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category_SubCategory];
GO
IF OBJECT_ID(N'[dbo].[ProductCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductCategory];
GO
IF OBJECT_ID(N'[dbo].[ProductTag]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductTag];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Product'
CREATE TABLE [dbo].[Product] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ProductCode] nvarchar(max)  NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Availability] smallint  NOT NULL,
    [Favorited] int  NOT NULL
);
GO

-- Creating table 'Tag'
CREATE TABLE [dbo].[Tag] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Text] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Category'
CREATE TABLE [dbo].[Category] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [SuperCategory_Id] int  NULL
);
GO

-- Creating table 'Cart'
CREATE TABLE [dbo].[Cart] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Count] int  NOT NULL,
    [UnitPrice] decimal(18,2)  NOT NULL,
    [Discount] smallint  NOT NULL,
    [UserKey] nvarchar(max)  NOT NULL,
    [ProductId] int  NOT NULL,
    [OrderCompleted] bit  NOT NULL,
    [Order_Id] int  NULL
);
GO

-- Creating table 'Order'
CREATE TABLE [dbo].[Order] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserKey] nvarchar(max)  NOT NULL,
    [Status] smallint  NOT NULL
);
GO

-- Creating table 'ShippingOption'
CREATE TABLE [dbo].[ShippingOption] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [ArtUrl] nvarchar(max)  NOT NULL,
    [Price] decimal(18,2)  NOT NULL
);
GO

-- Creating table 'OrderStatus'
CREATE TABLE [dbo].[OrderStatus] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [State] smallint  NOT NULL,
    [Date] datetime  NOT NULL,
    [Comment] nvarchar(max)  NOT NULL,
    [Order_Id] int  NOT NULL
);
GO

-- Creating table 'Address'
CREATE TABLE [dbo].[Address] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Ad] nvarchar(64)  NOT NULL,
    [Soyad] nvarchar(64)  NOT NULL,
    [Ulke] nvarchar(max)  NOT NULL,
    [Il] nvarchar(max)  NOT NULL,
    [Ilce] nvarchar(max)  NOT NULL,
    [PostaKodu] nvarchar(5)  NOT NULL,
    [TelNo] nvarchar(10)  NOT NULL,
    [KisiType] smallint  NOT NULL,
    [TcKimlikNo] nvarchar(11)  NOT NULL,
    [SerbestAdres] nvarchar(512)  NOT NULL
);
GO

-- Creating table 'MoneyTransfer'
CREATE TABLE [dbo].[MoneyTransfer] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Date] datetime  NOT NULL,
    [Order_Id] int  NOT NULL
);
GO

-- Creating table 'BankAccount'
CREATE TABLE [dbo].[BankAccount] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Label] nvarchar(max)  NOT NULL,
    [AccountNumber] nvarchar(max)  NOT NULL,
    [IBAN] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Shipping'
CREATE TABLE [dbo].[Shipping] (
    [Id] int  NOT NULL,
    [ShippingPrice] decimal(18,2)  NOT NULL,
    [ShippingOptionId] nvarchar(max)  NULL
);
GO

-- Creating table 'ImageFileName'
CREATE TABLE [dbo].[ImageFileName] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FileName] nvarchar(max)  NOT NULL,
    [Product_Id] int  NOT NULL
);
GO

-- Creating table 'Address_DeliveryAddress'
CREATE TABLE [dbo].[Address_DeliveryAddress] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Address_BillingAddress'
CREATE TABLE [dbo].[Address_BillingAddress] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Product_Antique'
CREATE TABLE [dbo].[Product_Antique] (
    [Price] decimal(18,2)  NOT NULL,
    [Discount] smallint  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Cart_AntiqueCart'
CREATE TABLE [dbo].[Cart_AntiqueCart] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'MoneyTransfer_Payment'
CREATE TABLE [dbo].[MoneyTransfer_Payment] (
    [AmountPaid] decimal(18,2)  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'MoneyTransfer_Chargeback'
CREATE TABLE [dbo].[MoneyTransfer_Chargeback] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'MoneyTransfer_WireTransfer'
CREATE TABLE [dbo].[MoneyTransfer_WireTransfer] (
    [AccountId] int  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Category_MainCategory'
CREATE TABLE [dbo].[Category_MainCategory] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Category_SubCategory'
CREATE TABLE [dbo].[Category_SubCategory] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'ProductCategory'
CREATE TABLE [dbo].[ProductCategory] (
    [Products_Id] int  NOT NULL,
    [Categories_Id] int  NOT NULL
);
GO

-- Creating table 'ProductTag'
CREATE TABLE [dbo].[ProductTag] (
    [Products_Id] int  NOT NULL,
    [Tags_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [PK_Product]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Tag'
ALTER TABLE [dbo].[Tag]
ADD CONSTRAINT [PK_Tag]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Category'
ALTER TABLE [dbo].[Category]
ADD CONSTRAINT [PK_Category]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cart'
ALTER TABLE [dbo].[Cart]
ADD CONSTRAINT [PK_Cart]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Order'
ALTER TABLE [dbo].[Order]
ADD CONSTRAINT [PK_Order]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ShippingOption'
ALTER TABLE [dbo].[ShippingOption]
ADD CONSTRAINT [PK_ShippingOption]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderStatus'
ALTER TABLE [dbo].[OrderStatus]
ADD CONSTRAINT [PK_OrderStatus]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Address'
ALTER TABLE [dbo].[Address]
ADD CONSTRAINT [PK_Address]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MoneyTransfer'
ALTER TABLE [dbo].[MoneyTransfer]
ADD CONSTRAINT [PK_MoneyTransfer]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BankAccount'
ALTER TABLE [dbo].[BankAccount]
ADD CONSTRAINT [PK_BankAccount]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Shipping'
ALTER TABLE [dbo].[Shipping]
ADD CONSTRAINT [PK_Shipping]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ImageFileName'
ALTER TABLE [dbo].[ImageFileName]
ADD CONSTRAINT [PK_ImageFileName]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Address_DeliveryAddress'
ALTER TABLE [dbo].[Address_DeliveryAddress]
ADD CONSTRAINT [PK_Address_DeliveryAddress]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Address_BillingAddress'
ALTER TABLE [dbo].[Address_BillingAddress]
ADD CONSTRAINT [PK_Address_BillingAddress]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Product_Antique'
ALTER TABLE [dbo].[Product_Antique]
ADD CONSTRAINT [PK_Product_Antique]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cart_AntiqueCart'
ALTER TABLE [dbo].[Cart_AntiqueCart]
ADD CONSTRAINT [PK_Cart_AntiqueCart]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MoneyTransfer_Payment'
ALTER TABLE [dbo].[MoneyTransfer_Payment]
ADD CONSTRAINT [PK_MoneyTransfer_Payment]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MoneyTransfer_Chargeback'
ALTER TABLE [dbo].[MoneyTransfer_Chargeback]
ADD CONSTRAINT [PK_MoneyTransfer_Chargeback]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MoneyTransfer_WireTransfer'
ALTER TABLE [dbo].[MoneyTransfer_WireTransfer]
ADD CONSTRAINT [PK_MoneyTransfer_WireTransfer]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Category_MainCategory'
ALTER TABLE [dbo].[Category_MainCategory]
ADD CONSTRAINT [PK_Category_MainCategory]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Category_SubCategory'
ALTER TABLE [dbo].[Category_SubCategory]
ADD CONSTRAINT [PK_Category_SubCategory]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Products_Id], [Categories_Id] in table 'ProductCategory'
ALTER TABLE [dbo].[ProductCategory]
ADD CONSTRAINT [PK_ProductCategory]
    PRIMARY KEY NONCLUSTERED ([Products_Id], [Categories_Id] ASC);
GO

-- Creating primary key on [Products_Id], [Tags_Id] in table 'ProductTag'
ALTER TABLE [dbo].[ProductTag]
ADD CONSTRAINT [PK_ProductTag]
    PRIMARY KEY NONCLUSTERED ([Products_Id], [Tags_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Products_Id] in table 'ProductCategory'
ALTER TABLE [dbo].[ProductCategory]
ADD CONSTRAINT [FK_ProductCategory_Product]
    FOREIGN KEY ([Products_Id])
    REFERENCES [dbo].[Product]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Categories_Id] in table 'ProductCategory'
ALTER TABLE [dbo].[ProductCategory]
ADD CONSTRAINT [FK_ProductCategory_Category]
    FOREIGN KEY ([Categories_Id])
    REFERENCES [dbo].[Category]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductCategory_Category'
CREATE INDEX [IX_FK_ProductCategory_Category]
ON [dbo].[ProductCategory]
    ([Categories_Id]);
GO

-- Creating foreign key on [Order_Id] in table 'Cart'
ALTER TABLE [dbo].[Cart]
ADD CONSTRAINT [FK_OrderCart]
    FOREIGN KEY ([Order_Id])
    REFERENCES [dbo].[Order]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderCart'
CREATE INDEX [IX_FK_OrderCart]
ON [dbo].[Cart]
    ([Order_Id]);
GO

-- Creating foreign key on [Products_Id] in table 'ProductTag'
ALTER TABLE [dbo].[ProductTag]
ADD CONSTRAINT [FK_ProductTag_Product]
    FOREIGN KEY ([Products_Id])
    REFERENCES [dbo].[Product]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Tags_Id] in table 'ProductTag'
ALTER TABLE [dbo].[ProductTag]
ADD CONSTRAINT [FK_ProductTag_Tag]
    FOREIGN KEY ([Tags_Id])
    REFERENCES [dbo].[Tag]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductTag_Tag'
CREATE INDEX [IX_FK_ProductTag_Tag]
ON [dbo].[ProductTag]
    ([Tags_Id]);
GO

-- Creating foreign key on [Order_Id] in table 'OrderStatus'
ALTER TABLE [dbo].[OrderStatus]
ADD CONSTRAINT [FK_OrderOrderStatus]
    FOREIGN KEY ([Order_Id])
    REFERENCES [dbo].[Order]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderOrderStatus'
CREATE INDEX [IX_FK_OrderOrderStatus]
ON [dbo].[OrderStatus]
    ([Order_Id]);
GO

-- Creating foreign key on [Id] in table 'Address_DeliveryAddress'
ALTER TABLE [dbo].[Address_DeliveryAddress]
ADD CONSTRAINT [FK_ShippingDeliveryAddress]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Shipping]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Address_BillingAddress'
ALTER TABLE [dbo].[Address_BillingAddress]
ADD CONSTRAINT [FK_ShippingBillingAddress]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Shipping]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Shipping'
ALTER TABLE [dbo].[Shipping]
ADD CONSTRAINT [FK_OrderShipping]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Order]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Order_Id] in table 'MoneyTransfer'
ALTER TABLE [dbo].[MoneyTransfer]
ADD CONSTRAINT [FK_OrderMoneyTransfer]
    FOREIGN KEY ([Order_Id])
    REFERENCES [dbo].[Order]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderMoneyTransfer'
CREATE INDEX [IX_FK_OrderMoneyTransfer]
ON [dbo].[MoneyTransfer]
    ([Order_Id]);
GO

-- Creating foreign key on [SuperCategory_Id] in table 'Category'
ALTER TABLE [dbo].[Category]
ADD CONSTRAINT [FK_CategoryCategory]
    FOREIGN KEY ([SuperCategory_Id])
    REFERENCES [dbo].[Category]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryCategory'
CREATE INDEX [IX_FK_CategoryCategory]
ON [dbo].[Category]
    ([SuperCategory_Id]);
GO

-- Creating foreign key on [Product_Id] in table 'ImageFileName'
ALTER TABLE [dbo].[ImageFileName]
ADD CONSTRAINT [FK_ProductImageFileName]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[Product]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductImageFileName'
CREATE INDEX [IX_FK_ProductImageFileName]
ON [dbo].[ImageFileName]
    ([Product_Id]);
GO

-- Creating foreign key on [Id] in table 'Address_DeliveryAddress'
ALTER TABLE [dbo].[Address_DeliveryAddress]
ADD CONSTRAINT [FK_DeliveryAddress_inherits_Address]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Address]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Address_BillingAddress'
ALTER TABLE [dbo].[Address_BillingAddress]
ADD CONSTRAINT [FK_BillingAddress_inherits_Address]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Address]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Product_Antique'
ALTER TABLE [dbo].[Product_Antique]
ADD CONSTRAINT [FK_Antique_inherits_Product]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Product]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Cart_AntiqueCart'
ALTER TABLE [dbo].[Cart_AntiqueCart]
ADD CONSTRAINT [FK_AntiqueCart_inherits_Cart]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Cart]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'MoneyTransfer_Payment'
ALTER TABLE [dbo].[MoneyTransfer_Payment]
ADD CONSTRAINT [FK_Payment_inherits_MoneyTransfer]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[MoneyTransfer]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'MoneyTransfer_Chargeback'
ALTER TABLE [dbo].[MoneyTransfer_Chargeback]
ADD CONSTRAINT [FK_Chargeback_inherits_MoneyTransfer]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[MoneyTransfer]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'MoneyTransfer_WireTransfer'
ALTER TABLE [dbo].[MoneyTransfer_WireTransfer]
ADD CONSTRAINT [FK_WireTransfer_inherits_Payment]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[MoneyTransfer_Payment]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Category_MainCategory'
ALTER TABLE [dbo].[Category_MainCategory]
ADD CONSTRAINT [FK_MainCategory_inherits_Category]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Category]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Category_SubCategory'
ALTER TABLE [dbo].[Category_SubCategory]
ADD CONSTRAINT [FK_SubCategory_inherits_Category]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Category]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------