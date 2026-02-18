# Webbserverprogrammering 1 - Projekt #2
Enskillt projekt under andra halvan av höstterminen i kursen Webbserverprogrammering 1 på NTI Johanneberg.

## Uppgiftsbeskrivning
Du kommer att bygga en TODO-lista som en webbapplikation med av de tekniker vi har lärt oss i kursen Webbserverprogrammering. Under projektet kommer vi ha genomgångar för fler tekniker (som t.ex. inloggning). På vägen kommer du få kommer tips för hur du kan göra koden snyggare, bättre och lättare att hantera.

![Exempel på ToDo applikation](docs/img/todo-app.png)  
*Exempel på hur en ToDo-applikation kan se ut. Du måste **inte** göra kategorier.*

## Lärandemål
- Förstå hur de olika delarna i webbappen hänger ihop
- Kunna förklara alla steg när en användare ändrar informationen för en ToDo
- Förbereda dig för slutprojektet nästa termin

## Specifikation
- Webbapplikation i `Ruby` med `Sinatra` och `SQLite`
- Individuellt projekt
- Ta insipration från Fruktsidan
- Skapa en användare på Github med namnet: ntijoh-fornamn-efternamn.
- Forka detta repot: https://github.com/ntijoh-ola-lindberg/wsp1-todolistan och arbeta i för ditt projekt. Bjud in mig (ntijoh-ola-lindberg) till ditt repository.
- I slutet på varje lektion lägger ni upp koden ni skrivit till Github.
- Ni skriver i loggboken varje vecka.
- Ni får feedback av mig genom hela projektet. Främst på lektioner och i loggboken - kanske även via Github.
- Vid slutinlämning: Lämna in en liten film på classroom som visar applikationen.
- Bedömning: F/E 

## Installation

1. `bundle install` | Installerar de biblotek (tex. SQLite) du behöver
2. `rake` | Startar appen. Finns det ingen databas skapas en ny i `db/sqlite.db`
3. `ctrl + c` | Stänger webbservern
4. `rake seed` | Återställer databasen från seed-filen
5. `rake kill` | Stänger av alla Ruby om du t.ex. har problem att få igång webbservern med felmeddelande ungefär som `Address already in use - bind(2) for 0.0.0.0:9292` 

Använd verktyget `DB Browser for SQLite` för att titta på, arbeta fram och testa SQL-kod.