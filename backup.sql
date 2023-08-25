PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO schema_migrations VALUES('20230712191837');
INSERT INTO schema_migrations VALUES('20230712221539');
INSERT INTO schema_migrations VALUES('20230712224256');
INSERT INTO schema_migrations VALUES('20230715170558');
INSERT INTO schema_migrations VALUES('20230715174521');
INSERT INTO schema_migrations VALUES('20230716123752');
INSERT INTO schema_migrations VALUES('20230731163316');
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO ar_internal_metadata VALUES('environment','development','2023-07-16 13:53:29.878145','2023-07-16 13:53:29.878145');
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "full_name" varchar, "username" varchar, "phone_number" varchar, "reset_password_token" varchar, "reset_password_sent_at" datetime(6), "remember_created_at" datetime(6), "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "bio" text, "private" boolean DEFAULT 1);
INSERT INTO users VALUES(1,'maramallaghi@yahoo.com','$2a$12$3aO9jDmcPK51.XUXXqc1/ulbX5wtrS43NTFyko.MSOoiwQK5fXX6q','maram allaghi','marz','',NULL,NULL,NULL,'2023-07-16 13:53:49.568958','2023-07-16 13:54:07.667171','',1);
INSERT INTO users VALUES(2,'tuna@zaytoona.com','$2a$12$RE6GmV1588Fwc7VMFAbzVu9ecVMwROOEXpfnFiMSVihBTrVSD3r7y','zaytoona','tuna','',NULL,NULL,NULL,'2023-07-30 21:34:41.801523','2023-08-24 15:28:32.350418','hey my name is zaytoona',1);
INSERT INTO users VALUES(3,'b@brett.com','$2a$12$LGVDDfGsejLDY1HEMXBG3O4kfnWk5QikTZCet4wOc70f5MVmIlOu.','brett posner','brett',NULL,NULL,NULL,NULL,'2023-07-31 20:56:06.460409','2023-07-31 20:56:06.460409',NULL,1);
INSERT INTO users VALUES(4,'ruru@roaa.com','$2a$12$44FD8jYOjK7cUd9tupx3HOGct5DRwfJGRkMlJPTcRFwHkhKFnxNLG','leo allaghi','leo','',NULL,NULL,NULL,'2023-08-01 17:58:50.001786','2023-08-01 17:59:39.156066','',0);
INSERT INTO users VALUES(5,'ruru@roro.com','$2a$12$o3TCMbH781xt5PNK/KCJs.RcbW5wv.OfH8SF8.ZWt.0bumoHYEnGe','roa','motherrari',NULL,NULL,NULL,NULL,'2023-08-10 20:58:30.280791','2023-08-10 20:58:30.280791',NULL,1);
INSERT INTO users VALUES(6,'leo@leo.com','$2a$12$smv2ol2.uPvNmyzITZa/0Ox2NdVaJcAkSWDJ7k9bw6LAO9WYrmeeW','leo','leoooo','',NULL,NULL,NULL,'2023-08-22 17:04:31.479519','2023-08-22 17:05:15.102279','',0);
INSERT INTO users VALUES(7,'maramallaghi@maram.com','$2a$12$WXek1yGgBUzCzec.7eY/HutPwElcqfAO1AtGcwNp2rgewQJuP2NpS','maram allaghi','marmar',NULL,NULL,NULL,NULL,'2023-08-22 17:09:44.720813','2023-08-22 17:09:44.720813',NULL,1);
INSERT INTO users VALUES(8,'brett@posner.com','$2a$12$kItADTsCy50UgsSRIX.fH.zIuBc8hDIOllyeMdjY3OLV5XgDD08G2','brett posner','br3tt',NULL,NULL,NULL,NULL,'2023-08-25 18:44:58.158376','2023-08-25 18:44:58.158376',NULL,1);
CREATE TABLE IF NOT EXISTS "posts" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "caption" varchar, "longitude" float, "latitude" float, "user_id" integer NOT NULL, "allow_comments" boolean, "show_likes" boolean, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_5b5ddfd518"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
INSERT INTO posts VALUES(4,'hello',NULL,NULL,2,1,NULL,'2023-07-30 21:34:50.442746','2023-07-30 21:34:50.447312');
INSERT INTO posts VALUES(5,'unaa',NULL,NULL,1,1,NULL,'2023-08-01 17:51:13.873253','2023-08-01 17:51:13.880411');
INSERT INTO posts VALUES(6,'',NULL,NULL,5,1,NULL,'2023-08-10 20:58:41.724687','2023-08-10 20:58:41.728511');
INSERT INTO posts VALUES(7,'',NULL,NULL,1,1,NULL,'2023-08-19 20:03:57.563672','2023-08-19 20:03:57.571642');
INSERT INTO posts VALUES(8,'',NULL,NULL,6,1,NULL,'2023-08-22 17:05:56.990643','2023-08-22 17:05:56.995220');
INSERT INTO posts VALUES(9,'',NULL,NULL,2,1,NULL,'2023-08-24 15:38:59.652707','2023-08-24 15:38:59.658101');
INSERT INTO posts VALUES(10,'',NULL,NULL,2,1,NULL,'2023-08-24 15:41:24.376166','2023-08-24 15:41:24.381392');
INSERT INTO posts VALUES(11,'',NULL,NULL,2,1,NULL,'2023-08-24 15:42:33.797520','2023-08-24 15:42:33.801474');
INSERT INTO posts VALUES(12,'helloo',NULL,NULL,8,1,NULL,'2023-08-25 18:45:10.080898','2023-08-25 18:45:10.086239');
INSERT INTO posts VALUES(13,'',NULL,NULL,8,1,NULL,'2023-08-25 18:49:20.668461','2023-08-25 18:49:20.672024');
INSERT INTO posts VALUES(14,'',NULL,NULL,8,1,NULL,'2023-08-25 18:49:54.148851','2023-08-25 18:49:54.153939');
CREATE TABLE IF NOT EXISTS "active_storage_blobs" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "key" varchar NOT NULL, "filename" varchar NOT NULL, "content_type" varchar, "metadata" text, "service_name" varchar NOT NULL, "byte_size" bigint NOT NULL, "checksum" varchar, "created_at" datetime(6) NOT NULL);
INSERT INTO active_storage_blobs VALUES(1,'7rq01rg5d4oc6up1iuv9t3u0zvsc','IMG_3661.jpg','image/jpeg','{"identified":true,"analyzed":true}','cloudinary',157675,'69z1oPhnAbQ7cOM0IBcNRQ==','2023-07-16 13:54:07.662732');
INSERT INTO active_storage_blobs VALUES(6,'l7d8at0f9n7blsg49ertugi0c1s2','4902FEF9-41B1-4F03-983C-B77A890B8432.JPG','image/jpeg','{"identified":true,"analyzed":true}','cloudinary',1532720,'NXPvq86fWeKEUaB9QDGpiA==','2023-07-30 21:34:50.445133');
INSERT INTO active_storage_blobs VALUES(7,'5dkb5jwzk43t4x8zhiu0o7cybpsk','4902FEF9-41B1-4F03-983C-B77A890B8432.JPG','image/jpeg','{"identified":true,"analyzed":true}','cloudinary',1532720,'NXPvq86fWeKEUaB9QDGpiA==','2023-08-01 17:51:13.878381');
INSERT INTO active_storage_blobs VALUES(8,'58npfja7ghjveyfdnjwfkwi3ixjt','Icon_PNG.png','image/png','{"identified":true,"analyzed":true}','cloudinary',75982,'u5Tm1Nz2DctFrBZpsSIryw==','2023-08-01 17:59:39.154167');
INSERT INTO active_storage_blobs VALUES(9,'9y0s36xdrf9jso8ns0t63e8mcr1r','IMG_3661.jpg','image/jpeg','{"identified":true,"analyzed":true}','cloudinary',157675,'69z1oPhnAbQ7cOM0IBcNRQ==','2023-08-10 20:58:41.726723');
INSERT INTO active_storage_blobs VALUES(10,'8y98uijjmin2q677wvi8xlm2gsej','4902FEF9-41B1-4F03-983C-B77A890B8432.JPG','image/jpeg','{"identified":true,"analyzed":true}','cloudinary',1532720,'NXPvq86fWeKEUaB9QDGpiA==','2023-08-19 20:03:57.566872');
INSERT INTO active_storage_blobs VALUES(11,'lwbytjp7zwy72ogt2dwk8l185l04','Copy of Untitled Design.png','image/png','{"identified":true,"analyzed":true}','cloudinary',22287,'qj7XsrDShDSbSghjFvQ+eA==','2023-08-19 20:03:57.570207');
INSERT INTO active_storage_blobs VALUES(12,'mdk4sypqsxlzhwywn4txz10bz46v','4902FEF9-41B1-4F03-983C-B77A890B8432.JPG','image/jpeg','{"identified":true,"analyzed":true}','cloudinary',1532720,'NXPvq86fWeKEUaB9QDGpiA==','2023-08-19 21:41:39.318493');
INSERT INTO active_storage_blobs VALUES(13,'nfcramnhgbgwedydbrtsv14r0rtd','IMG_3711.jpg','image/jpeg','{"identified":true,"analyzed":true}','cloudinary',233417,'gt9VXNr2bjRo0zW8G2GlXw==','2023-08-22 17:05:15.100399');
INSERT INTO active_storage_blobs VALUES(14,'p349i28xuo5hfohkq1sz0mv1m40v','WhatsApp Image 2023-07-06 at 4.25.12 PM.jpeg','image/jpeg','{"identified":true,"analyzed":true}','cloudinary',164338,'4jwwCqqhuZaejizgn2DObQ==','2023-08-22 17:05:56.992283');
INSERT INTO active_storage_blobs VALUES(15,'ei02tqwd4ag0ww8wlny4ufjwcf0k','Violet Blue Modern Minimal Pattern Background Cut-Out Photo Business Woman Business Marketing Instagram Post (1).png','image/png','{"identified":true,"analyzed":true}','cloudinary',434529,'nn/pFWAqhFiBPBPy4/NeQQ==','2023-08-22 17:05:56.993602');
INSERT INTO active_storage_blobs VALUES(16,'oquo7ww6nyzgedsjef4v084hobl1','IMG_0541.jpg','image/jpeg','{"identified":true,"analyzed":true}','cloudinary',132169,'4PpYkBI3VXX6/bBiHGYPvw==','2023-08-24 15:38:59.655889');
INSERT INTO active_storage_blobs VALUES(17,'f2odk8n2auz6gmnja187mkfsh2va','list_background.jpg','image/jpeg','{"identified":true,"analyzed":true}','cloudinary',2709536,'CNeikZnQNidXSYTNCNEhPg==','2023-08-24 15:41:24.377900');
INSERT INTO active_storage_blobs VALUES(18,'piudvd63y6wjo0y4mg63bepa0ndr','Logo_JPG.jpg','image/jpeg','{"identified":true,"analyzed":true}','cloudinary',582429,'yhgj6Y6d9L66PTFDiS83Pw==','2023-08-24 15:41:24.379281');
INSERT INTO active_storage_blobs VALUES(19,'wc6w6brcmvyzapjvi3bgb3o4knjp','Linkedin Live poster.png','image/png','{"identified":true,"analyzed":true}','cloudinary',643566,'dXwxm4z1E9Los5JDnlgRXQ==','2023-08-24 15:41:24.380408');
INSERT INTO active_storage_blobs VALUES(20,'t5ocouous3uycj5l6nddevqbhjkb','Vision board.png','image/png','{"identified":true,"analyzed":true}','cloudinary',2539941,'xcwHxQP3aVyvB1MvDgiYIw==','2023-08-24 15:42:33.799643');
INSERT INTO active_storage_blobs VALUES(21,'ij89h63clxa04pnedfza54zon83a','home-phone-bg.png','image/png','{"identified":true,"analyzed":true}','cloudinary',226415,'IcrkjTG2IxhLWunwSFffqw==','2023-08-25 18:45:10.083270');
INSERT INTO active_storage_blobs VALUES(22,'x1cstuoj16fywd9q4h7cq2rlgreb','instagram.jpeg','image/jpeg','{"identified":true,"analyzed":true}','cloudinary',13235,'ZLHNmzWwVr/kADcPaf51dg==','2023-08-25 18:49:20.670337');
INSERT INTO active_storage_blobs VALUES(23,'3goplql3u0t75n4jrur0rkcdjpfk','petstagram.png','image/png','{"identified":true,"analyzed":true}','cloudinary',23222,'swDAOIWa3Y91ajKtkl+4hw==','2023-08-25 18:49:54.151537');
CREATE TABLE IF NOT EXISTS "active_storage_attachments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "record_type" varchar NOT NULL, "record_id" bigint NOT NULL, "blob_id" bigint NOT NULL, "created_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_c3b3935057"
FOREIGN KEY ("blob_id")
  REFERENCES "active_storage_blobs" ("id")
);
INSERT INTO active_storage_attachments VALUES(1,'profile_pic','User',1,1,'2023-07-16 13:54:07.664966');
INSERT INTO active_storage_attachments VALUES(6,'images','Post',4,6,'2023-07-30 21:34:50.446535');
INSERT INTO active_storage_attachments VALUES(7,'images','Post',5,7,'2023-08-01 17:51:13.879755');
INSERT INTO active_storage_attachments VALUES(8,'profile_pic','User',4,8,'2023-08-01 17:59:39.155425');
INSERT INTO active_storage_attachments VALUES(9,'images','Post',6,9,'2023-08-10 20:58:41.727854');
INSERT INTO active_storage_attachments VALUES(10,'images','Post',7,10,'2023-08-19 20:03:57.568714');
INSERT INTO active_storage_attachments VALUES(11,'images','Post',7,11,'2023-08-19 20:03:57.571040');
INSERT INTO active_storage_attachments VALUES(12,'profile_pic','User',2,12,'2023-08-19 21:41:39.319531');
INSERT INTO active_storage_attachments VALUES(13,'profile_pic','User',6,13,'2023-08-22 17:05:15.101531');
INSERT INTO active_storage_attachments VALUES(14,'images','Post',8,14,'2023-08-22 17:05:56.992932');
INSERT INTO active_storage_attachments VALUES(15,'images','Post',8,15,'2023-08-22 17:05:56.994113');
INSERT INTO active_storage_attachments VALUES(16,'images','Post',9,16,'2023-08-24 15:38:59.657370');
INSERT INTO active_storage_attachments VALUES(17,'images','Post',10,17,'2023-08-24 15:41:24.378651');
INSERT INTO active_storage_attachments VALUES(18,'images','Post',10,18,'2023-08-24 15:41:24.379841');
INSERT INTO active_storage_attachments VALUES(19,'images','Post',10,19,'2023-08-24 15:41:24.380957');
INSERT INTO active_storage_attachments VALUES(20,'images','Post',11,20,'2023-08-24 15:42:33.800681');
INSERT INTO active_storage_attachments VALUES(21,'images','Post',12,21,'2023-08-25 18:45:10.085032');
INSERT INTO active_storage_attachments VALUES(22,'images','Post',13,22,'2023-08-25 18:49:20.671415');
INSERT INTO active_storage_attachments VALUES(23,'images','Post',14,23,'2023-08-25 18:49:54.152797');
CREATE TABLE IF NOT EXISTS "active_storage_variant_records" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "blob_id" bigint NOT NULL, "variation_digest" varchar NOT NULL, CONSTRAINT "fk_rails_993965df05"
FOREIGN KEY ("blob_id")
  REFERENCES "active_storage_blobs" ("id")
);
CREATE TABLE IF NOT EXISTS "likes" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "post_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_1e09b5dabf"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
, CONSTRAINT "fk_rails_87a8aac469"
FOREIGN KEY ("post_id")
  REFERENCES "posts" ("id")
);
INSERT INTO likes VALUES(2,1,5,'2023-08-01 18:00:34.772885','2023-08-01 18:00:34.772885');
INSERT INTO likes VALUES(3,4,5,'2023-08-01 18:01:00.509600','2023-08-01 18:01:00.509600');
INSERT INTO likes VALUES(7,7,8,'2023-08-22 17:17:14.737128','2023-08-22 17:17:14.737128');
INSERT INTO likes VALUES(8,2,4,'2023-08-22 17:22:39.347689','2023-08-22 17:22:39.347689');
INSERT INTO likes VALUES(9,2,8,'2023-08-22 17:22:41.343170','2023-08-22 17:22:41.343170');
INSERT INTO likes VALUES(11,2,10,'2023-08-24 15:57:12.318054','2023-08-24 15:57:12.318054');
CREATE TABLE IF NOT EXISTS "comments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "post_id" integer NOT NULL, "body" text, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_03de2dc08c"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
, CONSTRAINT "fk_rails_2fd19c0db7"
FOREIGN KEY ("post_id")
  REFERENCES "posts" ("id")
);
INSERT INTO comments VALUES(2,4,5,'cute cat!','2023-08-01 18:01:36.694538','2023-08-01 18:01:36.694538');
INSERT INTO comments VALUES(3,2,4,'h','2023-08-25 17:42:02.630771','2023-08-25 17:42:02.630771');
INSERT INTO comments VALUES(4,2,4,'hi','2023-08-25 17:43:10.125447','2023-08-25 17:43:10.125447');
INSERT INTO comments VALUES(5,2,10,'hry','2023-08-25 17:43:16.550244','2023-08-25 17:43:16.550244');
INSERT INTO comments VALUES(6,2,4,'huidshid','2023-08-25 17:45:59.458623','2023-08-25 17:45:59.458623');
INSERT INTO comments VALUES(7,2,8,'hi','2023-08-25 17:47:30.471402','2023-08-25 17:47:30.471402');
INSERT INTO comments VALUES(8,2,8,'fhudsfhc','2023-08-25 17:49:01.955758','2023-08-25 17:49:01.955758');
INSERT INTO comments VALUES(9,2,8,'fjis','2023-08-25 17:53:31.744142','2023-08-25 17:53:31.744142');
INSERT INTO comments VALUES(10,2,4,'fdj','2023-08-25 17:54:53.363934','2023-08-25 17:54:53.363934');
INSERT INTO comments VALUES(11,2,11,'kgoefjo','2023-08-25 17:58:08.962910','2023-08-25 17:58:08.962910');
INSERT INTO comments VALUES(12,2,11,'djis','2023-08-25 17:59:25.138622','2023-08-25 17:59:25.138622');
INSERT INTO comments VALUES(13,2,11,'dsocd','2023-08-25 17:59:36.410420','2023-08-25 17:59:36.410420');
INSERT INTO comments VALUES(14,2,11,'dlkfos','2023-08-25 18:00:08.200336','2023-08-25 18:00:08.200336');
INSERT INTO comments VALUES(15,2,11,'ji','2023-08-25 18:00:39.503031','2023-08-25 18:00:39.503031');
INSERT INTO comments VALUES(16,2,8,'fjdifjsid','2023-08-25 18:02:58.518972','2023-08-25 18:02:58.518972');
CREATE TABLE IF NOT EXISTS "follows" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "follower_id" integer, "followed_id" integer, "accepted" boolean DEFAULT 0, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO follows VALUES(2,1,3,1,'2023-07-31 20:57:11.050041','2023-07-31 20:59:32.379229');
INSERT INTO follows VALUES(3,2,3,1,'2023-07-31 20:57:31.518125','2023-08-01 14:45:08.852353');
INSERT INTO follows VALUES(6,3,1,1,'2023-08-01 17:44:42.748471','2023-08-01 17:51:03.102873');
INSERT INTO follows VALUES(7,4,1,1,'2023-08-01 17:59:03.187678','2023-08-01 18:00:04.542500');
INSERT INTO follows VALUES(10,1,4,1,'2023-08-10 20:23:45.749420','2023-08-10 20:23:45.749420');
INSERT INTO follows VALUES(11,1,2,1,'2023-08-10 20:33:14.864009','2023-08-22 17:09:01.712475');
INSERT INTO follows VALUES(12,5,1,1,'2023-08-10 20:58:46.601610','2023-08-10 20:58:56.974103');
INSERT INTO follows VALUES(13,1,5,1,'2023-08-10 20:58:58.272403','2023-08-10 20:59:11.098698');
INSERT INTO follows VALUES(14,2,5,0,'2023-08-20 18:24:44.702909','2023-08-20 18:24:44.702909');
INSERT INTO follows VALUES(15,2,1,0,'2023-08-20 18:24:46.095820','2023-08-20 18:24:46.095820');
INSERT INTO follows VALUES(16,2,4,1,'2023-08-20 18:24:46.925946','2023-08-20 18:24:46.925946');
INSERT INTO follows VALUES(17,6,1,0,'2023-08-22 17:05:31.187749','2023-08-22 17:05:31.187749');
INSERT INTO follows VALUES(18,6,3,0,'2023-08-22 17:05:31.721126','2023-08-22 17:05:31.721126');
INSERT INTO follows VALUES(19,6,5,0,'2023-08-22 17:05:32.711253','2023-08-22 17:05:32.711253');
INSERT INTO follows VALUES(20,6,2,1,'2023-08-22 17:05:33.472589','2023-08-22 17:08:59.515291');
INSERT INTO follows VALUES(21,6,4,1,'2023-08-22 17:05:34.502311','2023-08-22 17:05:34.502311');
INSERT INTO follows VALUES(22,2,6,1,'2023-08-22 17:06:19.322169','2023-08-22 17:06:19.322169');
INSERT INTO follows VALUES(24,7,2,1,'2023-08-22 17:09:47.909135','2023-08-22 17:10:29.306287');
INSERT INTO follows VALUES(25,7,6,1,'2023-08-22 17:09:54.629069','2023-08-22 17:09:54.629069');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('users',8);
INSERT INTO sqlite_sequence VALUES('active_storage_blobs',23);
INSERT INTO sqlite_sequence VALUES('active_storage_attachments',23);
INSERT INTO sqlite_sequence VALUES('posts',14);
INSERT INTO sqlite_sequence VALUES('likes',11);
INSERT INTO sqlite_sequence VALUES('comments',18);
INSERT INTO sqlite_sequence VALUES('follows',26);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE INDEX "index_posts_on_user_id" ON "posts" ("user_id");
CREATE UNIQUE INDEX "index_active_storage_blobs_on_key" ON "active_storage_blobs" ("key");
CREATE INDEX "index_active_storage_attachments_on_blob_id" ON "active_storage_attachments" ("blob_id");
CREATE UNIQUE INDEX "index_active_storage_attachments_uniqueness" ON "active_storage_attachments" ("record_type", "record_id", "name", "blob_id");
CREATE UNIQUE INDEX "index_active_storage_variant_records_uniqueness" ON "active_storage_variant_records" ("blob_id", "variation_digest");
CREATE INDEX "index_likes_on_user_id" ON "likes" ("user_id");
CREATE INDEX "index_likes_on_post_id" ON "likes" ("post_id");
CREATE UNIQUE INDEX "index_likes_on_user_id_and_post_id" ON "likes" ("user_id", "post_id");
CREATE INDEX "index_comments_on_user_id" ON "comments" ("user_id");
CREATE INDEX "index_comments_on_post_id" ON "comments" ("post_id");
CREATE INDEX "index_follows_on_follower_id" ON "follows" ("follower_id");
CREATE INDEX "index_follows_on_followed_id" ON "follows" ("followed_id");
CREATE UNIQUE INDEX "index_follows_on_follower_id_and_followed_id" ON "follows" ("follower_id", "followed_id");
COMMIT;
