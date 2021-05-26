Æ
KC:\Fac\SysopSquadEvaluations\Evaluations\Application\DependencyInjection.cs
	namespace 	
Application
 
{ 
public 

static 
class 
DependencyInjection +
{		 
public

 
static

 
void

 
AddApplication

 )
(

) *
this

* .
IServiceCollection

/ A
services

B J
)

J K
{ 	
services 
. 

AddMediatR 
(  
Assembly  (
.( ) 
GetExecutingAssembly) =
(= >
)> ?
)? @
;@ A
services 
. 
AddAutoMapper "
(" #
	AppDomain# ,
., -
CurrentDomain- :
.: ;
GetAssemblies; H
(H I
)I J
)J K
;K L
} 	
} 
} ¯
åC:\Fac\SysopSquadEvaluations\Evaluations\Application\Features\EvaluationFeatures\Commands\CreateEvaluationCommand\CreateEvaluationCommand.cs
	namespace		 	
Application		
 
.		 
Features		 
.		 
EvaluationFeatures		 1
.		1 2
Commands		2 :
.		: ;#
CreateEvaluationCommand		; R
{

 
public 

class #
CreateEvaluationCommand (
:) *
CommandModelHelper+ =
,= >
IRequest? G
<G H

EvaluationH R
>R S
{ 
} 
} Ω
ìC:\Fac\SysopSquadEvaluations\Evaluations\Application\Features\EvaluationFeatures\Commands\CreateEvaluationCommand\CreateEvaluationCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
EvaluationFeatures 1
.1 2
Commands2 :
.: ;#
CreateEvaluationCommand; R
{		 
public

 

class

 *
CreateEvaluationCommandHandler

 /
:

0 1
IRequestHandler

2 A
<

A B#
CreateEvaluationCommand

B Y
,

Y Z

Evaluation

[ e
>

e f
{ 
private 
readonly !
IEvaluationRepository .
_repository/ :
;: ;
private 
readonly 
IMapper  
_mapper! (
;( )
public *
CreateEvaluationCommandHandler -
(- .!
IEvaluationRepository. C

repositoryD N
,N O
IMapperP W
mapperX ^
)^ _
{ 	
_repository 
= 

repository $
;$ %
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 

Evaluation $
>$ %
Handle& ,
(, -#
CreateEvaluationCommand- D
requestE L
,L M
CancellationTokenN _
cancellationToken` q
)q r
{ 	
var 
user 
= 
_mapper 
. 
Map "
<" #

Evaluation# -
>- .
(. /
request/ 6
)6 7
;7 8
return 
await 
_repository $
.$ %
CreateAsync% 0
(0 1
user1 5
)5 6
;6 7
} 	
} 
} ‘
îC:\Fac\SysopSquadEvaluations\Evaluations\Application\Features\EvaluationFeatures\Commands\DeleteEvaluationByIdCommand\DeleteEvaluationByIdCommand.cs
	namespace 	
Application
 
. 
Features 
. 
EvaluationFeatures 1
.1 2
Commands2 :
.: ;'
DeleteEvaluationByIdCommand; V
{ 
public 

class '
DeleteEvaluationByIdCommand ,
:- .
IRequest. 6
<6 7
bool7 ;
>; <
{ 
[		 	
BsonId			 
]		 
[

 	
BsonRepresentation

	 
(

 
BsonType

 $
.

$ %
ObjectId

% -
)

- .
]

. /
public 
readonly 
string 
Id !
;! "
public '
DeleteEvaluationByIdCommand *
(* +
string+ 1
id2 4
)4 5
{ 	
Id 
= 
id 
; 
} 	
} 
} ≠
õC:\Fac\SysopSquadEvaluations\Evaluations\Application\Features\EvaluationFeatures\Commands\DeleteEvaluationByIdCommand\DeleteEvaluationByIdCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
EvaluationFeatures 1
.1 2
Commands2 :
.: ;'
DeleteEvaluationByIdCommand; V
{ 
public 

class .
"DeleteEvaluationByIdCommandHandler 3
:4 5
IRequestHandler6 E
<E F'
DeleteEvaluationByIdCommandF a
,a b
boolc g
>g h
{ 
private		 
readonly		 !
IEvaluationRepository		 .
_repository		/ :
;		: ;
public .
"DeleteEvaluationByIdCommandHandler 1
(1 2!
IEvaluationRepository2 G

repositoryH R
)R S
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
bool 
> 
Handle  &
(& ''
DeleteEvaluationByIdCommand' B
requestC J
,J K
CancellationTokenL ]
cancellationToken^ o
)o p
{ 	
return 
await 
_repository $
.$ %
DeleteAsync% 0
(0 1
request1 8
.8 9
Id9 ;
); <
;< =
} 	
} 
} È
îC:\Fac\SysopSquadEvaluations\Evaluations\Application\Features\EvaluationFeatures\Commands\UpdateEvaluationByIdCommand\UpdateEvaluationByIdCommand.cs
	namespace 	
Application
 
. 
Features 
. 
EvaluationFeatures 1
.1 2
Commands2 :
.: ;'
UpdateEvaluationByIdCommand; V
{		 
public

 

class

 '
UpdateEvaluationByIdCommand

 ,
:

- .
CommandModelHelper

/ A
,

A B
IRequest

C K
<

K L

Evaluation

L V
>

V W
{ 
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
[ 	
Required	 
] 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
} 
} ª
õC:\Fac\SysopSquadEvaluations\Evaluations\Application\Features\EvaluationFeatures\Commands\UpdateEvaluationByIdCommand\UpdateEvaluationByIdCommandHandler.cs
	namespace		 	
Application		
 
.		 
Features		 
.		 
EvaluationFeatures		 1
.		1 2
Commands		2 :
.		: ;'
UpdateEvaluationByIdCommand		; V
{

 
public 

class .
"UpdateEvaluationByIdCommandHandler 3
:4 5
IRequestHandler6 E
<E F'
UpdateEvaluationByIdCommandF a
,a b

Evaluationc m
>m n
{ 
private 
readonly !
IEvaluationRepository .
_repository/ :
;: ;
private 
readonly 
IMapper  
_mapper! (
;( )
public .
"UpdateEvaluationByIdCommandHandler 1
(1 2!
IEvaluationRepository2 G

repositoryH R
,R S
IMapperT [
mapper\ b
)b c
{ 	
_repository 
= 

repository $
;$ %
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 

Evaluation $
>$ %
Handle& ,
(, -'
UpdateEvaluationByIdCommand- H
requestI P
,P Q
CancellationTokenR c
cancellationTokend u
)u v
{ 	
var 

evaluation 
= 
_mapper $
.$ %
Map% (
<( )

Evaluation) 3
>3 4
(4 5
request5 <
)< =
;= >
var 
evaluationUpdate  
=! "
await# (
_repository) 4
.4 5
UpdateAsync5 @
(@ A

evaluationA K
)K L
;L M
if 
( 
evaluationUpdate  
==! #
null$ (
)( )
{ 
throw 
new 
ArgumentException +
(+ ,
$str, r
,r s
nameoft z
(z {
request	{ Ç
)
Ç É
)
É Ñ
;
Ñ Ö
} 
return 
evaluationUpdate #
;# $
} 	
} 
}   ˙
âC:\Fac\SysopSquadEvaluations\Evaluations\Application\Features\EvaluationFeatures\Queries\GetAllEvaluationsQuery\GetAllEvaluationsQuery.cs
	namespace 	
Application
 
. 
Features 
. 
EvaluationFeatures 1
.1 2
Queries2 9
.9 :"
GetAllEvaluationsQuery: P
{ 
public 

class "
GetAllEvaluationsQuery '
:( )
IRequest* 2
<2 3
IEnumerable3 >
<> ?

Evaluation? I
>I J
>J K
{ 
}		 
} Œ
êC:\Fac\SysopSquadEvaluations\Evaluations\Application\Features\EvaluationFeatures\Queries\GetAllEvaluationsQuery\GetAllEvaluationsQueryHandler.cs
	namespace 	
Application
 
. 
Features 
. 
EvaluationFeatures 1
.1 2
Queries2 9
.9 :"
GetAllEvaluationsQuery: P
{		 
public

 

class

 )
GetAllEvaluationsQueryHandler

 .
:

/ 0
IRequestHandler

1 @
<

@ A"
GetAllEvaluationsQuery

A W
,

W X
IEnumerable

Y d
<

d e

Evaluation

e o
>

o p
>

p q
{ 
private 
readonly !
IEvaluationRepository .
_repository/ :
;: ;
public )
GetAllEvaluationsQueryHandler ,
(, -!
IEvaluationRepository- B

repositoryC M
)M N
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
IEnumerable %
<% &

Evaluation& 0
>0 1
>1 2
Handle3 9
(9 :"
GetAllEvaluationsQuery: P
requestQ X
,X Y
CancellationTokenZ k
cancellationTokenl }
)} ~
{ 	
return 
await 
_repository $
.$ %
GetAllAsync% 0
(0 1
)1 2
;2 3
} 	
} 
} Ò
üC:\Fac\SysopSquadEvaluations\Evaluations\Application\Features\EvaluationFeatures\Queries\GetAverageScorByIdConsultantQuery\GetAverageScorByIdConsultantQuery.cs
	namespace 	
Application
 
. 
Features 
. 
EvaluationFeatures 1
.1 2
Queries2 9
.9 :-
!GetAverageScorByIdConsultantQuery: [
{ 
public 

class -
!GetAverageScorByIdConsultantQuery 2
:3 4
IRequest5 =
<= >
float> C
>C D
{ 
[		 	
BsonId			 
]		 
[

 	
BsonRepresentation

	 
(

 
BsonType

 $
.

$ %
ObjectId

% -
)

- .
]

. /
public 
readonly 
string 
Id !
;! "
public -
!GetAverageScorByIdConsultantQuery 0
(0 1
string1 7
id8 :
): ;
{ 	
Id 
= 
id 
; 
} 	
} 
} ì
¶C:\Fac\SysopSquadEvaluations\Evaluations\Application\Features\EvaluationFeatures\Queries\GetAverageScorByIdConsultantQuery\GetAverageScorByIdConsultantQueryHandler.cs
	namespace 	
Application
 
. 
Features 
. 
EvaluationFeatures 1
.1 2
Queries2 9
.9 :-
!GetAverageScorByIdConsultantQuery: [
{ 
public		 

class		 4
(GetAverageScorByIdConsultantQueryHandler		 9
:		9 :
IRequestHandler		: I
<		I J-
!GetAverageScorByIdConsultantQuery		J k
,		k l
float		m r
>		r s
{

 
private 
readonly !
IEvaluationRepository .
_repository/ :
;: ;
public 4
(GetAverageScorByIdConsultantQueryHandler 7
(7 8!
IEvaluationRepository8 M

repositoryN X
)X Y
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
float 
>  
Handle! '
(' (-
!GetAverageScorByIdConsultantQuery( I
requestJ Q
,Q R
CancellationTokenS d
cancellationTokene v
)v w
{ 	
var 
evaluationAverage !
=" #
await$ )
_repository* 5
.5 6
GetAverageScorAsync6 I
(I J
requestJ Q
.Q R
IdR T
)T U
;U V
if 
( 
evaluationAverage !
==" $
$num% &
)& '
throw 
new 
ArgumentException +
(+ ,
$str, [
,[ \
nameof] c
(c d
requestd k
)k l
)l m
;m n
return 
evaluationAverage $
;$ %
} 	
} 
} ø
âC:\Fac\SysopSquadEvaluations\Evaluations\Application\Features\EvaluationFeatures\Queries\GetEvaluationByIdQuery\GetEvaluationByIdQuery.cs
	namespace 	
Application
 
. 
Features 
. 
EvaluationFeatures 1
.1 2
Queries2 9
.9 :"
GetEvaluationByIdQuery: P
{ 
public 

class "
GetEvaluationByIdQuery '
:( )
IRequest* 2
<2 3

Evaluation3 =
>= >
{		 
[

 	
BsonId

	 
]

 
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
public 
readonly 
string 
Id !
;! "
public "
GetEvaluationByIdQuery %
(% &
string& ,
id- /
)/ 0
{ 	
Id 
= 
id 
; 
} 	
} 
} ¥
êC:\Fac\SysopSquadEvaluations\Evaluations\Application\Features\EvaluationFeatures\Queries\GetEvaluationByIdQuery\GetEvaluationByIdQueryHandler.cs
	namespace 	
Application
 
. 
Features 
. 
EvaluationFeatures 1
.1 2
Queries2 9
.9 :"
GetEvaluationByIdQuery: P
{		 
public

 

class

 )
GetEvaluationByIdQueryHandler

 .
:

/ 0
IRequestHandler

1 @
<

@ A"
GetEvaluationByIdQuery

A W
,

W X

Evaluation

Y c
>

c d
{ 
private 
readonly !
IEvaluationRepository .
_repository/ :
;: ;
public )
GetEvaluationByIdQueryHandler ,
(, -!
IEvaluationRepository- B

repositoryC M
)M N
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 

Evaluation $
>$ %
Handle& ,
(, -"
GetEvaluationByIdQuery- C
requestD K
,K L
CancellationTokenM ^
cancellationToken_ p
)p q
{ 	
var 

evaluation 
= 
await "
_repository# .
.. /
GetByIdAsync/ ;
(; <
request< C
.C D
IdD F
)F G
;G H
if 
( 

evaluation 
== 
null "
)" #
throw 
new 
ArgumentException +
(+ ,
$str, C
,C D
nameofE K
(K L
requestL S
)S T
)T U
;U V
return 

evaluation 
; 
} 	
} 
} ñ
QC:\Fac\SysopSquadEvaluations\Evaluations\Application\Helpers\AutoMapperProfile.cs
	namespace 	
Application
 
. 
Helpers 
{ 
public 

class 
AutoMapperProfile "
:" #
Profile# *
{		 
public

 
AutoMapperProfile

  
(

  !
)

! "
{ 	
	CreateMap 
< '
UpdateEvaluationByIdCommand 1
,1 2

Evaluation3 =
>= >
(> ?
)? @
;@ A
	CreateMap 
< #
CreateEvaluationCommand -
,- .

Evaluation/ 9
>9 :
(: ;
); <
;< =
} 	
} 
} æ	
RC:\Fac\SysopSquadEvaluations\Evaluations\Application\Helpers\CommandModelHelper.cs
	namespace 	
Application
 
. 
Helpers 
{ 
public 

class 
CommandModelHelper #
{ 
[		 	
Required			 
]		 
public

 
int

 
Scor

 
{

 
get

 
;

 
set

 "
;

" #
}

$ %
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
[ 	
Required	 
] 
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
[ 	
Required	 
] 
public 
string 
ConsultantId "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} Ä
XC:\Fac\SysopSquadEvaluations\Evaluations\Application\Interfaces\IApplicationDbContext.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface !
IApplicationDbContext *
{ 
MongoClient 
Client 
{ 
get 
;  
set! $
;$ %
}% &
IMongoCollection 
< 
T 
> 
GetCollection )
<) *
T* +
>+ ,
(, -
)- .
;. /
}		 
}

 ›
^C:\Fac\SysopSquadEvaluations\Evaluations\Application\Interfaces\IEvaluationDatabaseSettings.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface '
IEvaluationDatabaseSettings 0
{ 
string 
ConnectionString 
{  !
get" %
;% &
set' *
;* +
}, -
string 
DatabaseName 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ì
XC:\Fac\SysopSquadEvaluations\Evaluations\Application\Interfaces\IEvaluationRepository.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface !
IEvaluationRepository *
:+ ,
IRepository- 8
<8 9

Evaluation9 C
>C D
{ 
} 
}		 ﬁ
NC:\Fac\SysopSquadEvaluations\Evaluations\Application\Interfaces\IRepository.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface 
IRepository  
<  !
TEntity! (
>( )
where* /
TEntity0 7
:8 9

BaseEntity: D
{ 
Task		 
<		 
IEnumerable		 
<		 
TEntity		  
>		  !
>		! "
GetAllAsync		# .
(		. /
)		/ 0
;		0 1
Task

 
<

 
TEntity

 
>

 
GetByIdAsync

 "
(

" #
string

# )
id

* ,
)

, -
;

- .
Task 
< 
TEntity 
> 
CreateAsync !
(! "
TEntity" )
entity* 0
)0 1
;1 2
Task 
< 
TEntity 
> 
UpdateAsync !
(! "
TEntity" )
entity* 0
)0 1
;1 2
Task 
< 
bool 
> 
DeleteAsync 
( 
string %
id& (
)( )
;) *
Task 
< 
float 
> 
GetAverageScorAsync '
(' (
string( .
id/ 1
)1 2
;2 3
} 
} 