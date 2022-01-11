run 
{
ALLOCATE CHANNEL ch1 DEVICE TYPE DISK FORMAT '\\10.130.8.94\rodbbackups\WFM_EMEA\rmanbackup\data\level0_%d_%U_%T';
CONFIGURE BACKUP OPTIMIZATION OFF;
crosscheck backup;
crosscheck copy; 
backup as compressed backupset incremental level 0 database plus archivelog FORMAT '\\10.130.8.94\rodbbackups\WFM_EMEA\rmanbackup\arc\archive_level_0_%d_%s_%p_%T' tag 'LEVEL0' delete all input;
delete noprompt obsolete;
release channel ch1;
}