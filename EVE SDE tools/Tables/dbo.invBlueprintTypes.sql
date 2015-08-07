CREATE TABLE [dbo].[invBlueprintTypes] (
    [blueprintTypeID]          INT      NOT NULL,
    [parentBlueprintTypeID]    INT      NULL,
    [productTypeID]            INT      NULL,
    [productionTime]           INT      NULL,
    [techLevel]                SMALLINT NULL,
    [researchProductivityTime] INT      NULL,
    [researchMaterialTime]     INT      NULL,
    [researchCopyTime]         INT      NULL,
    [researchTechTime]         INT      NULL,
    [duplicatingTime]          INT      NULL,
    [reverseEngineeringTime]   INT      NULL,
    [inventionTime]            INT      NULL,
    [productivityModifier]     INT      NULL,
    [materialModifier]         SMALLINT NULL,
    [wasteFactor]              SMALLINT NULL,
    [maxProductionLimit]       INT      NULL,
    CONSTRAINT [invBlueprintTypes_PK] PRIMARY KEY CLUSTERED ([blueprintTypeID] ASC)
);

