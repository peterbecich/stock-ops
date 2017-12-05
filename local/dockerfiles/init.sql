

create table if not exists exchanges (
       name text not null primary key,
       timeZone text not null,
       timeZoneOffset int4 not null
       );


create table if not exists stocks (
       stockId uuid not null primary key,
       symbol text not null unique,
       description text not null,
       exchange text not null references exchanges (name)
       );

create index stockSymbolIndex on stocks (symbol);

create table if not exists ticks (
       time timestamptz not null,
       open float8 not null,
       high float8 not null,
       low float8 not null,
       close float8 not null,
       volume int4 not null,
       stockId uuid not null references stocks (stockId),
       primary key (time, stockId)
       );

create index tickTimeIndex on ticks (time);
create index tickStockIndex on ticks (stockId);

