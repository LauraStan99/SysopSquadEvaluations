å

DC:\Fac\SysopSquadEvaluations\Evaluations\Domain\Common\BaseEntity.cs
	namespace 	
Domain
 
. 
Common 
{ 
public 

class 

BaseEntity 
{ 
[ 	
BsonId	 
] 
[		 	
BsonRepresentation			 
(		 
BsonType		 $
.		$ %
ObjectId		% -
)		- .
]		. /
public

 
string

 
Id

 
{

 
get

 
;

 
set

  #
;

# $
}

% &
public 
int 
Scor 
{ 
get 
; 
set "
;" #
}$ %
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
public 
string 
ConsultantId "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ´
FC:\Fac\SysopSquadEvaluations\Evaluations\Domain\Entities\Evaluation.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 

Evaluation 
: 

BaseEntity &
{ 
} 
} 