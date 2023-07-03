stopdb:
	@PGDATA=/Users/berrio/.postgres pg_ctl stop

startdb:
	@PGDATA=/Users/berrio/.postgres pg_ctl start

initdb:
	@initdb -U postgres -W

createdb:
	@createdb -U postgres stackexchange

activate:
	@echo conda activate datadb


createsql:
	psql -U postgres -d stackexchange -f ./create.sql

dropsql:
	psql -U postgres -d stackexchange -f ./drop.sql