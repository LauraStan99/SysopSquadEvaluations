ß
PC:\Fac\SysopSquadEvaluations\Evaluations\WebAPI\Controllers\BaseApiController.cs
	namespace 	
WebAPI
 
. 
Controllers 
. 
v1 
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
public		 

class		 
BaseApiController		 "
:		# $
ControllerBase		% 3
{

 
	protected 
	IMediator 
Mediator $
;$ %
public 
BaseApiController  
(  !
	IMediator! *
mediator+ 3
)3 4
{ 	
this 
. 
Mediator 
= 
mediator $
;$ %
} 	
} 
} Î;
WC:\Fac\SysopSquadEvaluations\Evaluations\WebAPI\Controllers\v1\EvaluationsController.cs
	namespace 	
WebAPI
 
. 
Controllers 
. 
v1 
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
public 

class !
EvaluationsController &
:& '
BaseApiController' 8
{ 
public !
EvaluationsController $
($ %
	IMediator% .
mediator/ 7
)7 8
:9 :
base; ?
(? @
mediator@ H
)H I
{ 	
} 	
[ 	
HttpGet	 
] 
[ 	 
ProducesResponseType	 
( 
StatusCodes )
.) *
Status200OK* 5
)5 6
]6 7
public 
async 
Task 
< 
IActionResult '
>' (
GetAll) /
(/ 0
)0 1
{ 	
return 
Ok 
( 
await 
Mediator $
.$ %
Send% )
() *
new* -"
GetAllEvaluationsQuery. D
(D E
)E F
)F G
)G H
;H I
} 	
[ 	
HttpGet	 
( 
$str "
)" #
]# $
[ 	 
ProducesResponseType	 
( 
StatusCodes )
.) *
Status200OK* 5
)5 6
]6 7
public 
async 
Task 
< 
IActionResult '
>' (
GetById) 0
(0 1
string1 7
id8 :
): ;
{ 	
try   
{!! 
return"" 
Ok"" 
("" 
await"" 
Mediator""  (
.""( )
Send"") -
(""- .
new"". 1"
GetEvaluationByIdQuery""2 H
(""H I
id""I K
)""K L
)""L M
)""M N
;""N O
}## 
catch$$ 
($$ 
	Exception$$ 
ex$$ 
)$$  
{%% 
return&& 

BadRequest&& !
(&&! "
new&&" %
{&&& '
error&&( -
=&&. /
ex&&0 2
.&&2 3
Message&&3 :
}&&; <
)&&< =
;&&= >
}'' 
}(( 	
[)) 	
HttpGet))	 
()) 
$str)) *
)))* +
]))+ ,
[** 	 
ProducesResponseType**	 
(** 
StatusCodes** )
.**) *
Status200OK*** 5
)**5 6
]**6 7
public++ 
async++ 
Task++ 
<++ 
IActionResult++ '
>++' (
GetAverageScorById++) ;
(++; <
string++< B
id++C E
)++E F
{,, 	
try-- 
{.. 
return// 
Ok// 
(// 
await// 
Mediator//  (
.//( )
Send//) -
(//- .
new//. 1-
!GetAverageScorByIdConsultantQuery//2 S
(//S T
id//T V
)//V W
)//W X
)//X Y
;//Y Z
}00 
catch11 
(11 
	Exception11 
ex11 
)11  
{22 
return33 

BadRequest33 !
(33! "
new33" %
{33& '
error33( -
=33. /
ex330 2
.332 3
Message333 :
}33; <
)33< =
;33= >
}44 
}66 	
[88 	
HttpPost88	 
(88 
$str88 
)88 
]88 
[99 	 
ProducesResponseType99	 
(99 
StatusCodes99 )
.99) *
Status200OK99* 5
)995 6
]996 7
[:: 	 
ProducesResponseType::	 
(:: 
StatusCodes:: )
.::) *
Status400BadRequest::* =
)::= >
]::> ?
public;; 
async;; 
Task;; 
<;; 
IActionResult;; '
>;;' (
Create;;) /
(;;/ 0
[;;0 1
FromBody;;1 9
];;9 :#
CreateEvaluationCommand;;; R
command;;S Z
);;Z [
{<< 	
var== 

evaluation== 
=== 
await== "
Mediator==# +
.==+ ,
Send==, 0
(==0 1
command==1 8
)==8 9
;==9 :
if>> 
(>> 

evaluation>> 
==>> 
null>> "
)>>" #
return?? 

BadRequest?? !
(??! "
)??" #
;??# $
return@@ 
Ok@@ 
(@@ 
new@@ 
{AA 

evaluationBB 
.BB 
ScorBB 
,BB  

evaluationCC 
.CC 
UserIdCC !
,CC! "

evaluationDD 
.DD 
ConsultantIdDD '
}FF 
)FF 
;FF 
}GG 	
[II 	
HttpPutII	 
]II 
[JJ 	 
ProducesResponseTypeJJ	 
(JJ 
StatusCodesJJ )
.JJ) *
Status204NoContentJJ* <
)JJ< =
]JJ= >
[KK 	 
ProducesResponseTypeKK	 
(KK 
StatusCodesKK )
.KK) *
Status404NotFoundKK* ;
)KK; <
]KK< =
publicLL 
asyncLL 
TaskLL 
<LL 
IActionResultLL '
>LL' (
UpdateLL) /
(LL/ 0'
UpdateEvaluationByIdCommandLL0 K
commandLLL S
)LLS T
{MM 	
tryNN 
{OO 
awaitPP 
MediatorPP 
.PP 
SendPP #
(PP# $
commandPP$ +
)PP+ ,
;PP, -
returnQQ 
	NoContentQQ  
(QQ  !
)QQ! "
;QQ" #
}RR 
catchSS 
(SS 
	ExceptionSS 
exSS 
)SS  
{TT 
returnUU 

BadRequestUU !
(UU! "
newUU" %
{UU& '
errorUU( -
=UU. /
exUU0 2
.UU2 3
MessageUU3 :
}UU; <
)UU< =
;UU= >
}VV 
}WW 	
[YY 	

HttpDeleteYY	 
(YY 
$strYY %
)YY% &
]YY& '
[ZZ 	 
ProducesResponseTypeZZ	 
(ZZ 
StatusCodesZZ )
.ZZ) *
Status204NoContentZZ* <
)ZZ< =
]ZZ= >
[[[ 	 
ProducesResponseType[[	 
([[ 
StatusCodes[[ )
.[[) *
Status404NotFound[[* ;
)[[; <
][[< =
public\\ 
async\\ 
Task\\ 
<\\ 
IActionResult\\ '
>\\' (
Delete\\) /
(\\/ 0
string\\0 6
id\\7 9
)\\9 :
{]] 	
var^^ 
deleted^^ 
=^^ 
await^^ 
Mediator^^  (
.^^( )
Send^^) -
(^^- .
new^^. 1'
DeleteEvaluationByIdCommand^^2 M
(^^M N
id^^N P
)^^P Q
)^^Q R
;^^R S
if__ 
(__ 
deleted__ 
)__ 
return`` 
	NoContent``  
(``  !
)``! "
;``" #
returnaa 
NotFoundaa 
(aa 
)aa 
;aa 
}bb 	
}dd 
}ee ¢

:C:\Fac\SysopSquadEvaluations\Evaluations\WebAPI\Program.cs
	namespace 	
WebAPI
 
{ 
public 

static 
class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{		 	
CreateHostBuilder

 
(

 
args

 "
)

" #
.

# $
Build

$ )
(

) *
)

* +
.

+ ,
Run

, /
(

/ 0
)

0 1
;

1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ª4
:C:\Fac\SysopSquadEvaluations\Evaluations\WebAPI\Startup.cs
	namespace 	
WebAPI
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddApiVersioning %
(% &
config& ,
=>- /
{ 
config 
. 
DefaultApiVersion (
=) *
new+ .

ApiVersion/ 9
(9 :
$num: ;
,; <
$num= >
)> ?
;? @
config 
. /
#AssumeDefaultVersionWhenUnspecified :
=; <
true= A
;A B
config 
. 
ReportApiVersions (
=) *
true+ /
;/ 0
}   
)   
;   
services"" 
."" 
AddCors"" 
("" 
("" 
options"" %
)""% &
=>""' )
{## 
options$$ 
.$$ 
	AddPolicy$$ !
($$! "
$str$$" ,
,$$, -
builder$$. 5
=>$$6 8
builder$$9 @
.$$@ A
AllowAnyOrigin$$A O
($$O P
)$$P Q
.$$Q R
AllowAnyMethod$$R `
($$` a
)$$a b
.$$b c
AllowAnyHeader$$c q
($$q r
)$$r s
)$$s t
;$$t u
}%% 
)%% 
;%% 
services'' 
.'' 
AddMvc'' 
('' 
option'' "
=>''# %
option''& ,
.'', -!
EnableEndpointRouting''- B
=''C D
false''E J
)''J K
;''K L
services)) 
.)) 
AddApplication)) #
())# $
)))$ %
;))% &
services** 
.** 
AddPersistence** #
(**# $
Configuration**$ 1
)**1 2
;**2 3
services,, 
.,, 
AddControllers,, #
(,,# $
),,$ %
.-- 
AddFluentValidation-- )
(--) *
s--* +
=>--, .
{.. 
s// 
.// 4
(RegisterValidatorsFromAssemblyContaining// C
<//C D
Startup//D K
>//K L
(//L M
)//M N
;//N O
s00 
.00 @
4RunDefaultMvcValidationAfterFluentValidationExecutes00 O
=00P Q
false00R W
;00W X
}11 
)11 
;11 
services33 
.33 
AddSwaggerGen33 "
(33" #
c33# $
=>33% '
{44 
c55 
.55 

SwaggerDoc55 
(55 
$str55 !
,55! "
new55# &
OpenApiInfo55' 2
{553 4
Title555 :
=55; <
$str55= E
,55E F
Version55G N
=55O P
$str55Q U
}55V W
)55W X
;55X Y
c77 
.77 !
AddSecurityDefinition77 '
(77' (
$str77( 0
,770 1
new772 5!
OpenApiSecurityScheme776 K
{88 
Type99 
=99 
SecuritySchemeType99 -
.99- .
Http99. 2
,992 3
BearerFormat::  
=::! "
$str::# (
,::( )
In;; 
=;; 
ParameterLocation;; *
.;;* +
Header;;+ 1
,;;1 2
Scheme<< 
=<< 
$str<< %
,<<% &
Description== 
===  !
$str==" F
}>> 
)>> 
;>> 
c@@ 
.@@ "
AddSecurityRequirement@@ (
(@@( )
new@@) ,&
OpenApiSecurityRequirement@@- G
{AA 
{BB 
newCC !
OpenApiSecuritySchemeCC 1
{DD 
	ReferenceEE %
=EE& '
newEE( +
OpenApiReferenceEE, <
{FF 
TypeGG  $
=GG% &
ReferenceTypeGG' 4
.GG4 5
SecuritySchemeGG5 C
,GGC D
IdHH  "
=HH# $
$strHH% -
}II 
}JJ 
,JJ 
ArrayKK 
.KK 
EmptyKK #
<KK# $
stringKK$ *
>KK* +
(KK+ ,
)KK, -
}LL 
}MM 
)MM 
;MM 
}NN 
)NN 
;NN 
}OO 	
publicRR 
voidRR 
	ConfigureRR 
(RR 
IApplicationBuilderRR 1
appRR2 5
,RR5 6
IWebHostEnvironmentRR7 J
envRRK N
)RRN O
{SS 	
ifTT 
(TT 
envTT 
.TT 
IsDevelopmentTT !
(TT! "
)TT" #
)TT# $
{UU 
appVV 
.VV %
UseDeveloperExceptionPageVV -
(VV- .
)VV. /
;VV/ 0
appWW 
.WW 

UseSwaggerWW 
(WW 
)WW  
;WW  !
appXX 
.XX 
UseSwaggerUIXX  
(XX  !
cXX! "
=>XX# %
cXX& '
.XX' (
SwaggerEndpointXX( 7
(XX7 8
$strXX8 R
,XXR S
$strXXT _
)XX_ `
)XX` a
;XXa b
}YY 
app[[ 
.[[ 
UseHttpsRedirection[[ #
([[# $
)[[$ %
;[[% &
app]] 
.]] 

UseRouting]] 
(]] 
)]] 
;]] 
app^^ 
.^^ 
UseCors^^ 
(^^ 
$str^^ "
)^^" #
;^^# $
app`` 
.`` 
UseAuthentication`` !
(``! "
)``" #
;``# $
appaa 
.aa 
UseAuthorizationaa  
(aa  !
)aa! "
;aa" #
appbb 
.bb 
UseEndpointsbb 
(bb 
	endpointsbb &
=>bb' )
{cc 
	endpointsdd 
.dd 
MapControllersdd (
(dd( )
)dd) *
;dd* +
}ee 
)ee 
;ee 
}ff 	
}gg 
}hh ”
^C:\Fac\SysopSquadEvaluations\Evaluations\WebAPI\Validators\CreateEvaluationCommandValidator.cs
	namespace 	
WebAPI
 
. 

Validators 
{ 
public 

class ,
 CreateEvaluationCommandValidator 1
:2 3
AbstractValidator4 E
<E F#
CreateEvaluationCommandF ]
>] ^
{ 
public ,
 CreateEvaluationCommandValidator /
(/ 0
)0 1
{		 	
const

 
string

 
idRegex

  
=

! "
$str

# 3
;

3 4
RuleFor 
( 

evaluation 
=> !

evaluation" ,
., -
UserId- 3
)3 4
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
EmptyUserId9 D
)D E
. 
Length 
( 
$num 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
InvalidIdLength9 H
)H I
. 
Matches 
( 
idRegex  
)  !
.! "
WithMessage" -
(- .
ValidationErrors. >
.> ?
InvalidIdStructure? Q
)Q R
;R S
RuleFor 
( 

evaluation 
=> !

evaluation" ,
., -
ConsultantId- 9
)9 :
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
EmptyConsultantId9 J
)J K
. 
Length 
( 
$num 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
InvalidIdLength9 H
)H I
. 
Matches 
( 
idRegex  
)  !
.! "
WithMessage" -
(- .
ValidationErrors. >
.> ?
InvalidIdStructure? Q
)Q R
;R S
RuleFor 
( 

evaluation 
=> !

evaluation" ,
., -
Scor- 1
)1 2
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
	EmptyScor9 B
)B C
. 
InclusiveBetween !
(! "
$num" #
,# $
$num% &
)& '
.' (
WithMessage( 3
(3 4
ValidationErrors4 D
.D E
InvalidScorE P
)P Q
;Q R
} 	
} 
} î
^C:\Fac\SysopSquadEvaluations\Evaluations\WebAPI\Validators\UpdateEvaluationCommandValidator.cs
	namespace 	
