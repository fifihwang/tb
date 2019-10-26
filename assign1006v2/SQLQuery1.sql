
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/14/2019 07:50:49
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


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'FOODSet'
CREATE TABLE [dbo].[FOODSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [foodname] nvarchar(max)  NOT NULL,
    [foodcalorie] nvarchar(max)  NOT NULL,
    [foodaddress] nvarchar(max)  NOT NULL,
    [PLAN_Id] int  NOT NULL
);
GO

-- Creating table 'SPOTSet'
CREATE TABLE [dbo].[SPOTSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [spotname] nvarchar(max)  NOT NULL,
    [spotcalorie] nvarchar(max)  NOT NULL,
    [spotdesc] nvarchar(max)  NOT NULL,
    [PLANId] int  NOT NULL
);
GO

-- Creating table 'PLANSet'
CREATE TABLE [dbo].[PLANSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [calorresult] nvarchar(max)  NOT NULL
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

-- Creating primary key on [Id] in table 'PLANSet'
ALTER TABLE [dbo].[PLANSet]
ADD CONSTRAINT [PK_PLANSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [PLAN_Id] in table 'FOODSet'
ALTER TABLE [dbo].[FOODSet]
ADD CONSTRAINT [FK_FOODPLAN]
    FOREIGN KEY ([PLAN_Id])
    REFERENCES [dbo].[PLANSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FOODPLAN'
CREATE INDEX [IX_FK_FOODPLAN]
ON [dbo].[FOODSet]
    ([PLAN_Id]);
GO

-- Creating foreign key on [PLANId] in table 'SPOTSet'
ALTER TABLE [dbo].[SPOTSet]
ADD CONSTRAINT [FK_PLANSPOT]
    FOREIGN KEY ([PLANId])
    REFERENCES [dbo].[PLANSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PLANSPOT'
CREATE INDEX [IX_FK_PLANSPOT]
ON [dbo].[SPOTSet]
    ([PLANId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------