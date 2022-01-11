run
{
ALLOCATE CHANNEL ch1 DEVICE TYPE DISK FORMAT '\\10.130.8.94\rodbbackups\WFM_EMEA\rmanbackup\data\incr_%d_%U_%T';
CONFIGURE BACKUP OPTIMIZATION OFF;
crosscheck backup;
backup as compressed backupset incremental level 1 database plus archivelog FORMAT '\\10.130.8.94\rodbbackups\WFM_EMEA\rmanbackup\arc\archive_level_1_%d_%s_%p_%T' tag 'LEVEL1' delete all input;
delete noprompt obsolete;
delete noprompt expired backup;
release channel ch1;
}