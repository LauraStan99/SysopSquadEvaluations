∏
TC:\Fac\SysopSquadEvaluations\Evaluations\Persistence\Context\ApplicationDbContext.cs
	namespace 	
Persistence
 
. 
Context 
{ 
public 

class  
ApplicationDbContext %
:& '!
IApplicationDbContext( =
{ 
private 
readonly 
IMongoDatabase '
	_database( 1
;1 2
public

 
MongoClient

 
Client

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public  
ApplicationDbContext #
(# $'
IEvaluationDatabaseSettings$ ?
settings@ H
)H I
{ 	
Client 
= 
new 
MongoClient $
($ %
settings% -
.- .
ConnectionString. >
)> ?
;? @
	_database 
= 
Client 
. 
GetDatabase *
(* +
settings+ 3
.3 4
DatabaseName4 @
)@ A
;A B
} 	
public 
IMongoCollection 
<  
T  !
>! "
GetCollection# 0
<0 1
T1 2
>2 3
(3 4
)4 5
{ 	
return 
	_database 
. 
GetCollection *
<* +
T+ ,
>, -
(- .
typeof. 4
(4 5
T5 6
)6 7
.7 8
Name8 <
+= >
$str? B
)B C
;C D
} 	
} 
} ±
ZC:\Fac\SysopSquadEvaluations\Evaluations\Persistence\Context\EvaluationDatabaseSettings.cs
	namespace 	
Persistence
 
. 
Context 
{ 
public 

class &
EvaluationDatabaseSettings +
:, -'
IEvaluationDatabaseSettings. I
{ 
public 
string 
ConnectionString &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
DatabaseName "
{# $
get% (
;( )
set* -
;- .
}/ 0
}		 
}

 ª
KC:\Fac\SysopSquadEvaluations\Evaluations\Persistence\DependencyInjection.cs
	namespace 	
Persistence
 
{		 
public

 

static

 
class

 
DependencyInjection

 +
{ 
public 
static 
void 
AddPersistence )
() *
this* .
IServiceCollection/ A
servicesB J
,J K
IConfigurationL Z
configuration[ h
)h i
{ 	
services 
. 
	Configure 
< &
EvaluationDatabaseSettings 9
>9 :
(: ;
configuration; H
.H I

GetSectionI S
(S T
$strT p
)p q
)q r
;r s
services 
. 
AddSingleton !
<! "'
IEvaluationDatabaseSettings" =
>= >
(> ?
sp? A
=>B D
sp 
. 
GetRequiredService %
<% &
IOptions& .
<. /&
EvaluationDatabaseSettings/ I
>I J
>J K
(K L
)L M
.M N
ValueN S
)S T
;T U
services 
. 
	AddScoped 
< !
IApplicationDbContext 4
,4 5 
ApplicationDbContext6 J
>J K
(K L
)L M
;M N
services 
. 
	AddScoped 
< !
IEvaluationRepository 4
,4 5 
EvaluationRepository6 J
>J K
(K L
)L M
;M N
var 
mongoCon 
= 
configuration (
.( )

GetSection) 3
(3 4
$str4 P
)P Q
[Q R
$strR d
]d e
;e f
services 
. 
AddSingleton !
<! "
IMongoClient" .
>. /
(/ 0
new0 3
MongoClient4 ?
(? @
mongoCon@ H
)H I
)I J
;J K
} 	
} 
} ‹
ZC:\Fac\SysopSquadEvaluations\Evaluations\Persistence\Repository\v1\EvaluationRepository.cs
	namespace 	
Persistence
 
. 

Repository  
.  !
v1! #
{ 
public 

class  
EvaluationRepository %
:& '

Repository' 1
<1 2

Evaluation2 <
>< =
,= >!
IEvaluationRepository? T
{ 
public		  
EvaluationRepository		 #
(		# $!
IApplicationDbContext		$ 9
context		: A
)		A B
:		C D
base		E I
(		I J
context		J Q
)		Q R
{

 	
} 	
} 
} ËC
PC:\Fac\SysopSquadEvaluations\Evaluations\Persistence\Repository\v1\Repository.cs
	namespace		 	
Persistence		
 
.		 

Repository		  
.		  !
v1		! #
{

 
public 

class 

Repository 
< 
TEntity #
># $
:% &
IRepository' 2
<2 3
TEntity3 :
>: ;
where< A
TEntityB I
:J K

BaseEntityL V
{ 
private 
readonly !
IApplicationDbContext .
_context/ 7
;7 8
public 

Repository 
( !
IApplicationDbContext /
context0 7
)7 8
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
TEntity& -
>- .
>. /
GetAllAsync0 ;
(; <
)< =
{ 	
try 
{ 
return 
await 
_context %
.% &
GetCollection& 3
<3 4
TEntity4 ;
>; <
(< =
)= >
.> ?
	FindAsync? H
(H I
entityI O
=>P R
trueS W
)W X
.X Y
ResultY _
._ `
ToListAsync` k
(k l
)l m
;m n
} 
catch 
( 
	Exception 
ex 
)  
{ 
throw 
new 
ArgumentException +
(+ ,
$", .#
Couldn't get entities: . E
{E F
exF H
.H I
MessageI P
}P Q
"Q R
)R S
;S T
} 
} 	
public   
async   
Task   
<   
TEntity   !
>  ! "
GetByIdAsync  # /
(  / 0
string  0 6
id  7 9
)  9 :
{!! 	
return## 
await## 
_context## !
.##! "
GetCollection##" /
<##/ 0
TEntity##0 7
>##7 8
(##8 9
)##9 :
.##: ;
Find##; ?
<##? @
TEntity##@ G
>##G H
(##H I
entity##I O
=>##P R
entity##S Y
.##Y Z
Id##Z \
==##] _
id##` b
)##b c
.##c d
FirstOrDefaultAsync##d w
(##w x
)##x y
;##y z
}$$ 	
public'' 
async'' 
Task'' 
<'' 
TEntity'' !
>''! "
CreateAsync''# .
(''. /
TEntity''/ 6
entity''7 =
)''= >
{(( 	
await** 
_context** 
.** 
GetCollection** (
<**( )
TEntity**) 0
>**0 1
(**1 2
)**2 3
.**3 4
InsertOneAsync**4 B
(**B C
entity**C I
)**I J
;**J K
return++ 
entity++ 
;++ 
},, 	
public.. 
async.. 
Task.. 
<.. 
TEntity.. !
>..! "
UpdateAsync..# .
(... /
TEntity../ 6
entity..7 =
)..= >
{// 	
var00 
foundEntity00 
=00 
await00 #+
GetByIdUserAndIdConsultantAsync00$ C
(00C D
entity00D J
.00J K
UserId00K Q
,00Q R
entity00R X
.00X Y
ConsultantId00Y e
)00e f
;00f g
if11 
(11 
foundEntity11 
==11 
null11 #
)11# $
{22 
return33 
null33 
;33 
}44 
foundEntity55 
.55 
Scor55 
=55 
entity55 %
.55% &
Scor55& *
;55* +
await66 
_context66 
.66 
GetCollection66 (
<66( )
TEntity66) 0
>660 1
(661 2
)662 3
.663 4
ReplaceOneAsync664 C
(66C D
filter66D J
:66J K

evaluation66L V
=>66W Y

evaluation66Z d
.66d e
Id66e g
==66h j
foundEntity66k v
.66v w
Id66w y
,66y z
replacement	66{ Ü
:
66Ü á
foundEntity
66à ì
)
66ì î
;
66î ï
return77 
foundEntity77 
;77 
}88 	
public:: 
async:: 
Task:: 
<:: 
bool:: 
>:: 
DeleteAsync::  +
(::+ ,
string::, 2
id::3 5
)::5 6
{;; 	
var<< 
deleteResult<< 
=<< 
await<< $
_context<<% -
.<<- .
GetCollection<<. ;
<<<; <
TEntity<<< C
><<C D
(<<D E
)<<E F
.<<F G
DeleteOneAsync<<G U
(<<U V
user<<V Z
=><<[ ]
user<<^ b
.<<b c
Id<<c e
==<<f h
id<<i k
)<<k l
;<<l m
return>> 
deleteResult>> 
.>>  
IsAcknowledged>>  .
&&>>/ 1
deleteResult>>2 >
.>>> ?
DeletedCount>>? K
>>>L M
$num>>N O
;>>O P
}?? 	
publicAA 
asyncAA 
TaskAA 
<AA 
TEntityAA !
>AA! "+
GetByIdUserAndIdConsultantAsyncAA# B
(AAB C
stringAAC I
userIdAAJ P
,AAP Q
stringAAQ W
consultantIdAAX d
)AAd e
{BB 	
ifCC 
(CC 
stringCC 
.CC 
IsNullOrEmptyCC $
(CC$ %
userIdCC% +
)CC+ ,
||CC- /
stringCC0 6
.CC6 7
IsNullOrEmptyCC7 D
(CCD E
consultantIdCCE Q
)CCQ R
)CCR S
returnDD 
nullDD 
;DD 
varEE 

evaluationEE 
=EE 
awaitEE "
_contextEE# +
.EE+ ,
GetCollectionEE, 9
<EE9 :
TEntityEE: A
>EEA B
(EEB C
)EEC D
.EED E
FindEEE I
<EEI J
TEntityEEJ Q
>EEQ R
(EER S
entityEES Y
=>EEZ \
entityEE] c
.EEc d
UserIdEEd j
==EEk m
userIdEEn t
&&EEu w
entityEEx ~
.EE~ 
ConsultantId	EE ã
==
EEå é
consultantId
EEè õ
)
EEõ ú
.
EEú ù!
FirstOrDefaultAsync
EEù ∞
(
EE∞ ±
)
EE± ≤
;
EE≤ ≥
ifGG 
(GG 

evaluationGG 
==GG 
nullGG "
)GG" #
{HH 
returnII 
nullII 
;II 
}JJ 
returnKK 

evaluationKK 
;KK 
}LL 	
publicNN 
asyncNN 
TaskNN 
<NN 
floatNN 
>NN  
GetAverageScorAsyncNN! 4
(NN4 5
stringNN5 ;
idNN< >
)NN> ?
{OO 	
varPP 
listEvaluationsPP 
=PP  
awaitPP! &
_contextPP' /
.PP/ 0
GetCollectionPP0 =
<PP= >
TEntityPP> E
>PPE F
(PPF G
)PPG H
.PPH I
	FindAsyncPPI R
(PPR S
entityPPS Y
=>PPZ \
entityPP] c
.PPc d
ConsultantIdPPd p
==PPq s
idPPt v
)PPw x
.PPx y
ResultPPy 
.	PP Ä
ToListAsync
PPÄ ã
(
PPã å
)
PPå ç
;
PPç é
ifQQ 
(QQ 
listEvaluationsQQ 
==QQ  "
nullQQ# '
)QQ' (
returnQQ) /
$numQQ0 1
;QQ1 2
varRR 
sumRR 
=RR 
$numRR 
;RR 
foreachSS 
(SS 
varSS 

evaluationSS "
inSS# %
listEvaluationsSS& 5
)SS5 6
{TT 
sumUU 
+=UU 

evaluationUU !
.UU! "
ScorUU" &
;UU& '
}VV 
returnXX 
(XX 
sumXX 
/XX 
listEvaluationsXX *
.XX* +
CountXX+ 0
)XX0 1
;XX1 2
}YY 	
}ZZ 
}[[ 