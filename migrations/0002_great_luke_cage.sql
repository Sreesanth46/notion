ALTER TABLE "files" DROP CONSTRAINT "files_folder_workspaces_id_fk";
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "files" ADD CONSTRAINT "files_folder_folders_id_fk" FOREIGN KEY ("folder") REFERENCES "folders"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
