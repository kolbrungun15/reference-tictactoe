1. Jenkins URL and username and password.
	* http://82.221.49.176:8080/ 
	* username: kollagunn
	* password: Hamar117


2. Game URL (AWS)
	http://35.164.247.194/   ... einhverra hluta vegna hef ég ekki náð að skoða leikinn þar, bara locally með docker-compose :( 


## Scripts

Outline what script files you created and the purpose of each file. Each file should be commented. This could be

- Docker-run.sh

- Docker-compose.yml

- deployscript.sh

- bashscript.sh

- runserver.sh


## Testing & logic

Outline what tests you created.

- UnitTests, server logic TDD (Git commit log)
* 'should emit game created event'
* 'join game command'
* 'should emit game joined event'
* 'place a move command'
* 'should mark grid[0,0] with X, MovePlaced'
* 'should mark grid[1,1] with X, MovePlaced'
* 'should mark grid[2,2] with X, MovePlaced'
* 'should emit IllegalMove when square occupied'
* 'should emit NotYourMove if player tries 2 moves in a row'
* 'should emit gameWin on ***'
* 'should NOT emit gameDraw if last move was win'
* 'should emit gameDraw if neither wins'

- Is the game playable?


## Data migration

Did you create a data migration.

- Migration up and down
* Ekki viss ... 


## Jenkins

Do you have the following Jobs and what happens in each Job:

- Commit Stage
* Yes, it's calle CD_tictactoe

- Acceptance Stage
* No

- Capacity Stage
* No

- Other
* No


Did you use any of the following features in Jenkins?

- Schedule or commit hooks

- Pipeline

- Jenkins file

- Test reports

- Other
* Nei


## Monitoring

Did you do any monitoring?

- URL to monitoring tool. Must be open or include username and pass.
* Nei

## Other

Anything else you did to improve you deployment pipeline of the project itself?
* Nei í rauninni ekki, ḱomst ekkert lengra en unit testin. Var í miklum vandræðum í byrjun verkefnisinns og eitthvað frameftir. Vona bara að vinnan sem ég lagði í þetta skili sér í einkunnina því þó svo ég hafi ekki ná að klára allt sem lagt var fyrir lagði ég rosalega mikla vinnu í verkefnið. Meira en ég hef nokkurntímann gert.