CREATE SCHEMA "cadastros";



CREATE SCHEMA "modulos";



CREATE SCHEMA "condominio";



CREATE TABLE "condominio"."agenda" (
	"id_agenda" SERIAL NOT NULL,
	"pessoas_id_pessoas" int4 NOT NULL,
	"unidades_lazer_id_unidades_lazer" int4 NOT NULL,
	"data_reserva" timestamp,
	"observacoes" varchar(255),
	PRIMARY KEY("id_agenda")
);

CREATE TABLE "condominio"."unidades_lazer" (
	"id_unidades_lazer" SERIAL NOT NULL,
	"unidade" varchar(100) NOT NULL,
	"localizacao" varchar(100) NOT NULL,
	PRIMARY KEY("id_unidades_lazer")
);

CREATE TABLE "condominio"."tipo_pessoas_unidades" (
	"id_tipo_pessoas_unidades" SERIAL NOT NULL,
	"tipo" varchar(20),
	PRIMARY KEY("id_tipo_pessoas_unidades")
);

CREATE TABLE "condominio"."pessoas_unidades" (
	"id_pessoas_unidades" int4 NOT NULL,
	"pessoas_id_pessoas" int4 NOT NULL,
	"unidades_id_unidade" int4 NOT NULL,
	"tipo_pessoas_unidades_id_tipo_pessoas_unidades" int4 NOT NULL,
	PRIMARY KEY("id_pessoas_unidades")
);

CREATE TABLE "condominio"."unidades" (
	"id_unidade" SERIAL NOT NULL,
	"id_proprietario" int4 NOT NULL,
	"numero" varchar(20) NOT NULL,
	"vagas" int4,
	"observacoes" varchar(255),
	"id_inquilino" int4 NOT NULL,
	PRIMARY KEY("id_unidade")
);

CREATE TABLE "modulos"."permissoes" (
	"id_permissoes" SERIAL NOT NULL,
	"usuarios_id_usuarios" int4 NOT NULL,
	"modulo_id_modulo" int4 NOT NULL,
	"ler" bool NOT NULL DEFAULT True,
	"editar" bool NOT NULL DEFAULT False,
	"excluir" bool NOT NULL DEFAULT False,
	"criar" bool NOT NULL DEFAULT False,
	PRIMARY KEY("id_permissoes")
);

CREATE TABLE "modulos"."modulo" (
	"id_modulo" SERIAL NOT NULL,
	"nome_modulo" varchar(200) NOT NULL,
	"caminho" varchar(255) NOT NULL,
	"ativo" bool NOT NULL DEFAULT True,
	PRIMARY KEY("id_modulo")
);

CREATE TABLE "cadastros"."pessoas" (
	"id_pessoas" SERIAL NOT NULL,
	"nome" varchar(255) NOT NULL,
	"sobrenome" varchar(255) NOT NULL,
	"tipo" varchar(2) NOT NULL DEFAULT PF,
	"endereco" varchar(255) NOT NULL,
	"numero" varchar(255) NOT NULL,
	"complemento" varchar(255),
	"cep" varchar(9) NOT NULL,
	"bairro" varchar(255) NOT NULL,
	"cidade" varchar(255) NOT NULL,
	"estado" varchar(2) NOT NULL,
	"documento1" varchar(20) NOT NULL,
	"documento2" varchar(20),
	"email" varchar(255),
	"telefone" varchar(20) NOT NULL,
	"telefone2" varchar(20),
	"telefone3" varchar(20),
	PRIMARY KEY("id_pessoas")
);

COMMENT ON COLUMN "cadastros"."pessoas"."tipo" IS 'PF|PJ';

CREATE TABLE "cadastros"."usuarios" (
	"id_usuarios" SERIAL NOT NULL,
	"pessoas_id_pessoas" int4 NOT NULL,
	"usuario" varchar(80) NOT NULL,
	"senha" varchar(512) NOT NULL,
	"email" varchar(200),
	"ativo" bool NOT NULL DEFAULT True,
	PRIMARY KEY("id_usuarios")
);

ALTER TABLE "condominio"."agenda" ADD CONSTRAINT "Ref_agenda_to_pessoas" FOREIGN KEY ("pessoas_id_pessoas")
	REFERENCES "cadastros"."pessoas"("id_pessoas")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "condominio"."agenda" ADD CONSTRAINT "Ref_agenda_to_unidades_lazer" FOREIGN KEY ("unidades_lazer_id_unidades_lazer")
	REFERENCES "condominio"."unidades_lazer"("id_unidades_lazer")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "condominio"."pessoas_unidades" ADD CONSTRAINT "Ref_pessoas_unidades_to_pessoas" FOREIGN KEY ("pessoas_id_pessoas")
	REFERENCES "cadastros"."pessoas"("id_pessoas")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "condominio"."pessoas_unidades" ADD CONSTRAINT "Ref_pessoas_unidades_to_unidades" FOREIGN KEY ("unidades_id_unidade")
	REFERENCES "condominio"."unidades"("id_unidade")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "condominio"."pessoas_unidades" ADD CONSTRAINT "Ref_pessoas_unidades_to_tipo_pessoas_unidades" FOREIGN KEY ("tipo_pessoas_unidades_id_tipo_pessoas_unidades")
	REFERENCES "condominio"."tipo_pessoas_unidades"("id_tipo_pessoas_unidades")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "modulos"."permissoes" ADD CONSTRAINT "Ref_permissoes_to_usuarios" FOREIGN KEY ("usuarios_id_usuarios")
	REFERENCES "cadastros"."usuarios"("id_usuarios")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "modulos"."permissoes" ADD CONSTRAINT "Ref_permissoes_to_modulo" FOREIGN KEY ("modulo_id_modulo")
	REFERENCES "modulos"."modulo"("id_modulo")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "cadastros"."usuarios" ADD CONSTRAINT "Ref_usuarios_to_pessoas" FOREIGN KEY ("pessoas_id_pessoas")
	REFERENCES "cadastros"."pessoas"("id_pessoas")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;