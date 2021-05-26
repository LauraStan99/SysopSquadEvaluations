ð
XC:\Fac\SysopSquadEvaluations\Evaluations\Tests.Helpers\CreateEvaluationCommandFactory.cs
	namespace 	
Tests
 
. 
Helpers 
{ 
public 

static 
class *
CreateEvaluationCommandFactory 6
{ 
public		 
static		 #
CreateEvaluationCommand		 -(
ValidCreateEvaluationCommand		. J
(		J K
)		K L
=>		M O
new		P S
(		S T
)		T U
{

 	
Scor 
= 
$num 
, 
UserId 
= 
$str /
,/ 0
ConsultantId 
= 
$str 5
} 	
;	 

public 
static #
CreateEvaluationCommand -1
%CreateEvaluationCommandWithWrongScore. S
(S T
)T U
{ 	
var 
createEvaluation  
=! "(
ValidCreateEvaluationCommand# ?
(? @
)@ A
;A B
createEvaluation 
. 
Scor !
=" #
$num$ &
;& '
return 
createEvaluation #
;# $
} 	
public 
static #
CreateEvaluationCommand --
!CreateEvaluationCommandWithNoData. O
(O P
)P Q
=>R T
newU X
(X Y
)Y Z
;Z [
} 
} À
LC:\Fac\SysopSquadEvaluations\Evaluations\Tests.Helpers\EvaluationsFactory.cs
	namespace 	
Tests
 
. 
Helpers 
{ 
public 

static 
class 
EvaluationsFactory *
{ 
public 
static 

Evaluation  
ValidEvaluation! 0
(0 1
)1 2
{		 	
return

 
new

 

Evaluation

 !
{ 
Scor 
= 
$num 
, 
UserId 
= 
$str 3
,3 4
ConsultantId 
= 
$str 9
} 
; 
} 	
public 
static 

Evaluation  
AddedEvaluation! 0
(0 1!
IApplicationDbContext1 F
contextG N
)N O
{ 	
var 

evaluation 
= 
ValidEvaluation ,
(, -
)- .
;. /
context 
. 
GetCollection !
<! "

Evaluation" ,
>, -
(- .
). /
./ 0
	InsertOne0 9
(9 :

evaluation: D
)D E
;E F
return 

evaluation 
; 
} 	
public 
static 

Evaluation  
Added2Evaluations! 2
(2 3!
IApplicationDbContext3 H
contextI P
)P Q
{ 	
var 
evaluation1 
= 
ValidEvaluation -
(- .
). /
;/ 0
var 
evaluation2 
= 
ValidEvaluation -
(- .
). /
;/ 0
context 
. 
GetCollection !
<! "

Evaluation" ,
>, -
(- .
). /
./ 0
	InsertOne0 9
(9 :
evaluation1: E
)E F
;F G
context 
. 
GetCollection !
<! "

Evaluation" ,
>, -
(- .
). /
./ 0
	InsertOne0 9
(9 :
evaluation2: E
)E F
;F G
return 
evaluation1 
; 
} 	
public!! 
static!! 

Evaluation!!  %
UpdateScorValidEvaluation!!! :
(!!: ;
string!!; A
id!!B D
)!!D E
{"" 	
return## 
new## 

Evaluation## !
{$$ 
Id%% 
=%% 
id%% 
,%% 
Scor&& 
=&& 
$num&& 
,&& 
UserId'' 
='' 
$str'' 3
,''3 4
ConsultantId(( 
=(( 
$str(( 9
}** 
;** 
}++ 	
},, 
}-- ÷ 
\C:\Fac\SysopSquadEvaluations\Evaluations\Tests.Helpers\UpdateEvaluationByIdCommandFactory.cs
	namespace 	
Tests
 
. 
Helpers 
{ 
public 

static 
class .
"UpdateEvaluationByIdCommandFactory :
{ 
public		 
static		 '
UpdateEvaluationByIdCommand		 1(
ValidUpdateEvaluationCommand		2 N
(		N O!
IApplicationDbContext		O d
context		e l
)		l m
{

 	
var 

evaluation 
= 
EvaluationsFactory /
./ 0
AddedEvaluation0 ?
(? @
context@ G
)G H
;H I
return 
new 
( 
) 
{ 
Id 
= 

evaluation 
.  
Id  "
," #
Scor 
= 
$num 
, 
UserId 
= 
$str 3
,3 4
ConsultantId 
= 
$str 9
} 
; 
} 	
public 
static '
UpdateEvaluationByIdCommand 1,
 ValidUpdateEvaluationByIdCommand2 R
(R S
stringS Y
idZ \
)\ ]
{ 	
return 
new 
( 
) 
{ 
Id 
= 
id 
, 
Scor 
= 
$num 
, 
UserId 
= 
$str 3
,3 4
ConsultantId 
= 
$str 9
} 
; 
} 	
public 
static '
UpdateEvaluationByIdCommand 1,
 UpdateEvaluationCommandWithoutId2 R
(R S
)S T
=>U W
new   
(   
)   
{!! 
Scor"" 
="" 
$num"" 
,"" 
UserId## 
=## 
$str## 3
,##3 4
ConsultantId$$ 
=$$ 
$str$$ 9
}%% 
;%% 
public'' 
static'' '
UpdateEvaluationByIdCommand'' 1/
#UpdateEvaluationCommandWithoutScore''2 U
(''U V
)''V W
=>''X Z
new(( 
((( 
)(( 
{)) 
UserId** 
=** 
$str** 3
,**3 4
ConsultantId++ 
=++ 
$str++ 9
},, 
;,, 
public.. 
static.. '
UpdateEvaluationByIdCommand.. 19
-UpdateEvaluationCommandWithInvalidIdStructure..2 _
(.._ `
)..` a
=>..b d
new// 
(// 
)// 
{00 
Id11 
=11 
$str11 /
,11/ 0
Scor22 
=22 
$num22 
,22 
UserId33 
=33 
$str33 3
,333 4
ConsultantId44 
=44 
$str44 9
}55 
;55 
public77 
static77 '
UpdateEvaluationByIdCommand77 16
*UpdateEvaluationCommandWithInvalidIdLength772 \
(77\ ]
)77] ^
=>77_ a
new88 
(88 
)88 
{99 
Id:: 
=:: 
$str:: 
,:: 
Scor;; 
=;; 
$num;; 
,;; 
UserId<< 
=<< 
$str<< 3
,<<3 4
ConsultantId== 
=== 
$str== 9
}>> 
;>> 
public@@ 
static@@ '
UpdateEvaluationByIdCommand@@ 13
'UpdateEvaluationCommandWithInexistentId@@2 Y
(@@Y Z
)@@Z [
=>@@\ ^
newAA 
(AA 
)AA 
{BB 
IdCC 
=CC 
$strCC /
,CC/ 0
ScorDD 
=DD 
$numDD 
,DD 
UserIdEE 
=EE 
$strEE 3
,EE3 4
ConsultantIdFF 
=FF 
$strFF 9
}GG 
;GG 
}HH 
}II 