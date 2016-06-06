CREATE SCHEMA "historico";



CREATE TABLE "condominio"."_pgmdd_backup_agenda_2016-05-04_11:11" AS
	SELECT * FROM condominio.agenda;

ALTER TABLE "condominio"."agenda"
	RENAME COLUMN "unidades_lazer_id_unidades_lazer" TO "id_unidades_lazer";

ALTER TABLE "condominio"."agenda"
	RENAME COLUMN "pessoas_id_pessoas" TO "id_pessoas";

CREATE TABLE "condominio"."_pgmdd_backup_pessoas_unidades_2016-05-04_11:11" AS
	SELECT * FROM condominio.pessoas_unidades;

ALTER TABLE "condominio"."pessoas_unidades"
	RENAME COLUMN "tipo_pessoas_unidades_id_tipo_pessoas_unidades" TO "id_tipo_pessoas_unidades";

ALTER TABLE "condominio"."pessoas_unidades"
	RENAME COLUMN "unidades_id_unidade" TO "id_unidade";

ALTER TABLE "condominio"."pessoas_unidades"
	RENAME COLUMN "pessoas_id_pessoas" TO "id_pessoas";

CREATE TABLE "modulos"."_pgmdd_backup_permissoes_2016-05-04_11:11" AS
	SELECT * FROM modulos.permissoes;

ALTER TABLE "modulos"."permissoes"
	RENAME COLUMN "modulo_id_modulo" TO "id_modulo";

ALTER TABLE "modulos"."permissoes"
	RENAME COLUMN "usuarios_id_usuarios" TO "id_usuarios";

CREATE TABLE "cadastros"."_pgmdd_backup_pessoas_2016-05-04_11:11" AS
	SELECT * FROM cadastros.pessoas;

ALTER TABLE "cadastros"."pessoas" ALTER COLUMN "tipo" SET DEFAULT 'PF';

CREATE TABLE "cadastros"."_pgmdd_backup_usuarios_2016-05-04_11:11" AS
	SELECT * FROM cadastros.usuarios;

ALTER TABLE "cadastros"."usuarios"
	RENAME COLUMN "pessoas_id_pessoas" TO "id_pessoas";

CREATE TABLE "historico"."historico" (
	"id_historico" SERIAL NOT NULL,
	"id_usuarios" int4 NOT NULL,
	"id_tipo_acao" int4 NOT NULL,
	"historico" varchar(255) NOT NULL,
	"nome_tabela" varchar(255) NOT NULL,
	"id_registro" varchar(255),
	"id_chave_estrangeira" varchar(255),
	"data_criacao" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"nota" text,
	PRIMARY KEY("id_historico")
);

CREATE TABLE "historico"."tipo_acao" (
	"id_tipo_acao" SERIAL NOT NULL,
	"tipo_acao" varchar(255) NOT NULL,
	PRIMARY KEY("id_tipo_acao")
);

ALTER TABLE "historico"."historico" ADD CONSTRAINT "Ref_historico_to_usuarios" FOREIGN KEY ("id_usuarios")
	REFERENCES "cadastros"."usuarios"("id_usuarios")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "historico"."historico" ADD CONSTRAINT "Ref_historico_to_tipo_acao" FOREIGN KEY ("id_tipo_acao")
	REFERENCES "historico"."tipo_acao"("id_tipo_acao")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE cadastros.usuarios
	DROP CONSTRAINT "Ref_usuarios_to_pessoas" CASCADE;

ALTER TABLE "cadastros"."usuarios" ADD CONSTRAINT "Ref_usuarios_to_pessoas" FOREIGN KEY ("id_pessoas")
	REFERENCES "cadastros"."pessoas"("id_pessoas")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE modulos.permissoes
	DROP CONSTRAINT "Ref_permissoes_to_modulo" CASCADE;

ALTER TABLE modulos.permissoes
	DROP CONSTRAINT "Ref_permissoes_to_usuarios" CASCADE;

ALTER TABLE "modulos"."permissoes" ADD CONSTRAINT "Ref_permissoes_to_modulo" FOREIGN KEY ("id_modulo")
	REFERENCES "modulos"."modulo"("id_modulo")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "modulos"."permissoes" ADD CONSTRAINT "Ref_permissoes_to_usuarios" FOREIGN KEY ("id_usuarios")
	REFERENCES "cadastros"."usuarios"("id_usuarios")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE condominio.pessoas_unidades
	DROP CONSTRAINT "Ref_pessoas_unidades_to_tipo_pessoas_unidades" CASCADE;

ALTER TABLE condominio.pessoas_unidades
	DROP CONSTRAINT "Ref_pessoas_unidades_to_unidades" CASCADE;

ALTER TABLE condominio.pessoas_unidades
	DROP CONSTRAINT "Ref_pessoas_unidades_to_pessoas" CASCADE;

ALTER TABLE "condominio"."pessoas_unidades" ADD CONSTRAINT "Ref_pessoas_unidades_to_tipo_pessoas_unidades" FOREIGN KEY ("id_tipo_pessoas_unidades")
	REFERENCES "condominio"."tipo_pessoas_unidades"("id_tipo_pessoas_unidades")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "condominio"."pessoas_unidades" ADD CONSTRAINT "Ref_pessoas_unidades_to_unidades" FOREIGN KEY ("id_unidade")
	REFERENCES "condominio"."unidades"("id_unidade")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "condominio"."pessoas_unidades" ADD CONSTRAINT "Ref_pessoas_unidades_to_pessoas" FOREIGN KEY ("id_pessoas")
	REFERENCES "cadastros"."pessoas"("id_pessoas")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE condominio.agenda
	DROP CONSTRAINT "Ref_agenda_to_unidades_lazer" CASCADE;

ALTER TABLE condominio.agenda
	DROP CONSTRAINT "Ref_agenda_to_pessoas" CASCADE;

ALTER TABLE "condominio"."agenda" ADD CONSTRAINT "Ref_agenda_to_unidades_lazer" FOREIGN KEY ("id_unidades_lazer")
	REFERENCES "condominio"."unidades_lazer"("id_unidades_lazer")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "condominio"."agenda" ADD CONSTRAINT "Ref_agenda_to_pessoas" FOREIGN KEY ("id_pessoas")
	REFERENCES "cadastros"."pessoas"("id_pessoas")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

INSERT INTO historico.tipo_acao (tipo_acao) VALUES ('Inserir');
INSERT INTO historico.tipo_acao (tipo_acao) VALUES ('Editar');
INSERT INTO historico.tipo_acao (tipo_acao) VALUES ('Excluir');
INSERT INTO historico.tipo_acao (tipo_acao) VALUES ('Imprimir');