WebAPI
 
. 

Validators 
{ 
public 

class ,
 UpdateEvaluationCommandValidator 1
:2 3
AbstractValidator4 E
<E F'
UpdateEvaluationByIdCommandF a
>a b
{ 
public ,
 UpdateEvaluationCommandValidator /
(/ 0
)0 1
{		 	
const

 
string

 
idRegex

  
=

! "
$str

# 3
;

3 4
When 
( 

evaluation 
=> 
!  
string  &
.& '
IsNullOrEmpty' 4
(4 5

evaluation5 ?
.? @
UserId@ F
)F G
,G H
(I J
)J K
=>L N
{ 
RuleFor 
( 

evaluation "
=># %

evaluation& 0
.0 1
UserId1 7
)7 8
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
EmptyUserId9 D
)D E
. 
Length 
( 
$num 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
InvalidIdLength9 H
)H I
. 
Matches 
( 
idRegex  
)  !
.! "
WithMessage" -
(- .
ValidationErrors. >
.> ?
InvalidIdStructure? Q
)Q R
;R S
} 
) 
; 
When 
( 

evaluation 
=> 
!  
string  &
.& '
IsNullOrEmpty' 4
(4 5

evaluation5 ?
.? @
ConsultantId@ L
)L M
,M N
(O P
)P Q
=>R T
{ 
RuleFor 
( 

evaluation "
=># %

evaluation& 0
.0 1
ConsultantId1 =
)= >
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
EmptyConsultantId9 J
)J K
. 
Length 
( 
$num 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
InvalidIdLength9 H
)H I
. 
Matches 
( 
idRegex  
)  !
.! "
WithMessage" -
(- .
ValidationErrors. >
.> ?
InvalidIdStructure? Q
)Q R
;R S
} 
) 
; 
RuleFor 
( 

evaluation 
=> !

evaluation" ,
., -
Scor- 1
)1 2
.   
Cascade   
(   
CascadeMode    
.    !
Stop  ! %
)  % &
.!! 
NotEmpty!! 
(!! 
)!! 
.!! 
WithMessage!! #
(!!# $
ValidationErrors!!$ 4
.!!4 5
	EmptyScor!!5 >
)!!> ?
."" 
InclusiveBetween"" 
("" 
$num"" 
,""  
$num""! "
)""" #
.""# $
WithMessage""$ /
(""/ 0
ValidationErrors""0 @
.""@ A
InvalidScor""A L
)""L M
;""M N
}## 	
}$$ 
}%% 