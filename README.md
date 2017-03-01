# projekt
Målbetyg: A

## Funktionsbeskrivning
En webapp för display av drinkar som ska kunna användas i baren, typ på pub.
Användaren sparar drinkar och ingredienser till drinkar genom ett webgränssnitt. Därefter kan ett “event” skapas (typ onsdagspub) vilket man lägger till vad man har i lager för just det eventet. Till varje event hör en splashsida som visar drinkar på display som är möjliga att beställa. Denna skulle exempelvis kunna visas på META-TV. Via tillhörande app kan man skapa nya event och lägga in vad man har i lager snabbt. 

Webgränssnittet byggs i AngularJS med en backend i Node och Express. Appen skrivs native antingen till Android eller iOS.

Vi tillhandahåller ett REST-API och sköter uppdateringar för splashen och inläggning av lager i appen med websockets (socket.io).

## API-skiss
```
GET   /events
GET   /event/:eventID
GET   /spirits
GET   /spirit/:spiritID
GET   /miscs
GET   /misc/:miscID
GET   /drinks
GET   /drink/:drinkID
GET   /drinks/:eventID
GET   /inventory/:eventID

POST  /login
POST  /createAccount
POST  /addDrink
POST  /newEvent
POST  /addUserToEvent/:eventID
POST  /removeUserFromEvent/:eventID
POST  /addToInventory/:eventID
POST  /removeFromInventory/:eventID
```

## Databas
* Spritsorter
  * id / namn / beskrivning / alhokolhalt / värde
* Övriga ingredienser
  * id / namn / beskrivning / typ
* Drinkar
  * id / namn / beskrivning / [{sprit: id, mängd: cl}]
* Användare
  * id / namn / mail / lösenord
* Event-accesser
  * användar-id / event-id / admin
* Event
  * id / date-start / date-end / plats / 
* Sprit inventarie
  * id / event-id / sprit-id
* Övrig inventarie
  * id / event-id / ingred-id
