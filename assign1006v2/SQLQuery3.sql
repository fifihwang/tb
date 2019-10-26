
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/15/2019 02:26:03
-- Generated from EDMX file: C:\Users\fiona\source\repos\assign1006\assign1006\Models\assignv1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-assign1006-20191006044239];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FOODSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FOODSet];
GO
IF OBJECT_ID(N'[dbo].[SPOTSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SPOTSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'FOODSet'
CREATE TABLE [dbo].[FOODSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [foodname] nvarchar(max)  NOT NULL,
    [foodcalorie] nvarchar(max)  NOT NULL,
    [foodaddress] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SPOTSet'
CREATE TABLE [dbo].[SPOTSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [spotname] nvarchar(max)  NOT NULL,
    [spotcalorie] nvarchar(max)  NOT NULL,
    [spotdesc] nvarchar(max)  NOT NULL,
   
);
GO

-- Creating table 'FOODSPOT'
CREATE TABLE [dbo].[FOODSPOT] (
    [FOOD_Id] int  NOT NULL,
    [SPOT_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'FOODSet'
ALTER TABLE [dbo].[FOODSet]
ADD CONSTRAINT [PK_FOODSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SPOTSet'
ALTER TABLE [dbo].[SPOTSet]
ADD CONSTRAINT [PK_SPOTSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [FOOD_Id], [SPOT_Id] in table 'FOODSPOT'
ALTER TABLE [dbo].[FOODSPOT]
ADD CONSTRAINT [PK_FOODSPOT]
    PRIMARY KEY CLUSTERED ([FOOD_Id], [SPOT_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [FOOD_Id] in table 'FOODSPOT'
ALTER TABLE [dbo].[FOODSPOT]
ADD CONSTRAINT [FK_FOODSPOT_FOOD]
    FOREIGN KEY ([FOOD_Id])
    REFERENCES [dbo].[FOODSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SPOT_Id] in table 'FOODSPOT'
ALTER TABLE [dbo].[FOODSPOT]
ADD CONSTRAINT [FK_FOODSPOT_SPOT]
    FOREIGN KEY ([SPOT_Id])
    REFERENCES [dbo].[SPOTSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FOODSPOT_SPOT'
CREATE INDEX [IX_FK_FOODSPOT_SPOT]
ON [dbo].[FOODSPOT]
    ([SPOT_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------