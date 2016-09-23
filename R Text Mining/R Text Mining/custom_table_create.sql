﻿CREATE TABLE custom_dictionary (
word_id INT IDENTITY(1,1) NOT FOR REPLICATION,
word_txt VARCHAR(255) NOT NULL,
created_by VARCHAR(40) NOT NULL DEFAULT SUSER_NAME(),
created_date datetime2 NOT NULL DEFAULT GETDATE(),
is_active BIT NOT NULL DEFAULT 1)