--this script should be run after the database 
--has been enabled for packet management


USE DataScienceDB;
GO


--ALTER ROLE [rpkgs-users] 
--  ADD MEMBER dane;

ALTER ROLE [rpkgs-users] 
  ADD MEMBER user1;

ALTER ROLE [rpkgs-shared] 
  ADD MEMBER dane;

ALTER ROLE [rpkgs-shared] 
  ADD MEMBER user2;

ALTER ROLE [rpkgs-private] 
  ADD MEMBER user3;

ALTER ROLE [rpkgs-private] 
  ADD MEMBER user4;
GO