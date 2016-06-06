ALTER TABLE "historico"."historico" ALTER COLUMN "data_criacao" SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "modulos"."permissoes"
	ADD COLUMN "menus_id_menus" int4
		NOT NULL;

ALTER TABLE "modulos"."modulo"
	ADD COLUMN "id_menus" int4
		NOT NULL;

ALTER TABLE "cadastros"."pessoas" ALTER COLUMN "tipo" SET DEFAULT 'PF';

CREATE TABLE "modulos"."menus" (
	"id_menus" SERIAL NOT NULL,
	"nome_menu" varchar(100) NOT NULL,
	"ordem" int4,
	"ativo" bool NOT NULL DEFAULT True,
	PRIMARY KEY("id_menus")
);

ALTER TABLE "modulos"."modulo" ADD CONSTRAINT "Ref_modulo_to_menus" FOREIGN KEY ("id_menus")
	REFERENCES "modulos"."menus"("id_menus")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;
