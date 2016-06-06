ALTER TABLE "historico"."historico" ALTER COLUMN "data_criacao" SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "modulos"."permissoes"
	DROP COLUMN "menus_id_menus" CASCADE;

ALTER TABLE "cadastros"."pessoas" ALTER COLUMN "tipo" SET DEFAULT 'PF';