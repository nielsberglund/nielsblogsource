USE GamePlayDB;
GO

DROP TABLE IF EXISTS dbo.tb_KafkaEventSubscriber;
DROP TABLE IF EXISTS  dbo.tb_KafkaCluster;
GO

CREATE TABLE dbo.tb_KafkaCluster
(
  ClusterID int,
  BootstrapServers nvarchar(4000) NOT NULL,
  [Description] nvarchar(4000) NOT NULL,
  CONSTRAINT [pk_KafkaCluster] PRIMARY KEY
  (ClusterID)
);
GO

CREATE TABLE dbo.tb_KafkaEventSubscriber
(
  SubscriberID int identity,
  EventID int NOT NULL,
  ClusterID int NOT NULL,
  Topic nvarchar(256) NOT NULL,
  CONSTRAINT [pk_KafkaEventSubscriber] PRIMARY KEY
  (EventID, ClusterID, Topic),
  CONSTRAINT [fk_KafkaEventSubscriber_ClusterID] FOREIGN KEY (ClusterID)
  REFERENCES dbo.tb_KafkaCluster(ClusterID)
);
GO

INSERT INTO dbo.tb_KafkaCluster(ClusterID, BootstrapServers, [Description])
VALUES(1, 'localhost:9092', 'First cluster');

INSERT INTO dbo.tb_KafkaEventSubscriber(EventID, ClusterID, Topic)
VALUES (1, 1, 'testTopic'),
       (1500, 1, 'wagers');

/*
SELECT * FROM  dbo.tb_KafkaCluster 
SELECT * FROM  dbo.tb_KafkaEventSubscriber
*/