create schema data AUTHORIZATION dbo
GO

CREATE LOGIN dcashion WITH password = 'KeepThingsCryptic~!2'
GO

CREATE USER dcashion
	for LOGIN dcashion
	WITH DEFAULT_SCHEMA = [data]
GO