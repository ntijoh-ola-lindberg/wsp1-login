# Arkitektur för användarhantering och inloggning

Detta dokument beskriver hur man strukturerar routes för att hantera användarkonton, inloggning och utloggning i en webbapplikation. För kursen Webbserverprogrammering 1 på NTI Johanneberg.

Innan ni arbetar med exemplet här har ni sett en föreläsning. I Webbserverprogrammeringsboken finns teori och exempel om [Registrering och inloggning](https://ntijoh.github.io/webbserverprogrammeringsboken/#_registrering_inloggning) och [Kakor, kryptering och sessioner](https://ntijoh.github.io/webbserverprogrammeringsboken/#_kakor_kryptering_och_sessioner).

## Mål med dokumentet
* Öva på att se vilka routes som behövs för användarkonton.
* Förstå **REST-standarden** med rätt Verb och Routes.
* Förstå kopplingen mellan REST-standarden och databastabeller.

## Användare: RESTful routes
Följande routes hanterar användarkonton, dvs. registrering, visning, ändring av profiler och borttagning av konto.

Alla routes måste inte finnas för alla resurser. Om du inte behöver en lista på alla användare, bygg inte `GET /users`. Du kan också sköta skapandet av användare i din `seeder`-fil i början för att spara tid.

| Namn (Action) | Verb | Route (i app.rb) | HTML (vy) | Beskrivning |
| :--- | :--- | :--- | :--- | :--- |
| **Index** | GET | `/users` | `/users/index.erb` | Visar en lista med alla användare. |
| **New** | GET | `/users/new` | `/users/new.erb` | Visar formuläret för att registrera en ny användare. |
| **Create** | POST | `/users` | - | Sparar den nya användaren i databasen. |
| **Show** | GET | `/users/:id` | `/users/show.erb` | Visar profilsidan för en specifik användare. |
| **Edit** | GET | `/users/:id/edit` | `/users/edit.erb` | Visar formuläret för att t.ex. byta lösenord. |
| **Update** | POST | `/users/:id/update` | - | Sparar ändringar på användaren. |
| **Destroy** | POST | `/users/:id/delete` | - | Tar bort en användare. |

## Inloggning: RESTful routes
En **Session** ses som en resurs som skapas när användaren loggar in och förstörs när användaren loggar ut. För inloggning används oftast bara följande routes:

För inloggning går man oftast ifrån RESTful standarden för att öka tydligheten och använder följande routes. 

| Namn | Verb | Route | HTML | Beskrivning |
| :--- | :--- | :--- | :--- | :--- |
| **New** | GET | `/login` | `/login.erb` | Visar formuläret för inloggning. |
| **Create** | POST | `/login` | - | Jämför info med DB och sätter `session[:user_id]`. |
| **Destroy** | POST | `/logout` | - | Loggar ut användaren. |
| **Access Denied**| GET | `/access_denied` | `/access_denied.erb` | Visas vid fel lösenord eller saknad behörighet. |

## Installation

1. `bundle install` | Installerar de biblotek (tex. SQLite) du behöver
2. `rake` | Startar appen. Finns det ingen databas skapas en ny i `db/sqlite.db`
3. `ctrl + c` | Stänger webbservern
4. `rake seed` | Återställer databasen från seed-filen
5. `rake kill` | Stänger av alla Ruby om du t.ex. har problem att få igång webbservern med felmeddelande ungefär som `Address already in use - bind(2) for 0.0.0.0:9292` 

Använd verktyget `DB Browser for SQLite` för att titta på, arbeta fram och testa SQL-kod.
