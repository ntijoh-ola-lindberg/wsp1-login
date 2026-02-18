# Webbserverprogramering 1 - Exempel på login
Exempel på inloggning med sessions för kursen Webbserverprogrammering 1 på NTI Johanneberg

Läs:
 * https://ntijoh.github.io/webbserverprogrammeringsboken/#_kakor_kryptering_och_sessioner
 * https://ntijoh.github.io/webbserverprogrammeringsboken/#_registrering_inloggning

## Lärandemål
- todo

## Installation

1. `bundle install` | Installerar de biblotek (tex. SQLite) du behöver
2. `rake` | Startar appen. Finns det ingen databas skapas en ny i `db/sqlite.db`
3. `ctrl + c` | Stänger webbservern
4. `rake seed` | Återställer databasen från seed-filen
5. `rake kill` | Stänger av alla Ruby om du t.ex. har problem att få igång webbservern med felmeddelande ungefär som `Address already in use - bind(2) for 0.0.0.0:9292` 

Använd verktyget `DB Browser for SQLite` för att titta på, arbeta fram och testa SQL-kod.