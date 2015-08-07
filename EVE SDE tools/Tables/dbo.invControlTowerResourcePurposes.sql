CREATE TABLE [dbo].[invControlTowerResourcePurposes] (
    [purpose]     TINYINT       NOT NULL,
    [purposeText] VARCHAR (100) NULL,
    CONSTRAINT [invControlTowerResourcePurposes_PK] PRIMARY KEY CLUSTERED ([purpose] ASC)
);

