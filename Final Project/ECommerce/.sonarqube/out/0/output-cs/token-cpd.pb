òe
ED:\MajorProject\Final Project\ECommerce\Controllers\BookController.cs
	namespace 	
	ECommerce
 
. 
Controllers 
{ 
[ 
Produces 
( 
$str  
)  !
]! "
[ 
Route 

(
 
$str 
) 
] 
public 

class 
BookController 
:  !

Controller" ,
{ 
readonly 
IWebHostEnvironment $
_hostingEnvironment% 8
;8 9
readonly 
IBookService 
_bookService *
;* +
readonly 
IConfiguration 
_config  '
;' (
readonly 
string  
coverImageFolderPath ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
BookController 
( 
IConfiguration ,
config- 3
,3 4
IWebHostEnvironment5 H
hostingEnvironmentI [
,[ \
IBookService] i
bookServicej u
)u v
{ 	
_config 
= 
config 
; 
_bookService 
= 
bookService &
;& '
_hostingEnvironment 
=  !
hostingEnvironment" 4
;4 5 
coverImageFolderPath    
=  ! "
Path  # '
.  ' (
Combine  ( /
(  / 0
_hostingEnvironment  0 C
.  C D
WebRootPath  D O
,  O P
$str  Q Y
)  Y Z
;  Z [
if!! 
(!! 
!!! 
	Directory!! 
.!! 
Exists!! !
(!!! " 
coverImageFolderPath!!" 6
)!!6 7
)!!7 8
{"" 
	Directory## 
.## 
CreateDirectory## )
(##) * 
coverImageFolderPath##* >
)##> ?
;##? @
}$$ 
}%% 	
[++ 	
HttpGet++	 
]++ 
public,, 
async,, 
Task,, 
<,, 
List,, 
<,, 
Book,, #
>,,# $
>,,$ %
Get,,& )
(,,) *
),,* +
{-- 	
return.. 
await.. 
Task.. 
... 

FromResult.. (
(..( )
_bookService..) 5
...5 6
GetAllBooks..6 A
(..A B
)..B C
)..C D
...D E
ConfigureAwait..E S
(..S T
true..T X
)..X Y
;..Y Z
}// 	
[66 	
HttpGet66	 
(66 
$str66 
)66 
]66 
public77 
IActionResult77 
Get77  
(77  !
int77! $
id77% '
)77' (
{88 	
Book99 
book99 
=99 
_bookService99 $
.99$ %
GetBookData99% 0
(990 1
id991 3
)993 4
;994 5
if:: 
(:: 
book:: 
!=:: 
null:: 
):: 
{;; 
return<< 
Ok<< 
(<< 
book<< 
)<< 
;<<  
}== 
return>> 
NotFound>> 
(>> 
)>> 
;>> 
}?? 	
[EE 	
HttpGetEE	 
]EE 
[FF 	
RouteFF	 
(FF 
$strFF "
)FF" #
]FF# $
publicGG 
asyncGG 
TaskGG 
<GG 
IEnumerableGG %
<GG% &

CategoriesGG& 0
>GG0 1
>GG1 2
CategoryDetailsGG3 B
(GGB C
)GGC D
{HH 	
returnII 
awaitII 
TaskII 
.II 

FromResultII (
(II( )
_bookServiceII) 5
.II5 6
GetCategoriesII6 C
(IIC D
)IID E
)IIE F
.IIF G
ConfigureAwaitIIG U
(IIU V
trueIIV Z
)IIZ [
;II[ \
}JJ 	
[QQ 	
HttpGetQQ	 
]QQ 
[RR 	
RouteRR	 
(RR 
$strRR )
)RR) *
]RR* +
publicSS 
asyncSS 
TaskSS 
<SS 
ListSS 
<SS 
BookSS #
>SS# $
>SS$ %
SimilarBooksSS& 2
(SS2 3
intSS3 6
bookIdSS7 =
)SS= >
{TT 	
returnUU 
awaitUU 
TaskUU 
.UU 

FromResultUU (
(UU( )
_bookServiceUU) 5
.UU5 6
GetSimilarBooksUU6 E
(UUE F
bookIdUUF L
)UUL M
)UUM N
.UUN O
ConfigureAwaitUUO ]
(UU] ^
trueUU^ b
)UUb c
;UUc d
}VV 	
[\\ 	
HttpPost\\	 
,\\ #
DisableRequestSizeLimit\\ *
]\\* +
[]] 	
	Authorize]]	 
(]] 
Policy]] 
=]] 
	UserRoles]] %
.]]% &
Admin]]& +
)]]+ ,
]]], -
public^^ 
int^^ 
Post^^ 
(^^ 
)^^ 
{__ 	
Book`` 
book`` 
=`` 
JsonConvert`` #
.``# $
DeserializeObject``$ 5
<``5 6
Book``6 :
>``: ;
(``; <
Request``< C
.``C D
Form``D H
[``H I
$str``I W
]``W X
.``X Y
ToString``Y a
(``a b
)``b c
)``c d
;``d e
ifee 
(ee 
Requestee 
.ee 
Formee 
.ee 
Filesee "
.ee" #
Countee# (
>ee) *
$numee+ ,
)ee, -
{ff 
vargg 
filegg 
=gg 
Requestgg "
.gg" #
Formgg# '
.gg' (
Filesgg( -
[gg- .
$numgg. /
]gg/ 0
;gg0 1
ifii 
(ii 
fileii 
.ii 
Lengthii 
>ii  !
$numii" #
)ii# $
{jj 
stringkk 
fileNamekk #
=kk$ %
Guidkk& *
.kk* +
NewGuidkk+ 2
(kk2 3
)kk3 4
+kk5 6)
ContentDispositionHeaderValuekk7 T
.kkT U
ParsekkU Z
(kkZ [
filekk[ _
.kk_ `
ContentDispositionkk` r
)kkr s
.kks t
FileNamekkt |
.kk| }
Trim	kk} Å
(
kkÅ Ç
$char
kkÇ Ö
)
kkÖ Ü
;
kkÜ á
stringll 
fullPathll #
=ll$ %
Pathll& *
.ll* +
Combinell+ 2
(ll2 3 
coverImageFolderPathll3 G
,llG H
fileNamellI Q
)llQ R
;llR S
usingmm 
(mm 
varmm 
streammm %
=mm& '
newmm( +

FileStreammm, 6
(mm6 7
fullPathmm7 ?
,mm? @
FileModemmA I
.mmI J
CreatemmJ P
)mmP Q
)mmQ R
{nn 
fileoo 
.oo 
CopyTooo #
(oo# $
streamoo$ *
)oo* +
;oo+ ,
}pp 
bookqq 
.qq 
CoverFileNameqq &
=qq' (
fileNameqq) 1
;qq1 2
}rr 
}ss 
elsett 
{uu 
bookvv 
.vv 
CoverFileNamevv "
=vv# $
_configvv% ,
[vv, -
$strvv- D
]vvD E
;vvE F
}ww 
returnxx 
_bookServicexx 
.xx  
AddBookxx  '
(xx' (
bookxx( ,
)xx, -
;xx- .
}yy 	
[ 	
HttpPut	 
] 
[
ÄÄ 	
	Authorize
ÄÄ	 
(
ÄÄ 
Policy
ÄÄ 
=
ÄÄ 
	UserRoles
ÄÄ %
.
ÄÄ% &
Admin
ÄÄ& +
)
ÄÄ+ ,
]
ÄÄ, -
public
ÅÅ 
int
ÅÅ 
Put
ÅÅ 
(
ÅÅ 
)
ÅÅ 
{
ÇÇ 	
Book
ÉÉ 
book
ÉÉ 
=
ÉÉ 
JsonConvert
ÉÉ #
.
ÉÉ# $
DeserializeObject
ÉÉ$ 5
<
ÉÉ5 6
Book
ÉÉ6 :
>
ÉÉ: ;
(
ÉÉ; <
Request
ÉÉ< C
.
ÉÉC D
Form
ÉÉD H
[
ÉÉH I
$str
ÉÉI W
]
ÉÉW X
.
ÉÉX Y
ToString
ÉÉY a
(
ÉÉa b
)
ÉÉb c
)
ÉÉc d
;
ÉÉd e
if
ÑÑ 
(
ÑÑ 
Request
ÑÑ 
.
ÑÑ 
Form
ÑÑ 
.
ÑÑ 
Files
ÑÑ "
.
ÑÑ" #
Count
ÑÑ# (
>
ÑÑ) *
$num
ÑÑ+ ,
)
ÑÑ, -
{
ÖÖ 
var
ÜÜ 
file
ÜÜ 
=
ÜÜ 
Request
ÜÜ "
.
ÜÜ" #
Form
ÜÜ# '
.
ÜÜ' (
Files
ÜÜ( -
[
ÜÜ- .
$num
ÜÜ. /
]
ÜÜ/ 0
;
ÜÜ0 1
if
àà 
(
àà 
file
àà 
.
àà 
Length
àà 
>
àà  !
$num
àà" #
)
àà# $
{
ââ 
string
ää 
fileName
ää #
=
ää$ %
Guid
ää& *
.
ää* +
NewGuid
ää+ 2
(
ää2 3
)
ää3 4
+
ää5 6+
ContentDispositionHeaderValue
ää7 T
.
ääT U
Parse
ääU Z
(
ääZ [
file
ää[ _
.
ää_ ` 
ContentDisposition
ää` r
)
äär s
.
ääs t
FileName
äät |
.
ää| }
Trimää} Å
(ääÅ Ç
$charääÇ Ö
)ääÖ Ü
;ääÜ á
string
ãã 
fullPath
ãã #
=
ãã$ %
Path
ãã& *
.
ãã* +
Combine
ãã+ 2
(
ãã2 3"
coverImageFolderPath
ãã3 G
,
ããG H
fileName
ããI Q
)
ããQ R
;
ããR S
bool
åå 
isFileExists
åå %
=
åå& '
	Directory
åå( 1
.
åå1 2
Exists
åå2 8
(
åå8 9
fullPath
åå9 A
)
ååA B
;
ååB C
if
éé 
(
éé 
!
éé 
isFileExists
éé %
)
éé% &
{
èè 
using
êê 
(
êê 
var
êê "
stream
êê# )
=
êê* +
new
êê, /

FileStream
êê0 :
(
êê: ;
fullPath
êê; C
,
êêC D
FileMode
êêE M
.
êêM N
Create
êêN T
)
êêT U
)
êêU V
{
ëë 
file
íí  
.
íí  !
CopyTo
íí! '
(
íí' (
stream
íí( .
)
íí. /
;
íí/ 0
}
ìì 
book
îî 
.
îî 
CoverFileName
îî *
=
îî+ ,
fileName
îî- 5
;
îî5 6
}
ïï 
}
ññ 
}
óó 
return
òò 
_bookService
òò 
.
òò  

UpdateBook
òò  *
(
òò* +
book
òò+ /
)
òò/ 0
;
òò0 1
}
ôô 	
[
†† 	

HttpDelete
††	 
(
†† 
$str
†† 
)
†† 
]
†† 
[
°° 	
	Authorize
°°	 
(
°° 
Policy
°° 
=
°° 
	UserRoles
°° %
.
°°% &
Admin
°°& +
)
°°+ ,
]
°°, -
public
¢¢ 
int
¢¢ 
Delete
¢¢ 
(
¢¢ 
int
¢¢ 
id
¢¢  
)
¢¢  !
{
££ 	
string
§§ 
coverFileName
§§  
=
§§! "
_bookService
§§# /
.
§§/ 0

DeleteBook
§§0 :
(
§§: ;
id
§§; =
)
§§= >
;
§§> ?
if
•• 
(
•• 
coverFileName
•• 
!=
••  
_config
••! (
[
••( )
$str
••) @
]
••@ A
)
••A B
{
¶¶ 
string
ßß 
fullPath
ßß 
=
ßß  !
Path
ßß" &
.
ßß& '
Combine
ßß' .
(
ßß. /"
coverImageFolderPath
ßß/ C
,
ßßC D
coverFileName
ßßE R
)
ßßR S
;
ßßS T
if
®® 
(
®® 
System
®® 
.
®® 
IO
®® 
.
®® 
File
®® "
.
®®" #
Exists
®®# )
(
®®) *
fullPath
®®* 2
)
®®2 3
)
®®3 4
{
©© 
System
™™ 
.
™™ 
IO
™™ 
.
™™ 
File
™™ "
.
™™" #
Delete
™™# )
(
™™) *
fullPath
™™* 2
)
™™2 3
;
™™3 4
}
´´ 
}
¨¨ 
return
≠≠ 
$num
≠≠ 
;
≠≠ 
}
ÆÆ 	
}
ØØ 
}∞∞ “
ID:\MajorProject\Final Project\ECommerce\Controllers\CheckOutController.cs
	namespace 	
	ECommerce
 
. 
Controllers 
{ 
[ 
	Authorize 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
CheckOutController #
:$ %

Controller& 0
{ 
readonly 
IOrderService 
_orderService ,
;, -
readonly 
ICartService 
_cartService *
;* +
public 
CheckOutController !
(! "
IOrderService" /
orderService0 <
,< =
ICartService> J
cartServiceK V
)V W
{ 	
_orderService 
= 
orderService (
;( )
_cartService 
= 
cartService &
;& '
} 	
[## 	
HttpPost##	 
(## 
$str## 
)## 
]## 
public$$ 
int$$ 
Post$$ 
($$ 
int$$ 
userId$$ "
,$$" #
[$$$ %
FromBody$$% -
]$$- .
	OrdersDto$$/ 8
checkedOutItems$$9 H
)$$H I
{%% 	
_orderService&& 
.&& 
CreateOrder&& %
(&&% &
userId&&& ,
,&&, -
checkedOutItems&&. =
)&&= >
;&&> ?
return'' 
_cartService'' 
.''  
	ClearCart''  )
('') *
userId''* 0
)''0 1
;''1 2
}(( 	
})) 
}** µ)
FD:\MajorProject\Final Project\ECommerce\Controllers\LoginController.cs
	namespace 	
	ECommerce
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
LoginController  
:! "

Controller# -
{ 
readonly 
IUserService 
_userService *
;* +
readonly 
IConfiguration 
_config  '
;' (
public 
LoginController 
( 
IConfiguration -
config. 4
,4 5
IUserService6 B
userServiceC N
)N O
{ 	
_config 
= 
config 
; 
_userService 
= 
userService &
;& '
} 	
[## 	
HttpPost##	 
]## 
public$$ 
IActionResult$$ 
Login$$ "
($$" #
[$$# $
FromBody$$$ ,
]$$, -

UserMaster$$. 8
login$$9 >
)$$> ?
{%% 	
IActionResult&& 
response&& "
=&&# $
Unauthorized&&% 1
(&&1 2
)&&2 3
;&&3 4

UserMaster'' 
user'' 
='' 
_userService'' *
.''* +
AuthenticateUser''+ ;
(''; <
login''< A
)''A B
;''B C
if)) 
()) 
user)) 
!=)) 
null)) 
))) 
{** 
var++ 
tokenString++ 
=++  ! 
GenerateJSONWebToken++" 6
(++6 7
user++7 ;
)++; <
;++< =
response,, 
=,, 
Ok,, 
(,, 
new,, !
{-- 
token.. 
=.. 
tokenString.. '
,..' (
userDetails// 
=//  !
user//" &
,//& '
}00 
)00 
;00 
}11 
return33 
response33 
;33 
}44 	
string77  
GenerateJSONWebToken77 #
(77# $

UserMaster77$ .
userInfo77/ 7
)777 8
{88 	
var99 
securityKey99 
=99 
new99 ! 
SymmetricSecurityKey99" 6
(996 7
Encoding997 ?
.99? @
UTF899@ D
.99D E
GetBytes99E M
(99M N
_config99N U
[99U V
$str99V e
]99e f
)99f g
)99g h
;99h i
var:: 
credentials:: 
=:: 
new:: !
SigningCredentials::" 4
(::4 5
securityKey::5 @
,::@ A
SecurityAlgorithms::B T
.::T U

HmacSha256::U _
)::_ `
;::` a
var<< 
claims<< 
=<< 
new<< 
[<< 
]<< 
{== 
new>> 
Claim>> 
(>> #
JwtRegisteredClaimNames>> 1
.>>1 2
Sub>>2 5
,>>5 6
userInfo>>7 ?
.>>? @
Username>>@ H
)>>H I
,>>I J
new?? 
Claim?? 
(?? 
$str?? "
,??" #
userInfo??$ ,
.??, -
UserId??- 3
.??3 4
ToString??4 <
(??< =
CultureInfo??= H
.??H I
InvariantCulture??I Y
)??Y Z
)??Z [
,??[ \
new@@ 
Claim@@ 
(@@ 
$str@@ &
,@@& '
userInfo@@( 0
.@@0 1

UserTypeId@@1 ;
.@@; <
ToString@@< D
(@@D E
CultureInfo@@E P
.@@P Q
InvariantCulture@@Q a
)@@a b
)@@b c
,@@c d
newAA 
ClaimAA 
(AA 

ClaimTypesAA $
.AA$ %
RoleAA% )
,AA) *
userInfoAA* 2
.AA2 3

UserTypeIdAA3 =
.AA= >
ToStringAA> F
(AAF G
CultureInfoAAG R
.AAR S
InvariantCultureAAS c
)AAc d
)AAd e
,AAe f
newBB 
ClaimBB 
(BB #
JwtRegisteredClaimNamesBB 1
.BB1 2
JtiBB2 5
,BB5 6
GuidBB7 ;
.BB; <
NewGuidBB< C
(BBC D
)BBD E
.BBE F
ToStringBBF N
(BBN O
)BBO P
)BBP Q
,BBQ R
}CC 
;CC 
varEE 
tokenEE 
=EE 
newEE 
JwtSecurityTokenEE ,
(EE, -
claimsHH 
:HH 
claimsHH 
,HH 
expiresII 
:II 
DateTimeII !
.II! "
NowII" %
.II% &
	AddMonthsII& /
(II/ 0
$numII0 1
)II1 2
,II2 3
signingCredentialsJJ "
:JJ" #
credentialsJJ$ /
)KK 
;KK 
returnMM 
newMM #
JwtSecurityTokenHandlerMM .
(MM. /
)MM/ 0
.MM0 1

WriteTokenMM1 ;
(MM; <
tokenMM< A
)MMA B
;MMB C
}NN 	
}OO 
}PP ˆ
FD:\MajorProject\Final Project\ECommerce\Controllers\OrderController.cs
	namespace 	
	ECommerce
 
. 
Controllers 
{ 
[ 
	Authorize 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
OrderController  
:! "

Controller# -
{ 
readonly 
IOrderService 
_orderService ,
;, -
public 
OrderController 
( 
IOrderService ,
orderService- 9
)9 :
{ 	
_orderService 
= 
orderService (
;( )
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
List 
< 
	OrdersDto (
>( )
>) *
Get+ .
(. /
int/ 2
userId3 9
)9 :
{   	
return!! 
await!! 
Task!! 
.!! 

FromResult!! (
(!!( )
_orderService!!) 6
.!!6 7
GetOrderList!!7 C
(!!C D
userId!!D J
)!!J K
)!!K L
.!!L M
ConfigureAwait!!M [
(!![ \
true!!\ `
)!!` a
;!!a b
}"" 	
}ZZ 
}[[ å'
MD:\MajorProject\Final Project\ECommerce\Controllers\ShoppingCartController.cs
	namespace 	
	ECommerce
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
public 

class "
ShoppingCartController '
:( )

Controller* 4
{ 
readonly 
ICartService 
_cartService *
;* +
readonly 
IBookService 
_bookService *
;* +
public "
ShoppingCartController %
(% &
ICartService& 2
cartService3 >
,> ?
IBookService@ L
bookServiceM X
)X Y
{ 	
_cartService 
= 
cartService &
;& '
_bookService 
= 
bookService &
;& '
} 	
[ 	
	Authorize	 
] 
[   	
HttpGet  	 
]   
[!! 	
Route!!	 
(!! 
$str!! 8
)!!8 9
]!!9 :
public"" 
int"" 
Get"" 
("" 
int"" 
	oldUserId"" $
,""$ %
int""& )
	newUserId""* 3
)""3 4
{## 	
_cartService$$ 
.$$ 
	MergeCart$$ "
($$" #
	oldUserId$$# ,
,$$, -
	newUserId$$. 7
)$$7 8
;$$8 9
return%% 
_cartService%% 
.%%  
GetCartItemCount%%  0
(%%0 1
	newUserId%%1 :
)%%: ;
;%%; <
}&& 	
[-- 	
HttpGet--	 
(-- 
$str-- 
)-- 
]-- 
public.. 
async.. 
Task.. 
<.. 
List.. 
<.. 
CartItemDto.. *
>..* +
>..+ ,
Get..- 0
(..0 1
int..1 4
userId..5 ;
)..; <
{// 	
string00 
cartid00 
=00 
_cartService00 (
.00( )
	GetCartId00) 2
(002 3
userId003 9
)009 :
;00: ;
return11 
await11 
Task11 
.11 

FromResult11 (
(11( )
_bookService11) 5
.115 6#
GetBooksAvailableInCart116 M
(11M N
cartid11N T
)11T U
)11U V
.11V W
ConfigureAwait11W e
(11e f
true11f j
)11j k
;11k l
}22 	
[:: 	
HttpPost::	 
]:: 
[;; 	
Route;;	 
(;; 
$str;; ,
);;, -
];;- .
public<< 
int<< 
Post<< 
(<< 
int<< 
userId<< "
,<<" #
int<<$ '
bookId<<( .
)<<. /
{== 	
_cartService>> 
.>> 
AddBookToCart>> &
(>>& '
userId>>' -
,>>- .
bookId>>/ 5
)>>5 6
;>>6 7
return?? 
_cartService?? 
.??  
GetCartItemCount??  0
(??0 1
userId??1 7
)??7 8
;??8 9
}@@ 	
[HH 	
HttpPutHH	 
(HH 
$strHH $
)HH$ %
]HH% &
publicII 
intII 
PutII 
(II 
intII 
userIdII !
,II! "
intII# &
bookIdII' -
)II- .
{JJ 	
_cartServiceKK 
.KK 
DeleteOneCartItemKK *
(KK* +
userIdKK+ 1
,KK1 2
bookIdKK3 9
)KK9 :
;KK: ;
returnLL 
_cartServiceLL 
.LL  
GetCartItemCountLL  0
(LL0 1
userIdLL1 7
)LL7 8
;LL8 9
}MM 	
[UU 	

HttpDeleteUU	 
(UU 
$strUU '
)UU' (
]UU( )
publicVV 
intVV 
DeleteVV 
(VV 
intVV 
userIdVV $
,VV$ %
intVV& )
bookIdVV* 0
)VV0 1
{WW 	
_cartServiceXX 
.XX 
RemoveCartItemXX '
(XX' (
userIdXX( .
,XX. /
bookIdXX0 6
)XX6 7
;XX7 8
returnYY 
_cartServiceYY 
.YY  
GetCartItemCountYY  0
(YY0 1
userIdYY1 7
)YY7 8
;YY8 9
}ZZ 	
[aa 	

HttpDeleteaa	 
(aa 
$straa 
)aa 
]aa  
publicbb 
intbb 
Deletebb 
(bb 
intbb 
userIdbb $
)bb$ %
{cc 	
returndd 
_cartServicedd 
.dd  
	ClearCartdd  )
(dd) *
userIddd* 0
)dd0 1
;dd1 2
}ee 	
}ff 
}gg œ2
ED:\MajorProject\Final Project\ECommerce\Controllers\UserController.cs
	namespace 	
	ECommerce
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
UserController 
:  !

Controller" ,
{ 
readonly 
IUserService 
_userService *
;* +
readonly 
ICartService 
_cartService *
;* +
public 
UserController 
( 
IUserService *
userService+ 6
,6 7
ICartService8 D
cartServiceE P
)P Q
{ 	
_userService 
= 
userService &
;& '
_cartService 
= 
cartService &
;& '
} 	
["" 	
HttpGet""	 
("" 
$str"" 
)"" 
]"" 
public## 
int## 
Get## 
(## 
int## 
userId## !
)##! "
{$$ 	
int%% 
cartItemCount%% 
=%% 
_cartService%%  ,
.%%, -
GetCartItemCount%%- =
(%%= >
userId%%> D
)%%D E
;%%E F
return&& 
cartItemCount&& $
;&&$ %
}'' 	
[** 	
HttpGet**	 
]** 
[++ 	
	Authorize++	 
(++ 
Policy++ 
=++ 
	UserRoles++ %
.++% &
Admin++& +
)+++ ,
]++, -
public,, 
async,, 
Task,, 
<,, 
List,, 
<,, 

UserMaster,, )
>,,) *
>,,* +
GetUsers,,, 4
(,,4 5
),,5 6
{-- 	
return.. 
await.. 
Task.. 
... 

FromResult.. (
(..( )
_userService..) 5
...5 6
GetUsers..6 >
(..> ?
)..? @
)..@ A
...A B
ConfigureAwait..B P
(..P Q
true..Q U
)..U V
;..V W
}// 	
[55 	
HttpGet55	 
]55 
[66 	
Route66	 
(66 
$str66 ,
)66, -
]66- .
public77 
bool77 
ValidateUserName77 $
(77$ %
string77% +
userName77, 4
)774 5
{88 	
return99 
_userService99 
.99  
CheckUserAvailabity99  3
(993 4
userName994 <
)99< =
;99= >
}:: 	
[@@ 	
HttpPost@@	 
]@@ 
publicAA 
voidAA 
PostAA 
(AA 
[AA 
FromBodyAA "
]AA" #

UserMasterAA$ .
userDataAA/ 7
)AA7 8
{BB 	
_userServiceCC 
.CC 
RegisterUserCC %
(CC% &
userDataCC& .
)CC. /
;CC/ 0
stringEE 
MailBodyEE 
=EE 
$strEE /
+EE0 1
$strFF  
+FF! "
$strGG [
+GG\ ]
$strHH T
+HHU V
$strII Y
+IIZ [
$strJJ ,
+JJ- .
userDataJJ. 6
.JJ6 7
UsernameJJ7 ?
+JJ? @
$strJJ@ H
+JJI J
$strKK ,
+KK- .
userDataKK/ 7
.KK7 8
PasswordKK8 @
+KKA B
$strKKC K
+KKL M
$strLL {
+LL| }
$strMM &
+MM' (
$strNN %
;NN% &
stringOO 
subjectOO 
=OO 
$strOO 1
;OO1 2
stringPP 
	mailTitlePP 
=PP 
$strPP 9
;PP9 :
stringQQ 
	fromEmailQQ 
=QQ 
$strQQ 7
;QQ7 8
stringRR 
fromEmailPasswordRR $
=RR% &
$strRR' 4
;RR4 5
MailMessageUU 
messageUU 
=UU  !
newUU" %
MailMessageUU& 1
(UU1 2
newUU2 5
MailAddressUU6 A
(UUA B
	fromEmailUUB K
,UUK L
	mailTitleUUM V
)UUV W
,UUW X
newUUY \
MailAddressUU] h
(UUh i
userDataUUi q
.UUq r
UsernameUUr z
)UUz {
)UU{ |
;UU| }
messageVV 
.VV 
SubjectVV 
=VV 
subjectVV %
;VV% &
messageWW 
.WW 
BodyWW 
=WW 
MailBodyWW #
;WW# $
messageXX 
.XX 

IsBodyHtmlXX 
=XX  
trueXX! %
;XX% &

SmtpClient^^ 
smtp^^ 
=^^ 
new^^ !

SmtpClient^^" ,
(^^, -
)^^- .
;^^. /
smtp`` 
.`` 
Host`` 
=`` 
$str`` 2
;``2 3
smtpaa 
.aa 
Portaa 
=aa 
$numaa 
;aa 
smtpbb 
.bb 
	EnableSslbb 
=bb 
falsebb "
;bb" #
smtpcc 
.cc 
DeliveryMethodcc 
=cc  !
SmtpDeliveryMethodcc" 4
.cc4 5
Networkcc5 <
;cc< =
Systemee 
.ee 
Netee 
.ee 
NetworkCredentialee (
credentialsee) 4
=ee5 6
newee7 :
Systemee; A
.eeA B
NeteeB E
.eeE F
NetworkCredentialeeF W
(eeW X
)eeX Y
;eeY Z
credentialsff 
.ff 
UserNameff  
=ff! "
	fromEmailff# ,
;ff, -
credentialsgg 
.gg 
Passwordgg  
=gg! "
fromEmailPasswordgg# 4
;gg4 5
smtphh 
.hh !
UseDefaultCredentialshh &
=hh' (
falsehh) .
;hh. /
smtpii 
.ii 
Credentialsii 
=ii 
credentialsii *
;ii* +
smtpkk 
.kk 
Sendkk 
(kk 
messagekk 
)kk 
;kk 
ViewBagmm 
.mm 
EmailSentMessagemm $
=mm% &
$strmm' @
;mm@ A
}oo 	
}rr 
}ss Á
PD:\MajorProject\Final Project\ECommerce\Controllers\WeatherForecastController.cs
	namespace 	
	ECommerce
 
. 
Controllers 
{		 
[

 
ApiController

 
]

 
[ 
Route 

(
 
$str 
) 
] 
public 

class %
WeatherForecastController *
:+ ,
ControllerBase- ;
{ 
private 
static 
readonly 
string  &
[& '
]' (
	Summaries) 2
=3 4
new5 8
[8 9
]9 :
{ 	
$str 
, 
$str !
,! "
$str# +
,+ ,
$str- 3
,3 4
$str5 ;
,; <
$str= C
,C D
$strE L
,L M
$strN S
,S T
$strU a
,a b
$strc n
} 	
;	 

private 
readonly 
ILogger  
<  !%
WeatherForecastController! :
>: ;
_logger< C
;C D
public %
WeatherForecastController (
(( )
ILogger) 0
<0 1%
WeatherForecastController1 J
>J K
loggerL R
)R S
{ 	
_logger 
= 
logger 
; 
} 	
[ 	
HttpGet	 
] 
public 
IEnumerable 
< 
WeatherForecast *
>* +
Get, /
(/ 0
)0 1
{ 	
var 
rng 
= 
new 
Random  
(  !
)! "
;" #
return 

Enumerable 
. 
Range #
(# $
$num$ %
,% &
$num' (
)( )
.) *
Select* 0
(0 1
index1 6
=>7 9
new: =
WeatherForecast> M
{ 
Date   
=   
DateTime   
.    
Now    #
.  # $
AddDays  $ +
(  + ,
index  , 1
)  1 2
,  2 3
TemperatureC!! 
=!! 
rng!! "
.!!" #
Next!!# '
(!!' (
-!!( )
$num!!) +
,!!+ ,
$num!!- /
)!!/ 0
,!!0 1
Summary"" 
="" 
	Summaries"" #
[""# $
rng""$ '
.""' (
Next""( ,
("", -
	Summaries""- 6
.""6 7
Length""7 =
)""= >
]""> ?
}## 
)## 
.$$ 
ToArray$$ 
($$ 
)$$ 
;$$ 
}%% 	
}&& 
}'' ‘"
ID:\MajorProject\Final Project\ECommerce\Controllers\WishlistController.cs
	namespace 	
	ECommerce
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
WishlistController #
:$ %

Controller& 0
{ 
readonly 
IWishlistService !
_wishlistService" 2
;2 3
readonly 
IBookService 
_bookService *
;* +
readonly 
IUserService 
_userService *
;* +
public 
WishlistController !
(! "
IWishlistService" 2
wishlistService3 B
,B C
IBookServiceD P
bookServiceQ \
,\ ]
IUserService^ j
userServicek v
)v w
{ 	
_wishlistService 
= 
wishlistService .
;. /
_bookService 
= 
bookService &
;& '
_userService 
= 
userService &
;& '
} 	
[!! 	
HttpGet!!	 
(!! 
$str!! 
)!! 
]!! 
public"" 
async"" 
Task"" 
<"" 
List"" 
<"" 
Book"" #
>""# $
>""$ %
Get""& )
("") *
int""* -
userId"". 4
)""4 5
{## 	
return$$ 
await$$ 
Task$$ 
.$$ 

FromResult$$ (
($$( )
GetUserWishlist$$) 8
($$8 9
userId$$9 ?
)$$? @
)$$@ A
.$$A B
ConfigureAwait$$B P
($$P Q
true$$Q U
)$$U V
;$$V W
}%% 	
[-- 	
	Authorize--	 
]-- 
[.. 	
HttpPost..	 
].. 
[// 	
Route//	 
(// 
$str// 1
)//1 2
]//2 3
public00 
async00 
Task00 
<00 
List00 
<00 
Book00 #
>00# $
>00$ %
Post00& *
(00* +
int00+ .
userId00/ 5
,005 6
int007 :
bookId00; A
)00A B
{11 	
_wishlistService22 
.22 
ToggleWishlistItem22 /
(22/ 0
userId220 6
,226 7
bookId228 >
)22> ?
;22? @
return33 
await33 
Task33 
.33 

FromResult33 (
(33( )
GetUserWishlist33) 8
(338 9
userId339 ?
)33? @
)33@ A
.33A B
ConfigureAwait33B P
(33P Q
true33Q U
)33U V
;33V W
}44 	
[;; 	
	Authorize;;	 
];; 
[<< 	

HttpDelete<<	 
(<< 
$str<< 
)<< 
]<<  
public== 
int== 
Delete== 
(== 
int== 
userId== $
)==$ %
{>> 	
return?? 
_wishlistService?? #
.??# $
ClearWishlist??$ 1
(??1 2
userId??2 8
)??8 9
;??9 :
}@@ 	
ListBB 
<BB 
BookBB 
>BB 
GetUserWishlistBB "
(BB" #
intBB# &
userIdBB' -
)BB- .
{CC 	
boolDD 
userDD 
=DD 
_userServiceDD $
.DD$ %
IsUserExistsDD% 1
(DD1 2
userIdDD2 8
)DD8 9
;DD9 :
ifEE 
(EE 
userEE 
)EE 
{FF 
stringGG 

WishlistidGG !
=GG" #
_wishlistServiceGG$ 4
.GG4 5
GetWishlistIdGG5 B
(GGB C
userIdGGC I
)GGI J
;GGJ K
returnHH 
_bookServiceHH #
.HH# $'
GetBooksAvailableInWishlistHH$ ?
(HH? @

WishlistidHH@ J
)HHJ K
;HHK L
}II 
elseJJ 
{KK 
returnLL 
newLL 
ListLL 
<LL  
BookLL  $
>LL$ %
(LL% &
)LL& '
;LL' (
}MM 
}OO 	
}PP 
}QQ Ø
:D:\MajorProject\Final Project\ECommerce\Dto\CartItemDto.cs
	namespace 	
	ECommerce
 
. 
Dto 
{ 
public 

class 
CartItemDto 
{ 
public 
Book 
Book 
{ 
get 
; 
set  #
;# $
}% &
public 
int 
Quantity 
{ 
get !
;! "
set# &
;& '
}( )
}		 
}

 ©
8D:\MajorProject\Final Project\ECommerce\Dto\OrdersDto.cs
	namespace 	
	ECommerce
 
. 
Dto 
{ 
public 

class 
	OrdersDto 
{		 
public

 
string

 
OrderId

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
List 
< 
CartItemDto 
>  
OrderDetails! -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
decimal 
	CartTotal  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
DateTime 
	OrderDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} –
BD:\MajorProject\Final Project\ECommerce\Interfaces\IBookService.cs
	namespace 	
	ECommerce
 
. 

Interfaces 
{ 
public 

	interface 
IBookService !
{ 
List		 
<		 
Book		 
>		 
GetAllBooks		 
(		 
)		  
;		  !
int

 
AddBook

 
(

 
Book

 
book

 
)

 
;

 
int 

UpdateBook 
( 
Book 
book  
)  !
;! "
Book 
GetBookData 
( 
int 
bookId #
)# $
;$ %
string 

DeleteBook 
( 
int 
bookId $
)$ %
;% &
List 
< 

Categories 
> 
GetCategories &
(& '
)' (
;( )
List 
< 
Book 
> 
GetSimilarBooks "
(" #
int# &
bookId' -
)- .
;. /
List 
< 
CartItemDto 
> #
GetBooksAvailableInCart 1
(1 2
string2 8
cartId9 ?
)? @
;@ A
List 
< 
Book 
> '
GetBooksAvailableInWishlist .
(. /
string/ 5

wishlistID6 @
)@ A
;A B
} 
} ·

BD:\MajorProject\Final Project\ECommerce\Interfaces\ICartService.cs
	namespace 	
	ECommerce
 
. 

Interfaces 
{ 
public 

	interface 
ICartService !
{ 
void 
AddBookToCart 
( 
int 
userId %
,% &
int' *
bookId+ 1
)1 2
;2 3
void 
RemoveCartItem 
( 
int 
userId  &
,& '
int( +
bookId, 2
)2 3
;3 4
void 
DeleteOneCartItem 
( 
int "
userId# )
,) *
int+ .
bookId/ 5
)5 6
;6 7
int 
GetCartItemCount 
( 
int  
userId! '
)' (
;( )
void		 
	MergeCart		 
(		 
int		 

tempUserId		 %
,		% &
int		' *

permUserId		+ 5
)		5 6
;		6 7
int

 
	ClearCart

 
(

 
int

 
userId

  
)

  !
;

! "
string 
	GetCartId 
( 
int 
userId #
)# $
;$ %
} 
} Ü
CD:\MajorProject\Final Project\ECommerce\Interfaces\IOrderService.cs
	namespace 	
	ECommerce
 
. 

Interfaces 
{ 
public 

	interface 
IOrderService "
{ 
void 
CreateOrder 
( 
int 
userId #
,# $
	OrdersDto% .
orderDetails/ ;
); <
;< =
List		 
<		 
	OrdersDto		 
>		 
GetOrderList		 $
(		$ %
int		% (
userId		) /
)		/ 0
;		0 1
}

 
} ∆
BD:\MajorProject\Final Project\ECommerce\Interfaces\IUserService.cs
	namespace 	
	ECommerce
 
. 

Interfaces 
{ 
public 

	interface 
IUserService !
{ 

UserMaster 
AuthenticateUser #
(# $

UserMaster$ .
loginCredentials/ ?
)? @
;@ A
int		 
RegisterUser		 
(		 

UserMaster		 #
userData		$ ,
)		, -
;		- .
bool

 
CheckUserAvailabity

  
(

  !
string

! '
userName

( 0
)

0 1
;

1 2
List 
< 

UserMaster 
> 
GetUsers !
(! "
)" #
;# $
bool 
IsUserExists 
( 
int 
userId $
)$ %
;% &
} 
} ”
FD:\MajorProject\Final Project\ECommerce\Interfaces\IWishlistService.cs
	namespace 	
	ECommerce
 
. 

Interfaces 
{ 
public 	
	interface
 
IWishlistService $
{ 
void 
ToggleWishlistItem 
(  
int  #
userId$ *
,* +
int, /
bookId0 6
)6 7
;7 8
int 
ClearWishlist 
( 
int 
userId $
)$ %
;% &
string 
GetWishlistId 
( 
int  
userId! '
)' (
;( )
} 
}		 ‰ƒ
ID:\MajorProject\Final Project\ECommerce\Migrations\20220512050230_ecom.cs
	namespace 	
	ECommerce
 
. 

Migrations 
{ 
public 

partial 
class 
ecom 
: 
	Migration  )
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{		 	
migrationBuilder

 
.

 
CreateTable

 (
(

( )
name 
: 
$str 
, 
columns 
: 
table 
=> !
new" %
{ 
BookId 
= 
table "
." #
Column# )
<) *
int* -
>- .
(. /
nullable/ 7
:7 8
false9 >
)> ?
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
Title 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
nullable1 9
:9 :
true; ?
)? @
,@ A
Author 
= 
table "
." #
Column# )
<) *
string* 0
>0 1
(1 2
nullable2 :
:: ;
true< @
)@ A
,A B
Category 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
nullable4 <
:< =
true> B
)B C
,C D
Price 
= 
table !
.! "
Column" (
<( )
decimal) 0
>0 1
(1 2
nullable2 :
:: ;
false< A
)A B
,B C
CoverFileName !
=" #
table$ )
.) *
Column* 0
<0 1
string1 7
>7 8
(8 9
nullable9 A
:A B
trueC G
)G H
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% .
,. /
x0 1
=>2 4
x5 6
.6 7
BookId7 =
)= >
;> ?
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
, 
columns 
: 
table 
=> !
new" %
{ 
CartId 
= 
table "
." #
Column# )
<) *
string* 0
>0 1
(1 2
nullable2 :
:: ;
false< A
)A B
,B C
UserId   
=   
table   "
.  " #
Column  # )
<  ) *
int  * -
>  - .
(  . /
nullable  / 7
:  7 8
false  9 >
)  > ?
,  ? @
DateCreated!! 
=!!  !
table!!" '
.!!' (
Column!!( .
<!!. /
DateTime!!/ 7
>!!7 8
(!!8 9
nullable!!9 A
:!!A B
false!!C H
)!!H I
}"" 
,"" 
constraints## 
:## 
table## "
=>### %
{$$ 
table%% 
.%% 

PrimaryKey%% $
(%%$ %
$str%%% .
,%%. /
x%%0 1
=>%%2 4
x%%5 6
.%%6 7
CartId%%7 =
)%%= >
;%%> ?
}&& 
)&& 
;&& 
migrationBuilder(( 
.(( 
CreateTable(( (
(((( )
name)) 
:)) 
$str)) "
,))" #
columns** 
:** 
table** 
=>** !
new**" %
{++ 

CategoryId,, 
=,,  
table,,! &
.,,& '
Column,,' -
<,,- .
int,,. 1
>,,1 2
(,,2 3
nullable,,3 ;
:,,; <
false,,= B
),,B C
.-- 

Annotation-- #
(--# $
$str--$ 8
,--8 9
$str--: @
)--@ A
,--A B
CategoryName..  
=..! "
table..# (
...( )
Column..) /
<../ 0
string..0 6
>..6 7
(..7 8
nullable..8 @
:..@ A
true..B F
)..F G
}// 
,// 
constraints00 
:00 
table00 "
=>00# %
{11 
table22 
.22 

PrimaryKey22 $
(22$ %
$str22% 4
,224 5
x226 7
=>228 :
x22; <
.22< =

CategoryId22= G
)22G H
;22H I
}33 
)33 
;33 
migrationBuilder55 
.55 
CreateTable55 (
(55( )
name66 
:66 
$str66  
,66  !
columns77 
:77 
table77 
=>77 !
new77" %
{88 

UserTypeId99 
=99  
table99! &
.99& '
Column99' -
<99- .
int99. 1
>991 2
(992 3
nullable993 ;
:99; <
false99= B
)99B C
.:: 

Annotation:: #
(::# $
$str::$ 8
,::8 9
$str::: @
)::@ A
,::A B
UserTypeName;;  
=;;! "
table;;# (
.;;( )
Column;;) /
<;;/ 0
string;;0 6
>;;6 7
(;;7 8
nullable;;8 @
:;;@ A
true;;B F
);;F G
}<< 
,<< 
constraints== 
:== 
table== "
=>==# %
{>> 
table?? 
.?? 

PrimaryKey?? $
(??$ %
$str??% 2
,??2 3
x??4 5
=>??6 8
x??9 :
.??: ;

UserTypeId??; E
)??E F
;??F G
}@@ 
)@@ 
;@@ 
migrationBuilderBB 
.BB 
CreateTableBB (
(BB( )
nameCC 
:CC 
$strCC !
,CC! "
columnsDD 
:DD 
tableDD 
=>DD !
newDD" %
{EE 

CartItemIdFF 
=FF  
tableFF! &
.FF& '
ColumnFF' -
<FF- .
intFF. 1
>FF1 2
(FF2 3
nullableFF3 ;
:FF; <
falseFF= B
)FFB C
.GG 

AnnotationGG #
(GG# $
$strGG$ 8
,GG8 9
$strGG: @
)GG@ A
,GGA B
CartIdHH 
=HH 
tableHH "
.HH" #
ColumnHH# )
<HH) *
stringHH* 0
>HH0 1
(HH1 2
nullableHH2 :
:HH: ;
trueHH< @
)HH@ A
,HHA B
	ProductIdII 
=II 
tableII  %
.II% &
ColumnII& ,
<II, -
intII- 0
>II0 1
(II1 2
nullableII2 :
:II: ;
falseII< A
)IIA B
,IIB C
QuantityJJ 
=JJ 
tableJJ $
.JJ$ %
ColumnJJ% +
<JJ+ ,
intJJ, /
>JJ/ 0
(JJ0 1
nullableJJ1 9
:JJ9 :
falseJJ; @
)JJ@ A
}KK 
,KK 
constraintsLL 
:LL 
tableLL "
=>LL# %
{MM 
tableNN 
.NN 

PrimaryKeyNN $
(NN$ %
$strNN% 3
,NN3 4
xNN5 6
=>NN7 9
xNN: ;
.NN; <

CartItemIdNN< F
)NNF G
;NNG H
tableOO 
.OO 

ForeignKeyOO $
(OO$ %
namePP 
:PP 
$strPP 8
,PP8 9
columnQQ 
:QQ 
xQQ  !
=>QQ" $
xQQ% &
.QQ& '
CartIdQQ' -
,QQ- .
principalTableRR &
:RR& '
$strRR( .
,RR. /
principalColumnSS '
:SS' (
$strSS) 1
,SS1 2
onDeleteTT  
:TT  !
ReferentialActionTT" 3
.TT3 4
RestrictTT4 <
)TT< =
;TT= >
}UU 
)UU 
;UU 
migrationBuilderWW 
.WW 
CreateTableWW (
(WW( )
nameXX 
:XX 
$strXX "
,XX" #
columnsYY 
:YY 
tableYY 
=>YY !
newYY" %
{ZZ 
UserId[[ 
=[[ 
table[[ "
.[[" #
Column[[# )
<[[) *
int[[* -
>[[- .
([[. /
nullable[[/ 7
:[[7 8
false[[9 >
)[[> ?
.\\ 

Annotation\\ #
(\\# $
$str\\$ 8
,\\8 9
$str\\: @
)\\@ A
,\\A B
	FirstName]] 
=]] 
table]]  %
.]]% &
Column]]& ,
<]], -
string]]- 3
>]]3 4
(]]4 5
nullable]]5 =
:]]= >
true]]? C
)]]C D
,]]D E
LastName^^ 
=^^ 
table^^ $
.^^$ %
Column^^% +
<^^+ ,
string^^, 2
>^^2 3
(^^3 4
nullable^^4 <
:^^< =
true^^> B
)^^B C
,^^C D
Username__ 
=__ 
table__ $
.__$ %
Column__% +
<__+ ,
string__, 2
>__2 3
(__3 4
nullable__4 <
:__< =
true__> B
)__B C
,__C D
Password`` 
=`` 
table`` $
.``$ %
Column``% +
<``+ ,
string``, 2
>``2 3
(``3 4
nullable``4 <
:``< =
true``> B
)``B C
,``C D
Genderaa 
=aa 
tableaa "
.aa" #
Columnaa# )
<aa) *
stringaa* 0
>aa0 1
(aa1 2
nullableaa2 :
:aa: ;
trueaa< @
)aa@ A
,aaA B

UserTypeIdbb 
=bb  
tablebb! &
.bb& '
Columnbb' -
<bb- .
intbb. 1
>bb1 2
(bb2 3
nullablebb3 ;
:bb; <
falsebb= B
)bbB C
}cc 
,cc 
constraintsdd 
:dd 
tabledd "
=>dd# %
{ee 
tableff 
.ff 

PrimaryKeyff $
(ff$ %
$strff% 4
,ff4 5
xff6 7
=>ff8 :
xff; <
.ff< =
UserIdff= C
)ffC D
;ffD E
tablegg 
.gg 

ForeignKeygg $
(gg$ %
namehh 
:hh 
$strhh A
,hhA B
columnii 
:ii 
xii  !
=>ii" $
xii% &
.ii& '

UserTypeIdii' 1
,ii1 2
principalTablejj &
:jj& '
$strjj( 2
,jj2 3
principalColumnkk '
:kk' (
$strkk) 5
,kk5 6
onDeletell  
:ll  !
ReferentialActionll" 3
.ll3 4
Cascadell4 ;
)ll; <
;ll< =
}mm 
)mm 
;mm 
migrationBuilderoo 
.oo 
CreateTableoo (
(oo( )
namepp 
:pp 
$strpp &
,pp& '
columnsqq 
:qq 
tableqq 
=>qq !
newqq" %
{rr 
OrderIdss 
=ss 
tabless #
.ss# $
Columnss$ *
<ss* +
stringss+ 1
>ss1 2
(ss2 3
nullabless3 ;
:ss; <
falsess= B
)ssB C
,ssC D
UserIdtt 
=tt 
tablett "
.tt" #
Columntt# )
<tt) *
inttt* -
>tt- .
(tt. /
nullablett/ 7
:tt7 8
falsett9 >
)tt> ?
,tt? @
DateCreateduu 
=uu  !
tableuu" '
.uu' (
Columnuu( .
<uu. /
DateTimeuu/ 7
>uu7 8
(uu8 9
nullableuu9 A
:uuA B
falseuuC H
)uuH I
,uuI J
	CartTotalvv 
=vv 
tablevv  %
.vv% &
Columnvv& ,
<vv, -
decimalvv- 4
>vv4 5
(vv5 6
nullablevv6 >
:vv> ?
falsevv@ E
)vvE F
}ww 
,ww 
constraintsxx 
:xx 
tablexx "
=>xx# %
{yy 
tablezz 
.zz 

PrimaryKeyzz $
(zz$ %
$strzz% 8
,zz8 9
xzz: ;
=>zz< >
xzz? @
.zz@ A
OrderIdzzA H
)zzH I
;zzI J
table{{ 
.{{ 

ForeignKey{{ $
({{$ %
name|| 
:|| 
$str|| C
,||C D
column}} 
:}} 
x}}  !
=>}}" $
x}}% &
.}}& '
UserId}}' -
,}}- .
principalTable~~ &
:~~& '
$str~~( 4
,~~4 5
principalColumn '
:' (
$str) 1
,1 2
onDelete
ÄÄ  
:
ÄÄ  !
ReferentialAction
ÄÄ" 3
.
ÄÄ3 4
Cascade
ÄÄ4 ;
)
ÄÄ; <
;
ÄÄ< =
}
ÅÅ 
)
ÅÅ 
;
ÅÅ 
migrationBuilder
ÉÉ 
.
ÉÉ 
CreateTable
ÉÉ (
(
ÉÉ( )
name
ÑÑ 
:
ÑÑ 
$str
ÑÑ  
,
ÑÑ  !
columns
ÖÖ 
:
ÖÖ 
table
ÖÖ 
=>
ÖÖ !
new
ÖÖ" %
{
ÜÜ 

WishlistId
áá 
=
áá  
table
áá! &
.
áá& '
Column
áá' -
<
áá- .
string
áá. 4
>
áá4 5
(
áá5 6
nullable
áá6 >
:
áá> ?
false
áá@ E
)
ááE F
,
ááF G
UserId
àà 
=
àà 
table
àà "
.
àà" #
Column
àà# )
<
àà) *
int
àà* -
>
àà- .
(
àà. /
nullable
àà/ 7
:
àà7 8
false
àà9 >
)
àà> ?
,
àà? @
DateCreated
ââ 
=
ââ  !
table
ââ" '
.
ââ' (
Column
ââ( .
<
ââ. /
DateTime
ââ/ 7
>
ââ7 8
(
ââ8 9
nullable
ââ9 A
:
ââA B
false
ââC H
)
ââH I
}
ää 
,
ää 
constraints
ãã 
:
ãã 
table
ãã "
=>
ãã# %
{
åå 
table
çç 
.
çç 

PrimaryKey
çç $
(
çç$ %
$str
çç% 2
,
çç2 3
x
çç4 5
=>
çç6 8
x
çç9 :
.
çç: ;

WishlistId
çç; E
)
ççE F
;
ççF G
table
éé 
.
éé 

ForeignKey
éé $
(
éé$ %
name
èè 
:
èè 
$str
èè =
,
èè= >
column
êê 
:
êê 
x
êê  !
=>
êê" $
x
êê% &
.
êê& '
UserId
êê' -
,
êê- .
principalTable
ëë &
:
ëë& '
$str
ëë( 4
,
ëë4 5
principalColumn
íí '
:
íí' (
$str
íí) 1
,
íí1 2
onDelete
ìì  
:
ìì  !
ReferentialAction
ìì" 3
.
ìì3 4
Cascade
ìì4 ;
)
ìì; <
;
ìì< =
}
îî 
)
îî 
;
îî 
migrationBuilder
ññ 
.
ññ 
CreateTable
ññ (
(
ññ( )
name
óó 
:
óó 
$str
óó ,
,
óó, -
columns
òò 
:
òò 
table
òò 
=>
òò !
new
òò" %
{
ôô 
OrderDetailsId
öö "
=
öö# $
table
öö% *
.
öö* +
Column
öö+ 1
<
öö1 2
int
öö2 5
>
öö5 6
(
öö6 7
nullable
öö7 ?
:
öö? @
false
ööA F
)
ööF G
.
õõ 

Annotation
õõ #
(
õõ# $
$str
õõ$ 8
,
õõ8 9
$str
õõ: @
)
õõ@ A
,
õõA B
OrderId
úú 
=
úú 
table
úú #
.
úú# $
Column
úú$ *
<
úú* +
string
úú+ 1
>
úú1 2
(
úú2 3
nullable
úú3 ;
:
úú; <
true
úú= A
)
úúA B
,
úúB C
	ProductId
ùù 
=
ùù 
table
ùù  %
.
ùù% &
Column
ùù& ,
<
ùù, -
int
ùù- 0
>
ùù0 1
(
ùù1 2
nullable
ùù2 :
:
ùù: ;
false
ùù< A
)
ùùA B
,
ùùB C
Quantity
ûû 
=
ûû 
table
ûû $
.
ûû$ %
Column
ûû% +
<
ûû+ ,
int
ûû, /
>
ûû/ 0
(
ûû0 1
nullable
ûû1 9
:
ûû9 :
false
ûû; @
)
ûû@ A
,
ûûA B
Price
üü 
=
üü 
table
üü !
.
üü! "
Column
üü" (
<
üü( )
decimal
üü) 0
>
üü0 1
(
üü1 2
nullable
üü2 :
:
üü: ;
false
üü< A
)
üüA B
}
†† 
,
†† 
constraints
°° 
:
°° 
table
°° "
=>
°°# %
{
¢¢ 
table
££ 
.
££ 

PrimaryKey
££ $
(
££$ %
$str
££% >
,
££> ?
x
££@ A
=>
££B D
x
££E F
.
££F G
OrderDetailsId
££G U
)
££U V
;
££V W
table
§§ 
.
§§ 

ForeignKey
§§ $
(
§§$ %
name
•• 
:
•• 
$str
•• N
,
••N O
column
¶¶ 
:
¶¶ 
x
¶¶  !
=>
¶¶" $
x
¶¶% &
.
¶¶& '
OrderId
¶¶' .
,
¶¶. /
principalTable
ßß &
:
ßß& '
$str
ßß( 8
,
ßß8 9
principalColumn
®® '
:
®®' (
$str
®®) 2
,
®®2 3
onDelete
©©  
:
©©  !
ReferentialAction
©©" 3
.
©©3 4
Restrict
©©4 <
)
©©< =
;
©©= >
}
™™ 
)
™™ 
;
™™ 
migrationBuilder
¨¨ 
.
¨¨ 
CreateTable
¨¨ (
(
¨¨( )
name
≠≠ 
:
≠≠ 
$str
≠≠ %
,
≠≠% &
columns
ÆÆ 
:
ÆÆ 
table
ÆÆ 
=>
ÆÆ !
new
ÆÆ" %
{
ØØ 
WishlistItemId
∞∞ "
=
∞∞# $
table
∞∞% *
.
∞∞* +
Column
∞∞+ 1
<
∞∞1 2
int
∞∞2 5
>
∞∞5 6
(
∞∞6 7
nullable
∞∞7 ?
:
∞∞? @
false
∞∞A F
)
∞∞F G
.
±± 

Annotation
±± #
(
±±# $
$str
±±$ 8
,
±±8 9
$str
±±: @
)
±±@ A
,
±±A B

WishlistId
≤≤ 
=
≤≤  
table
≤≤! &
.
≤≤& '
Column
≤≤' -
<
≤≤- .
string
≤≤. 4
>
≤≤4 5
(
≤≤5 6
nullable
≤≤6 >
:
≤≤> ?
true
≤≤@ D
)
≤≤D E
,
≤≤E F
	ProductId
≥≥ 
=
≥≥ 
table
≥≥  %
.
≥≥% &
Column
≥≥& ,
<
≥≥, -
int
≥≥- 0
>
≥≥0 1
(
≥≥1 2
nullable
≥≥2 :
:
≥≥: ;
false
≥≥< A
)
≥≥A B
}
¥¥ 
,
¥¥ 
constraints
µµ 
:
µµ 
table
µµ "
=>
µµ# %
{
∂∂ 
table
∑∑ 
.
∑∑ 

PrimaryKey
∑∑ $
(
∑∑$ %
$str
∑∑% 7
,
∑∑7 8
x
∑∑9 :
=>
∑∑; =
x
∑∑> ?
.
∑∑? @
WishlistItemId
∑∑@ N
)
∑∑N O
;
∑∑O P
table
∏∏ 
.
∏∏ 

ForeignKey
∏∏ $
(
∏∏$ %
name
ππ 
:
ππ 
$str
ππ D
,
ππD E
column
∫∫ 
:
∫∫ 
x
∫∫  !
=>
∫∫" $
x
∫∫% &
.
∫∫& '

WishlistId
∫∫' 1
,
∫∫1 2
principalTable
ªª &
:
ªª& '
$str
ªª( 2
,
ªª2 3
principalColumn
ºº '
:
ºº' (
$str
ºº) 5
,
ºº5 6
onDelete
ΩΩ  
:
ΩΩ  !
ReferentialAction
ΩΩ" 3
.
ΩΩ3 4
Restrict
ΩΩ4 <
)
ΩΩ< =
;
ΩΩ= >
}
ææ 
)
ææ 
;
ææ 
migrationBuilder
¿¿ 
.
¿¿ 
CreateIndex
¿¿ (
(
¿¿( )
name
¡¡ 
:
¡¡ 
$str
¡¡ +
,
¡¡+ ,
table
¬¬ 
:
¬¬ 
$str
¬¬ "
,
¬¬" #
column
√√ 
:
√√ 
$str
√√  
)
√√  !
;
√√! "
migrationBuilder
≈≈ 
.
≈≈ 
CreateIndex
≈≈ (
(
≈≈( )
name
∆∆ 
:
∆∆ 
$str
∆∆ 7
,
∆∆7 8
table
«« 
:
«« 
$str
«« -
,
««- .
column
»» 
:
»» 
$str
»» !
)
»»! "
;
»»" #
migrationBuilder
   
.
   
CreateIndex
   (
(
  ( )
name
ÀÀ 
:
ÀÀ 
$str
ÀÀ 0
,
ÀÀ0 1
table
ÃÃ 
:
ÃÃ 
$str
ÃÃ '
,
ÃÃ' (
column
ÕÕ 
:
ÕÕ 
$str
ÕÕ  
)
ÕÕ  !
;
ÕÕ! "
migrationBuilder
œœ 
.
œœ 
CreateIndex
œœ (
(
œœ( )
name
–– 
:
–– 
$str
–– 0
,
––0 1
table
—— 
:
—— 
$str
—— #
,
——# $
column
““ 
:
““ 
$str
““ $
)
““$ %
;
““% &
migrationBuilder
‘‘ 
.
‘‘ 
CreateIndex
‘‘ (
(
‘‘( )
name
’’ 
:
’’ 
$str
’’ *
,
’’* +
table
÷÷ 
:
÷÷ 
$str
÷÷ !
,
÷÷! "
column
◊◊ 
:
◊◊ 
$str
◊◊  
)
◊◊  !
;
◊◊! "
migrationBuilder
ŸŸ 
.
ŸŸ 
CreateIndex
ŸŸ (
(
ŸŸ( )
name
⁄⁄ 
:
⁄⁄ 
$str
⁄⁄ 3
,
⁄⁄3 4
table
€€ 
:
€€ 
$str
€€ &
,
€€& '
column
‹‹ 
:
‹‹ 
$str
‹‹ $
)
‹‹$ %
;
‹‹% &
}
›› 	
	protected
ﬂﬂ 
override
ﬂﬂ 
void
ﬂﬂ 
Down
ﬂﬂ  $
(
ﬂﬂ$ %
MigrationBuilder
ﬂﬂ% 5
migrationBuilder
ﬂﬂ6 F
)
ﬂﬂF G
{
‡‡ 	
migrationBuilder
·· 
.
·· 
	DropTable
·· &
(
··& '
name
‚‚ 
:
‚‚ 
$str
‚‚ 
)
‚‚ 
;
‚‚ 
migrationBuilder
‰‰ 
.
‰‰ 
	DropTable
‰‰ &
(
‰‰& '
name
ÂÂ 
:
ÂÂ 
$str
ÂÂ !
)
ÂÂ! "
;
ÂÂ" #
migrationBuilder
ÁÁ 
.
ÁÁ 
	DropTable
ÁÁ &
(
ÁÁ& '
name
ËË 
:
ËË 
$str
ËË "
)
ËË" #
;
ËË# $
migrationBuilder
ÍÍ 
.
ÍÍ 
	DropTable
ÍÍ &
(
ÍÍ& '
name
ÎÎ 
:
ÎÎ 
$str
ÎÎ ,
)
ÎÎ, -
;
ÎÎ- .
migrationBuilder
ÌÌ 
.
ÌÌ 
	DropTable
ÌÌ &
(
ÌÌ& '
name
ÓÓ 
:
ÓÓ 
$str
ÓÓ %
)
ÓÓ% &
;
ÓÓ& '
migrationBuilder
 
.
 
	DropTable
 &
(
& '
name
ÒÒ 
:
ÒÒ 
$str
ÒÒ 
)
ÒÒ 
;
ÒÒ 
migrationBuilder
ÛÛ 
.
ÛÛ 
	DropTable
ÛÛ &
(
ÛÛ& '
name
ÙÙ 
:
ÙÙ 
$str
ÙÙ &
)
ÙÙ& '
;
ÙÙ' (
migrationBuilder
ˆˆ 
.
ˆˆ 
	DropTable
ˆˆ &
(
ˆˆ& '
name
˜˜ 
:
˜˜ 
$str
˜˜  
)
˜˜  !
;
˜˜! "
migrationBuilder
˘˘ 
.
˘˘ 
	DropTable
˘˘ &
(
˘˘& '
name
˙˙ 
:
˙˙ 
$str
˙˙ "
)
˙˙" #
;
˙˙# $
migrationBuilder
¸¸ 
.
¸¸ 
	DropTable
¸¸ &
(
¸¸& '
name
˝˝ 
:
˝˝ 
$str
˝˝  
)
˝˝  !
;
˝˝! "
}
˛˛ 	
}
ˇˇ 
}ÄÄ ›	
6D:\MajorProject\Final Project\ECommerce\Models\Book.cs
	namespace 	
	ECommerce
 
. 
Models 
{ 
public 

partial 
class 
Book 
{ 
[		 	
Key			 
]		 
public

 
int

 
BookId

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Author 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Category 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
CoverFileName #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} é
6D:\MajorProject\Final Project\ECommerce\Models\Cart.cs
	namespace 	
	ECommerce
 
. 
Models 
{ 
public 

partial 
class 
Cart 
{		 
[

 	
Key

	 
]

 
public 
string 
CartId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
DateTime 
DateCreated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ´	
;D:\MajorProject\Final Project\ECommerce\Models\CartItems.cs
	namespace 	
	ECommerce
 
. 
Models 
{ 
public 

partial 
class 
	CartItems "
{		 
[

 	
Key

	 
]

 
public 
int 

CartItemId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	

ForeignKey	 
( 
$str 
) 
] 
public 
string 
CartId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Cart 
Carts 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
Quantity 
{ 
get !
;! "
set# &
;& '
}( )
} 
} É
<D:\MajorProject\Final Project\ECommerce\Models\Categories.cs
	namespace 	
	ECommerce
 
. 
Models 
{ 
public 

partial 
class 

Categories #
{ 
[		 	
Key			 
]		 
public

 
int

 

CategoryId

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
string 
CategoryName "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} Ú

FD:\MajorProject\Final Project\ECommerce\Models\CustomerOrderDetails.cs
	namespace 	
	ECommerce
 
. 
Models 
{ 
public 

partial 
class  
CustomerOrderDetails -
{		 
[

 	
Key

	 
]

 
public 
int 
OrderDetailsId !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	

ForeignKey	 
( 
$str #
)# $
]$ %
public 
string 
OrderId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
CustomerOrders 
CustomerOrder +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
Quantity 
{ 
get !
;! "
set# &
;& '
}( )
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ƒ	
@D:\MajorProject\Final Project\ECommerce\Models\CustomerOrders.cs
	namespace 	
	ECommerce
 
. 
Models 
{ 
public 

partial 
class 
CustomerOrders '
{		 
[

 	
Key

	 
]

 
public 
string 
OrderId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	

ForeignKey	 
( 
$str 
) 
] 
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 

UserMaster 
Users 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
DateCreated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
decimal 
	CartTotal  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ƒ
?D:\MajorProject\Final Project\ECommerce\Models\EComDBContext.cs
	namespace 	
	ECommerce
 
. 
Models 
{ 
public 

partial 
class 
EComDBContext &
:' (
	DbContext) 2
{ 
public		 
EComDBContext		 
(		 
)		 
{

 	
} 	
public 
EComDBContext 
( 
DbContextOptions -
<- .
EComDBContext. ;
>; <
options= D
)D E
: 
base 
( 
options 
) 
{ 	
} 	
public 
virtual 
DbSet 
< 
Book !
>! "
Book# '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
virtual 
DbSet 
< 
Cart !
>! "
Cart# '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
virtual 
DbSet 
< 
	CartItems &
>& '
	CartItems( 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
virtual 
DbSet 
< 

Categories '
>' (

Categories) 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
virtual 
DbSet 
<  
CustomerOrderDetails 1
>1 2 
CustomerOrderDetails3 G
{H I
getJ M
;M N
setO R
;R S
}T U
public 
virtual 
DbSet 
< 
CustomerOrders +
>+ ,
CustomerOrders- ;
{< =
get> A
;A B
setC F
;F G
}H I
public 
virtual 
DbSet 
< 

UserMaster '
>' (

UserMaster) 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
virtual 
DbSet 
< 
UserType %
>% &
UserType' /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
virtual 
DbSet 
< 
Wishlist %
>% &
Wishlist' /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
virtual 
DbSet 
< 
WishlistItems *
>* +
WishlistItems, 9
{: ;
get< ?
;? @
setA D
;D E
}F G
	protected 
override 
void 
OnConfiguring  -
(- .#
DbContextOptionsBuilder. E
optionsBuilderF T
)T U
{   	
}!! 	
}"" 
}$$ Ê

:D:\MajorProject\Final Project\ECommerce\Models\Policies.cs
	namespace 	
	ECommerce
 
. 
Models 
{ 
public 

static 
class 
Policies  
{ 
public 
static 
AuthorizationPolicy )
AdminPolicy* 5
(5 6
)6 7
{ 	
return		 
new		 &
AuthorizationPolicyBuilder		 1
(		1 2
)		2 3
.		3 4$
RequireAuthenticatedUser		4 L
(		L M
)		M N
.

3 4
RequireRole

4 ?
(

? @
	UserRoles

@ I
.

I J
Admin

J O
)

O P
.3 4
Build4 9
(9 :
): ;
;; <
} 	
public 
static 
AuthorizationPolicy )

UserPolicy* 4
(4 5
)5 6
{ 	
return 
new &
AuthorizationPolicyBuilder 1
(1 2
)2 3
.3 4$
RequireAuthenticatedUser4 L
(L M
)M N
.3 4
RequireRole4 ?
(? @
	UserRoles@ I
.I J
UserJ N
)N O
.3 4
Build4 9
(9 :
): ;
;; <
} 	
} 
} ä
<D:\MajorProject\Final Project\ECommerce\Models\UserMaster.cs
	namespace 	
	ECommerce
 
. 
Models 
{ 
public		 

partial		 
class		 

UserMaster		 #
{

 
[ 	
Key	 
] 
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Gender 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	

ForeignKey	 
( 
$str 
)  
]  !
public 
int 

UserTypeId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
UserType 
	UserTypes !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ë
;D:\MajorProject\Final Project\ECommerce\Models\UserRoles.cs
	namespace 	
	ECommerce
 
. 
Models 
{ 
public 

static 
class 
	UserRoles !
{		 
public

 
const

 
string

 
Admin

 !
=

" #
$str

$ '
;

' (
public 
const 
string 
User  
=! "
$str# &
;& '
} 
} ·
:D:\MajorProject\Final Project\ECommerce\Models\UserType.cs
	namespace 	
	ECommerce
 
. 
Models 
{ 
public 

partial 
class 
UserType !
{ 
internal		 
static		 
int		 

userTypeId		 &
;		& '
[ 	
Key	 
] 
public 
int 

UserTypeId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
UserTypeName "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ù
:D:\MajorProject\Final Project\ECommerce\Models\Wishlist.cs
	namespace 	
	ECommerce
 
. 
Models 
{ 
public 

partial 
class 
Wishlist !
{		 
[

 	
Key

	 
]

 
public 
string 

WishlistId  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	

ForeignKey	 
( 
$str 
) 
] 
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 

UserMaster 
Users 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
DateCreated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ™
?D:\MajorProject\Final Project\ECommerce\Models\WishlistItems.cs
	namespace 	
	ECommerce
 
. 
Models 
{ 
public 

partial 
class 
WishlistItems &
{		 
[

 	
Key

	 
]

 
public 
int 
WishlistItemId !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	

ForeignKey	 
( 
$str 
)  
]  !
public 
string 

WishlistId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
Wishlist 
	Wishlists !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} â

2D:\MajorProject\Final Project\ECommerce\Program.cs
	namespace

 	
	ECommerce


 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} √W
DD:\MajorProject\Final Project\ECommerce\Repository\BookRepository.cs
	namespace

 	
	ECommerce


 
.

 

Repository

 
{ 
public 

class 
BookRepository 
:  !
IBookService" .
{ 
readonly 
EComDBContext 

_dbContext )
;) *
public 
BookRepository 
( 
EComDBContext +
	dbContext, 5
)5 6
{ 	

_dbContext 
= 
	dbContext "
;" #
} 	
public 
List 
< 
Book 
> 
GetAllBooks %
(% &
)& '
{ 	
try 
{ 
return 

_dbContext !
.! "
Book" &
.& '
AsNoTracking' 3
(3 4
)4 5
.5 6
ToList6 <
(< =
)= >
;> ?
} 
catch 
{ 
throw 
; 
} 
}   	
public## 
int## 
AddBook## 
(## 
Book## 
book##  $
)##$ %
{$$ 	
try%% 
{&& 

_dbContext'' 
.'' 
Book'' 
.''  
Add''  #
(''# $
book''$ (
)''( )
;'') *

_dbContext(( 
.(( 
SaveChanges(( &
(((& '
)((' (
;((( )
return** 
$num** 
;** 
}++ 
catch,, 
{-- 
throw.. 
;.. 
}// 
}00 	
public33 
int33 

UpdateBook33 
(33 
Book33 "
book33# '
)33' (
{44 	
try55 
{66 
Book77 
oldBookData77  
=77! "
GetBookData77# .
(77. /
book77/ 3
.773 4
BookId774 :
)77: ;
;77; <
if99 
(99 
oldBookData99 
.99  
CoverFileName99  -
!=99. 0
null991 5
)995 6
{:: 
if;; 
(;; 
book;; 
.;; 
CoverFileName;; *
==;;+ -
null;;. 2
);;2 3
{<< 
book== 
.== 
CoverFileName== *
===+ ,
oldBookData==- 8
.==8 9
CoverFileName==9 F
;==F G
}>> 
}?? 

_dbContextAA 
.AA 
EntryAA  
(AA  !
bookAA! %
)AA% &
.AA& '
StateAA' ,
=AA- .
EntityStateAA/ :
.AA: ;
ModifiedAA; C
;AAC D

_dbContextBB 
.BB 
SaveChangesBB &
(BB& '
)BB' (
;BB( )
returnDD 
$numDD 
;DD 
}EE 
catchFF 
{GG 
throwHH 
;HH 
}II 
}JJ 	
publicMM 
BookMM 
GetBookDataMM 
(MM  
intMM  #
bookIdMM$ *
)MM* +
{NN 	
tryOO 
{PP 
BookQQ 
bookQQ 
=QQ 

_dbContextQQ &
.QQ& '
BookQQ' +
.QQ+ ,
FirstOrDefaultQQ, :
(QQ: ;
xQQ; <
=>QQ= ?
xQQ@ A
.QQA B
BookIdQQB H
==QQI K
bookIdQQL R
)QQR S
;QQS T
ifRR 
(RR 
bookRR 
!=RR 
nullRR  
)RR  !
{SS 

_dbContextTT 
.TT 
EntryTT $
(TT$ %
bookTT% )
)TT) *
.TT* +
StateTT+ 0
=TT1 2
EntityStateTT3 >
.TT> ?
DetachedTT? G
;TTG H
returnUU 
bookUU 
;UU  
}VV 
returnWW 
nullWW 
;WW 
}XX 
catchYY 
{ZZ 
throw[[ 
;[[ 
}\\ 
}]] 	
public`` 
string`` 

DeleteBook``  
(``  !
int``! $
bookId``% +
)``+ ,
{aa 	
trybb 
{cc 
Bookdd 
bookdd 
=dd 

_dbContextdd &
.dd& '
Bookdd' +
.dd+ ,
Finddd, 0
(dd0 1
bookIddd1 7
)dd7 8
;dd8 9

_dbContextee 
.ee 
Bookee 
.ee  
Removeee  &
(ee& '
bookee' +
)ee+ ,
;ee, -

_dbContextff 
.ff 
SaveChangesff &
(ff& '
)ff' (
;ff( )
returnhh 
(hh 
bookhh 
.hh 
CoverFileNamehh *
)hh* +
;hh+ ,
}ii 
catchjj 
{kk 
throwll 
;ll 
}mm 
}nn 	
publicqq 
Listqq 
<qq 

Categoriesqq 
>qq 
GetCategoriesqq  -
(qq- .
)qq. /
{rr 	
Listss 
<ss 

Categoriesss 
>ss 
lstCategoriesss *
=ss+ ,
newss- 0
Listss1 5
<ss5 6

Categoriesss6 @
>ss@ A
(ssA B
)ssB C
;ssC D
lstCategoriestt 
=tt 
(tt 
fromtt !
CategoriesListtt" 0
intt1 3

_dbContexttt4 >
.tt> ?

Categoriestt? I
selectttJ P
CategoriesListttQ _
)tt_ `
.tt` a
ToListtta g
(ttg h
)tth i
;tti j
returnvv 
lstCategoriesvv  
;vv  !
}ww 	
publiczz 
Listzz 
<zz 
Bookzz 
>zz 
GetSimilarBookszz )
(zz) *
intzz* -
bookIdzz. 4
)zz4 5
{{{ 	
List|| 
<|| 
Book|| 
>|| 
lstBook|| 
=||  
new||! $
List||% )
<||) *
Book||* .
>||. /
(||/ 0
)||0 1
;||1 2
Book}} 
book}} 
=}} 
GetBookData}} #
(}}# $
bookId}}$ *
)}}* +
;}}+ ,
lstBook 
= 

_dbContext  
.  !
Book! %
.% &
Where& +
(+ ,
x, -
=>. 0
x1 2
.2 3
Category3 ;
==< >
book? C
.C D
CategoryD L
&&M O
xP Q
.Q R
BookIdR X
!=Y [
book\ `
.` a
BookIda g
)g h
.
ÄÄ 
OrderBy
ÄÄ 
(
ÄÄ 
u
ÄÄ 
=>
ÄÄ 
Guid
ÄÄ "
.
ÄÄ" #
NewGuid
ÄÄ# *
(
ÄÄ* +
)
ÄÄ+ ,
)
ÄÄ, -
.
ÅÅ 
Take
ÅÅ 
(
ÅÅ 
$num
ÅÅ 
)
ÅÅ 
.
ÇÇ 
ToList
ÇÇ 
(
ÇÇ 
)
ÇÇ 
;
ÇÇ 
return
ÉÉ 
lstBook
ÉÉ 
;
ÉÉ 
}
ÑÑ 	
public
ÜÜ 
List
ÜÜ 
<
ÜÜ 
CartItemDto
ÜÜ 
>
ÜÜ  %
GetBooksAvailableInCart
ÜÜ! 8
(
ÜÜ8 9
string
ÜÜ9 ?
cartID
ÜÜ@ F
)
ÜÜF G
{
áá 	
try
àà 
{
ââ 
List
ää 
<
ää 
CartItemDto
ää  
>
ää  !
cartItemList
ää" .
=
ää/ 0
new
ää1 4
List
ää5 9
<
ää9 :
CartItemDto
ää: E
>
ääE F
(
ääF G
)
ääG H
;
ääH I
List
ãã 
<
ãã 
	CartItems
ãã 
>
ãã 
	cartItems
ãã  )
=
ãã* +

_dbContext
ãã, 6
.
ãã6 7
	CartItems
ãã7 @
.
ãã@ A
Where
ããA F
(
ããF G
x
ããG H
=>
ããI K
x
ããL M
.
ããM N
CartId
ããN T
==
ããU W
cartID
ããX ^
)
ãã^ _
.
ãã_ `
ToList
ãã` f
(
ããf g
)
ããg h
;
ããh i
foreach
çç 
(
çç 
	CartItems
çç "
item
çç# '
in
çç( *
	cartItems
çç+ 4
)
çç4 5
{
éé 
Book
èè 
book
èè 
=
èè 
GetBookData
èè  +
(
èè+ ,
item
èè, 0
.
èè0 1
	ProductId
èè1 :
)
èè: ;
;
èè; <
CartItemDto
êê 
objCartItem
êê  +
=
êê, -
new
êê. 1
CartItemDto
êê2 =
{
ëë 
Book
íí 
=
íí 
book
íí #
,
íí# $
Quantity
ìì  
=
ìì! "
item
ìì# '
.
ìì' (
Quantity
ìì( 0
}
îî 
;
îî 
cartItemList
ññ  
.
ññ  !
Add
ññ! $
(
ññ$ %
objCartItem
ññ% 0
)
ññ0 1
;
ññ1 2
}
óó 
return
òò 
cartItemList
òò #
;
òò# $
}
ôô 
catch
öö 
{
õõ 
throw
úú 
;
úú 
}
ùù 
}
ûû 	
public
†† 
List
†† 
<
†† 
Book
†† 
>
†† )
GetBooksAvailableInWishlist
†† 5
(
††5 6
string
††6 <

wishlistID
††= G
)
††G H
{
°° 	
try
¢¢ 
{
££ 
List
§§ 
<
§§ 
Book
§§ 
>
§§ 
wishlist
§§ #
=
§§$ %
new
§§& )
List
§§* .
<
§§. /
Book
§§/ 3
>
§§3 4
(
§§4 5
)
§§5 6
;
§§6 7
List
•• 
<
•• 
WishlistItems
•• "
>
••" #
	cartItems
••$ -
=
••. /

_dbContext
••0 :
.
••: ;
WishlistItems
••; H
.
••H I
Where
••I N
(
••N O
x
••O P
=>
••Q S
x
••T U
.
••U V

WishlistId
••V `
==
••a c

wishlistID
••d n
)
••n o
.
••o p
ToList
••p v
(
••v w
)
••w x
;
••x y
foreach
ßß 
(
ßß 
WishlistItems
ßß &
item
ßß' +
in
ßß, .
	cartItems
ßß/ 8
)
ßß8 9
{
®® 
Book
©© 
book
©© 
=
©© 
GetBookData
©©  +
(
©©+ ,
item
©©, 0
.
©©0 1
	ProductId
©©1 :
)
©©: ;
;
©©; <
wishlist
™™ 
.
™™ 
Add
™™  
(
™™  !
book
™™! %
)
™™% &
;
™™& '
}
´´ 
return
¨¨ 
wishlist
¨¨ 
;
¨¨  
}
≠≠ 
catch
ÆÆ 
{
ØØ 
throw
∞∞ 
;
∞∞ 
}
±± 
}
≤≤ 	
}
≥≥ 
}¥¥ ÷u
DD:\MajorProject\Final Project\ECommerce\Repository\CartRepository.cs
	namespace 	
	ECommerce
 
. 

RePository 
{		 
public

 

class

 
CartRepository

 
:

  !
ICartService

" .
{ 
readonly 
EComDBContext 

_dbContext )
;) *
public 
CartRepository 
( 
EComDBContext +
	dbContext, 5
)5 6
{ 	

_dbContext 
= 
	dbContext "
;" #
} 	
public 
void 
AddBookToCart !
(! "
int" %
userId& ,
,, -
int. 1
bookId2 8
)8 9
{ 	
string 
cartId 
= 
	GetCartId %
(% &
userId& ,
), -
;- .
int 
quantity 
= 
$num 
; 
	CartItems 
existingCartItem &
=' (

_dbContext) 3
.3 4
	CartItems4 =
.= >
FirstOrDefault> L
(L M
xM N
=>O Q
xR S
.S T
	ProductIdT ]
==^ `
bookIda g
&&h j
xk l
.l m
CartIdm s
==t v
cartIdw }
)} ~
;~ 
if 
( 
existingCartItem  
!=! #
null$ (
)( )
{ 
existingCartItem  
.  !
Quantity! )
+=* ,
$num- .
;. /

_dbContext 
. 
Entry  
(  !
existingCartItem! 1
)1 2
.2 3
State3 8
=9 :
EntityState; F
.F G
ModifiedG O
;O P

_dbContext 
. 
SaveChanges &
(& '
)' (
;( )
} 
else   
{!! 
	CartItems"" 
	cartItems"" #
=""$ %
new""& )
	CartItems""* 3
{## 
CartId$$ 
=$$ 
cartId$$ #
,$$# $
	ProductId%% 
=%% 
bookId%%  &
,%%& '
Quantity&& 
=&& 
quantity&& '
}'' 
;'' 

_dbContext(( 
.(( 
	CartItems(( $
.(($ %
Add((% (
(((( )
	cartItems(() 2
)((2 3
;((3 4

_dbContext)) 
.)) 
SaveChanges)) &
())& '
)))' (
;))( )
}** 
}++ 	
public-- 
string-- 
	GetCartId-- 
(--  
int--  #
userId--$ *
)--* +
{.. 	
try// 
{00 
Cart11 
cart11 
=11 

_dbContext11 &
.11& '
Cart11' +
.11+ ,
FirstOrDefault11, :
(11: ;
x11; <
=>11= ?
x11@ A
.11A B
UserId11B H
==11I K
userId11L R
)11R S
;11S T
if33 
(33 
cart33 
!=33 
null33  
)33  !
{44 
return55 
cart55 
.55  
CartId55  &
;55& '
}66 
else77 
{88 
return99 

CreateCart99 %
(99% &
userId99& ,
)99, -
;99- .
}:: 
}<< 
catch== 
{>> 
throw?? 
;?? 
}@@ 
}AA 	
stringCC 

CreateCartCC 
(CC 
intCC 
userIdCC $
)CC$ %
{DD 	
tryEE 
{FF 
CartGG 
shoppingCartGG !
=GG" #
newGG$ '
CartGG( ,
{HH 
CartIdII 
=II 
GuidII !
.II! "
NewGuidII" )
(II) *
)II* +
.II+ ,
ToStringII, 4
(II4 5
)II5 6
,II6 7
UserIdJJ 
=JJ 
userIdJJ #
,JJ# $
DateCreatedKK 
=KK  !
DateTimeKK" *
.KK* +
NowKK+ .
.KK. /
DateKK/ 3
}LL 
;LL 

_dbContextNN 
.NN 
CartNN 
.NN  
AddNN  #
(NN# $
shoppingCartNN$ 0
)NN0 1
;NN1 2

_dbContextOO 
.OO 
SaveChangesOO &
(OO& '
)OO' (
;OO( )
returnQQ 
shoppingCartQQ #
.QQ# $
CartIdQQ$ *
;QQ* +
}RR 
catchSS 
{TT 
throwUU 
;UU 
}VV 
}WW 	
publicYY 
voidYY 
RemoveCartItemYY "
(YY" #
intYY# &
userIdYY' -
,YY- .
intYY/ 2
bookIdYY3 9
)YY9 :
{ZZ 	
try[[ 
{\\ 
string]] 
cartId]] 
=]] 
	GetCartId]]  )
(]]) *
userId]]* 0
)]]0 1
;]]1 2
	CartItems^^ 
cartItem^^ "
=^^# $

_dbContext^^% /
.^^/ 0
	CartItems^^0 9
.^^9 :
FirstOrDefault^^: H
(^^H I
x^^I J
=>^^K M
x^^N O
.^^O P
	ProductId^^P Y
==^^Z \
bookId^^] c
&&^^d f
x^^g h
.^^h i
CartId^^i o
==^^p r
cartId^^s y
)^^y z
;^^z {

_dbContext`` 
.`` 
	CartItems`` $
.``$ %
Remove``% +
(``+ ,
cartItem``, 4
)``4 5
;``5 6

_dbContextaa 
.aa 
SaveChangesaa &
(aa& '
)aa' (
;aa( )
}bb 
catchcc 
{dd 
throwee 
;ee 
}ff 
}gg 	
publicii 
voidii 
DeleteOneCartItemii %
(ii% &
intii& )
userIdii* 0
,ii0 1
intii2 5
bookIdii6 <
)ii< =
{jj 	
trykk 
{ll 
stringmm 
cartIdmm 
=mm 
	GetCartIdmm  )
(mm) *
userIdmm* 0
)mm0 1
;mm1 2
	CartItemsnn 
cartItemnn "
=nn# $

_dbContextnn% /
.nn/ 0
	CartItemsnn0 9
.nn9 :
FirstOrDefaultnn: H
(nnH I
xnnI J
=>nnK M
xnnN O
.nnO P
	ProductIdnnP Y
==nnZ \
bookIdnn] c
&&nnd f
xnng h
.nnh i
CartIdnni o
==nnp r
cartIdnns y
)nny z
;nnz {
cartItempp 
.pp 
Quantitypp !
-=pp" $
$numpp% &
;pp& '

_dbContextqq 
.qq 
Entryqq  
(qq  !
cartItemqq! )
)qq) *
.qq* +
Stateqq+ 0
=qq1 2
EntityStateqq3 >
.qq> ?
Modifiedqq? G
;qqG H

_dbContextrr 
.rr 
SaveChangesrr &
(rr& '
)rr' (
;rr( )
}ss 
catchtt 
{uu 
throwvv 
;vv 
}ww 
}xx 	
publiczz 
intzz 
GetCartItemCountzz #
(zz# $
intzz$ '
userIdzz( .
)zz. /
{{{ 	
string|| 
cartId|| 
=|| 
	GetCartId|| %
(||% &
userId||& ,
)||, -
;||- .
if~~ 
(~~ 
!~~ 
string~~ 
.~~ 
IsNullOrEmpty~~ %
(~~% &
cartId~~& ,
)~~, -
)~~- .
{ 
int
ÄÄ 
cartItemCount
ÄÄ !
=
ÄÄ" #

_dbContext
ÄÄ$ .
.
ÄÄ. /
	CartItems
ÄÄ/ 8
.
ÄÄ8 9
Where
ÄÄ9 >
(
ÄÄ> ?
x
ÄÄ? @
=>
ÄÄA C
x
ÄÄD E
.
ÄÄE F
CartId
ÄÄF L
==
ÄÄM O
cartId
ÄÄP V
)
ÄÄV W
.
ÄÄW X
Sum
ÄÄX [
(
ÄÄ[ \
x
ÄÄ\ ]
=>
ÄÄ^ `
x
ÄÄa b
.
ÄÄb c
Quantity
ÄÄc k
)
ÄÄk l
;
ÄÄl m
return
ÇÇ 
cartItemCount
ÇÇ $
;
ÇÇ$ %
}
ÉÉ 
else
ÑÑ 
{
ÖÖ 
return
ÜÜ 
$num
ÜÜ 
;
ÜÜ 
}
áá 
}
àà 	
public
ää 
void
ää 
	MergeCart
ää 
(
ää 
int
ää !

tempUserId
ää" ,
,
ää, -
int
ää. 1

permUserId
ää2 <
)
ää< =
{
ãã 	
try
åå 
{
çç 
if
éé 
(
éé 

tempUserId
éé 
!=
éé !

permUserId
éé" ,
&&
éé- /

tempUserId
éé0 :
>
éé; <
$num
éé= >
&&
éé? A

permUserId
ééB L
>
ééM N
$num
ééO P
)
ééP Q
{
èè 
string
êê 

tempCartId
êê %
=
êê& '
	GetCartId
êê( 1
(
êê1 2

tempUserId
êê2 <
)
êê< =
;
êê= >
string
ëë 

permCartId
ëë %
=
ëë& '
	GetCartId
ëë( 1
(
ëë1 2

permUserId
ëë2 <
)
ëë< =
;
ëë= >
List
ìì 
<
ìì 
	CartItems
ìì "
>
ìì" #
tempCartItems
ìì$ 1
=
ìì2 3

_dbContext
ìì4 >
.
ìì> ?
	CartItems
ìì? H
.
ììH I
Where
ììI N
(
ììN O
x
ììO P
=>
ììQ S
x
ììT U
.
ììU V
CartId
ììV \
==
ìì] _

tempCartId
ìì` j
)
ììj k
.
ììk l
ToList
ììl r
(
ììr s
)
ììs t
;
ììt u
foreach
ïï 
(
ïï 
	CartItems
ïï &
item
ïï' +
in
ïï, .
tempCartItems
ïï/ <
)
ïï< =
{
ññ 
	CartItems
óó !
cartItem
óó" *
=
óó+ ,

_dbContext
óó- 7
.
óó7 8
	CartItems
óó8 A
.
óóA B
FirstOrDefault
óóB P
(
óóP Q
x
óóQ R
=>
óóS U
x
óóV W
.
óóW X
	ProductId
óóX a
==
óób d
item
óóe i
.
óói j
	ProductId
óój s
&&
óót v
x
óów x
.
óóx y
CartId
óóy 
==óóÄ Ç

permCartIdóóÉ ç
)óóç é
;óóé è
if
ôô 
(
ôô 
cartItem
ôô $
!=
ôô% '
null
ôô( ,
)
ôô, -
{
öö 
cartItem
õõ $
.
õõ$ %
Quantity
õõ% -
+=
õõ. 0
item
õõ1 5
.
õõ5 6
Quantity
õõ6 >
;
õõ> ?

_dbContext
úú &
.
úú& '
Entry
úú' ,
(
úú, -
cartItem
úú- 5
)
úú5 6
.
úú6 7
State
úú7 <
=
úú= >
EntityState
úú? J
.
úúJ K
Modified
úúK S
;
úúS T
}
ùù 
else
ûû 
{
üü 
	CartItems
†† %
newCartItem
††& 1
=
††2 3
new
††4 7
	CartItems
††8 A
{
°° 
CartId
¢¢  &
=
¢¢' (

permCartId
¢¢) 3
,
¢¢3 4
	ProductId
££  )
=
££* +
item
££, 0
.
££0 1
	ProductId
££1 :
,
££: ;
Quantity
§§  (
=
§§) *
item
§§+ /
.
§§/ 0
Quantity
§§0 8
}
•• 
;
•• 

_dbContext
¶¶ &
.
¶¶& '
	CartItems
¶¶' 0
.
¶¶0 1
Add
¶¶1 4
(
¶¶4 5
newCartItem
¶¶5 @
)
¶¶@ A
;
¶¶A B
}
ßß 

_dbContext
®® "
.
®®" #
	CartItems
®®# ,
.
®®, -
Remove
®®- 3
(
®®3 4
item
®®4 8
)
®®8 9
;
®®9 :

_dbContext
©© "
.
©©" #
SaveChanges
©©# .
(
©©. /
)
©©/ 0
;
©©0 1
}
™™ 

DeleteCart
´´ 
(
´´ 

tempCartId
´´ )
)
´´) *
;
´´* +
}
¨¨ 
}
≠≠ 
catch
ÆÆ 
{
ØØ 
throw
∞∞ 
;
∞∞ 
}
±± 
}
≤≤ 	
public
¥¥ 
int
¥¥ 
	ClearCart
¥¥ 
(
¥¥ 
int
¥¥  
userId
¥¥! '
)
¥¥' (
{
µµ 	
try
∂∂ 
{
∑∑ 
string
∏∏ 
cartId
∏∏ 
=
∏∏ 
	GetCartId
∏∏  )
(
∏∏) *
userId
∏∏* 0
)
∏∏0 1
;
∏∏1 2
List
ππ 
<
ππ 
	CartItems
ππ 
>
ππ 
cartItem
ππ  (
=
ππ) *

_dbContext
ππ+ 5
.
ππ5 6
	CartItems
ππ6 ?
.
ππ? @
Where
ππ@ E
(
ππE F
x
ππF G
=>
ππH J
x
ππK L
.
ππL M
CartId
ππM S
==
ππT V
cartId
ππW ]
)
ππ] ^
.
ππ^ _
ToList
ππ_ e
(
ππe f
)
ππf g
;
ππg h
if
ªª 
(
ªª 
!
ªª 
string
ªª 
.
ªª 
IsNullOrEmpty
ªª )
(
ªª) *
cartId
ªª* 0
)
ªª0 1
)
ªª1 2
{
ºº 
foreach
ΩΩ 
(
ΩΩ 
	CartItems
ΩΩ &
item
ΩΩ' +
in
ΩΩ, .
cartItem
ΩΩ/ 7
)
ΩΩ7 8
{
ææ 

_dbContext
øø "
.
øø" #
	CartItems
øø# ,
.
øø, -
Remove
øø- 3
(
øø3 4
item
øø4 8
)
øø8 9
;
øø9 :

_dbContext
¿¿ "
.
¿¿" #
SaveChanges
¿¿# .
(
¿¿. /
)
¿¿/ 0
;
¿¿0 1
}
¡¡ 
}
¬¬ 
return
√√ 
$num
√√ 
;
√√ 
}
ƒƒ 
catch
≈≈ 
{
∆∆ 
throw
«« 
;
«« 
}
»» 
}
…… 	
void
ÀÀ 

DeleteCart
ÀÀ 
(
ÀÀ 
string
ÀÀ 
cartId
ÀÀ %
)
ÀÀ% &
{
ÃÃ 	
Cart
ÕÕ 
cart
ÕÕ 
=
ÕÕ 

_dbContext
ÕÕ "
.
ÕÕ" #
Cart
ÕÕ# '
.
ÕÕ' (
Find
ÕÕ( ,
(
ÕÕ, -
cartId
ÕÕ- 3
)
ÕÕ3 4
;
ÕÕ4 5

_dbContext
ŒŒ 
.
ŒŒ 
Cart
ŒŒ 
.
ŒŒ 
Remove
ŒŒ "
(
ŒŒ" #
cart
ŒŒ# '
)
ŒŒ' (
;
ŒŒ( )

_dbContext
œœ 
.
œœ 
SaveChanges
œœ "
(
œœ" #
)
œœ# $
;
œœ$ %
}
–– 	
}
—— 
}““ ﬁP
ED:\MajorProject\Final Project\ECommerce\Repository\OrderRepository.cs
	namespace		 	
	ECommerce		
 
.		 

Repository		 
{

 
public 

class 
OrderRepository  
:! "
IOrderService# 0
{ 
readonly 
EComDBContext 

_dbContext )
;) *
public 
OrderRepository 
( 
EComDBContext ,
	dbContext- 6
)6 7
{ 	

_dbContext 
= 
	dbContext "
;" #
} 	
public 
void 
CreateOrder 
(  
int  #
userId$ *
,* +
	OrdersDto, 5
orderDetails6 B
)B C
{ 	
try 
{ 
StringBuilder 
orderid %
=& '
new( +
StringBuilder, 9
(9 :
): ;
;; <
orderid 
. 
Append 
( 
CreateRandomNumber 1
(1 2
$num2 3
)3 4
)4 5
;5 6
orderid 
. 
Append 
( 
$char "
)" #
;# $
orderid 
. 
Append 
( 
CreateRandomNumber 1
(1 2
$num2 3
)3 4
)4 5
;5 6
CustomerOrders 
customerOrder ,
=- .
new/ 2
CustomerOrders3 A
{ 
OrderId 
= 
orderid %
.% &
ToString& .
(. /
)/ 0
,0 1
UserId 
= 
userId #
,# $
DateCreated 
=  !
DateTime" *
.* +
Now+ .
.. /
Date/ 3
,3 4
	CartTotal   
=   
orderDetails    ,
.  , -
	CartTotal  - 6
}!! 
;!! 

_dbContext## 
.## 
CustomerOrders## )
.##) *
Add##* -
(##- .
customerOrder##. ;
)##; <
;##< =

_dbContext$$ 
.$$ 
SaveChanges$$ &
($$& '
)$$' (
;$$( )
foreach&& 
(&& 
CartItemDto&& $
order&&% *
in&&+ -
orderDetails&&. :
.&&: ;
OrderDetails&&; G
)&&G H
{''  
CustomerOrderDetails(( (
productDetails(() 7
=((8 9
new((: = 
CustomerOrderDetails((> R
{)) 
OrderId** 
=**  !
orderid**" )
.**) *
ToString*** 2
(**2 3
)**3 4
,**4 5
	ProductId++ !
=++" #
order++$ )
.++) *
Book++* .
.++. /
BookId++/ 5
,++5 6
Quantity,,  
=,,! "
order,,# (
.,,( )
Quantity,,) 1
,,,1 2
Price-- 
=-- 
order--  %
.--% &
Book--& *
.--* +
Price--+ 0
}.. 
;.. 

_dbContext// 
.//  
CustomerOrderDetails// 3
.//3 4
Add//4 7
(//7 8
productDetails//8 F
)//F G
;//G H

_dbContext00 
.00 
SaveChanges00 *
(00* +
)00+ ,
;00, -
}11 
}22 
catch33 
{44 
throw55 
;55 
}66 
}77 	
public99 
List99 
<99 
	OrdersDto99 
>99 
GetOrderList99 +
(99+ ,
int99, /
userId990 6
)996 7
{:: 	
List;; 
<;; 
	OrdersDto;; 
>;; 

userOrders;; &
=;;' (
new;;) ,
List;;- 1
<;;1 2
	OrdersDto;;2 ;
>;;; <
(;;< =
);;= >
;;;> ?
List<< 
<<< 
string<< 
><< 
userOrderId<< $
=<<% &
new<<' *
List<<+ /
<<</ 0
string<<0 6
><<6 7
(<<7 8
)<<8 9
;<<9 :
userOrderId>> 
=>> 

_dbContext>> $
.>>$ %
CustomerOrders>>% 3
.>>3 4
Where>>4 9
(>>9 :
x>>: ;
=>>>< >
x>>? @
.>>@ A
UserId>>A G
==>>H J
userId>>K Q
)>>Q R
.?? 
Select?? 
(?? 
x?? 
=>?? 
x?? 
.?? 
OrderId?? &
)??& '
.??' (
ToList??( .
(??. /
)??/ 0
;??0 1
foreachAA 
(AA 
stringAA 
orderidAA #
inAA$ &
userOrderIdAA' 2
)AA2 3
{BB 
	OrdersDtoCC 
orderCC 
=CC  !
newCC" %
	OrdersDtoCC& /
{DD 
OrderIdEE 
=EE 
orderidEE %
,EE% &
	CartTotalFF 
=FF 

_dbContextFF  *
.FF* +
CustomerOrdersFF+ 9
.FF9 :
FirstOrDefaultFF: H
(FFH I
xFFI J
=>FFK M
xFFN O
.FFO P
OrderIdFFP W
==FFX Z
orderidFF[ b
)FFb c
.FFc d
	CartTotalFFd m
,FFm n
	OrderDateGG 
=GG 

_dbContextGG  *
.GG* +
CustomerOrdersGG+ 9
.GG9 :
FirstOrDefaultGG: H
(GGH I
xGGI J
=>GGK M
xGGN O
.GGO P
OrderIdGGP W
==GGX Z
orderidGG[ b
)GGb c
.GGc d
DateCreatedGGd o
}HH 
;HH 
ListJJ 
<JJ  
CustomerOrderDetailsJJ )
>JJ) *
orderDetailJJ+ 6
=JJ7 8

_dbContextJJ9 C
.JJC D 
CustomerOrderDetailsJJD X
.JJX Y
WhereJJY ^
(JJ^ _
xJJ_ `
=>JJa c
xJJd e
.JJe f
OrderIdJJf m
==JJn p
orderidJJq x
)JJx y
.JJy z
ToList	JJz Ä
(
JJÄ Å
)
JJÅ Ç
;
JJÇ É
orderLL 
.LL 
OrderDetailsLL "
=LL# $
newLL% (
ListLL) -
<LL- .
CartItemDtoLL. 9
>LL9 :
(LL: ;
)LL; <
;LL< =
foreachNN 
(NN  
CustomerOrderDetailsNN -
customerOrderNN. ;
inNN< >
orderDetailNN? J
)NNJ K
{OO 
CartItemDtoPP 
itemPP  $
=PP% &
newPP' *
CartItemDtoPP+ 6
(PP6 7
)PP7 8
;PP8 9
BookRR 
bookRR 
=RR 
newRR  #
BookRR$ (
{SS 
BookIdTT 
=TT  
customerOrderTT! .
.TT. /
	ProductIdTT/ 8
,TT8 9
TitleUU 
=UU 

_dbContextUU  *
.UU* +
BookUU+ /
.UU/ 0
FirstOrDefaultUU0 >
(UU> ?
xUU? @
=>UUA C
xUUD E
.UUE F
BookIdUUF L
==UUM O
customerOrderUUP ]
.UU] ^
	ProductIdUU^ g
&&UUh j
customerOrderUUk x
.UUx y
OrderId	UUy Ä
==
UUÅ É
orderid
UUÑ ã
)
UUã å
.
UUå ç
Title
UUç í
,
UUí ì
PriceVV 
=VV 

_dbContextVV  *
.VV* + 
CustomerOrderDetailsVV+ ?
.VV? @
FirstOrDefaultVV@ N
(VVN O
xVVO P
=>VVQ S
xVVT U
.VVU V
	ProductIdVVV _
==VV` b
customerOrderVVc p
.VVp q
	ProductIdVVq z
&&VV{ }
customerOrder	VV~ ã
.
VVã å
OrderId
VVå ì
==
VVî ñ
orderid
VVó û
)
VVû ü
.
VVü †
Price
VV† •
}WW 
;WW 
itemYY 
.YY 
BookYY 
=YY 
bookYY  $
;YY$ %
itemZZ 
.ZZ 
QuantityZZ !
=ZZ" #

_dbContextZZ$ .
.ZZ. / 
CustomerOrderDetailsZZ/ C
.ZZC D
FirstOrDefaultZZD R
(ZZR S
xZZS T
=>ZZU W
xZZX Y
.ZZY Z
	ProductIdZZZ c
==ZZd f
customerOrderZZg t
.ZZt u
	ProductIdZZu ~
&&	ZZ Å
x
ZZÇ É
.
ZZÉ Ñ
OrderId
ZZÑ ã
==
ZZå é
orderid
ZZè ñ
)
ZZñ ó
.
ZZó ò
Quantity
ZZò †
;
ZZ† °
order\\ 
.\\ 
OrderDetails\\ &
.\\& '
Add\\' *
(\\* +
item\\+ /
)\\/ 0
;\\0 1
}]] 

userOrders^^ 
.^^ 
Add^^ 
(^^ 
order^^ $
)^^$ %
;^^% &
}__ 
return`` 

userOrders`` 
.`` 
OrderByDescending`` /
(``/ 0
x``0 1
=>``2 4
x``5 6
.``6 7
	OrderDate``7 @
)``@ A
.``A B
ToList``B H
(``H I
)``I J
;``J K
}aa 	
intcc 
CreateRandomNumbercc 
(cc 
intcc "
lengthcc# )
)cc) *
{dd 	
Randomee 
rndee 
=ee 
newee 
Randomee #
(ee# $
)ee$ %
;ee% &
returnff 
rndff 
.ff 
Nextff 
(ff 
Convertff #
.ff# $
ToInt32ff$ +
(ff+ ,
Mathff, 0
.ff0 1
Powff1 4
(ff4 5
$numff5 7
,ff7 8
lengthff9 ?
-ff@ A
$numffB C
)ffC D
)ffD E
,ffE F
ConvertffG N
.ffN O
ToInt32ffO V
(ffV W
MathffW [
.ff[ \
Powff\ _
(ff_ `
$numff` b
,ffb c
lengthffd j
)ffj k
)ffk l
)ffl m
;ffm n
}gg 	
}hh 
}ii ˜+
DD:\MajorProject\Final Project\ECommerce\Repository\UserRepository.cs
	namespace		 	
	ECommerce		
 
.		 

Repository		 
{

 
public 

class 
UserRepository 
:  !
IUserService" .
{ 
readonly 
EComDBContext 

_dbContext )
;) *
public 
UserRepository 
( 
EComDBContext +
	dbContext, 5
)5 6
{ 	

_dbContext 
= 
	dbContext "
;" #
} 	
public 

UserMaster 
AuthenticateUser *
(* +

UserMaster+ 5
loginCredentials6 F
)F G
{ 	

UserMaster 
user 
= 
new !

UserMaster" ,
(, -
)- .
;. /
var 
userDetails 
= 

_dbContext (
.( )

UserMaster) 3
.3 4
FirstOrDefault4 B
(B C
u 
=> 
u 
. 
Username 
==  "
loginCredentials# 3
.3 4
Username4 <
&&= ?
u@ A
.A B
PasswordB J
==K M
loginCredentialsN ^
.^ _
Password_ g
) 
; 
if 
( 
userDetails 
!= 
null #
)# $
{ 
user 
= 
new 

UserMaster %
{   
Username!! 
=!! 
userDetails!! *
.!!* +
Username!!+ 3
,!!3 4
UserId"" 
="" 
userDetails"" (
.""( )
UserId"") /
,""/ 0

UserTypeId## 
=##  
userDetails##! ,
.##, -

UserTypeId##- 7
}$$ 
;$$ 
return%% 
user%% 
;%% 
}&& 
else'' 
{(( 
return)) 
userDetails)) "
;))" #
}** 
}++ 	
public,, 
List,, 
<,, 

UserMaster,, 
>,, 
GetUsers,,  (
(,,( )
),,) *
{-- 	
string.. 
user.. 
=.. 

_dbContext.. $
...$ %

UserMaster..% /
.../ 0
FirstOrDefault..0 >
(..> ?
x..? @
=>..A C
x..D E
...E F

UserTypeId..F P
==..Q S
$num..T U
)..U V
?..V W
...W X
ToString..X `
(..` a
)..a b
;..b c
try88 
{99 
return:: 

_dbContext:: !
.::! "

UserMaster::" ,
.::, -
AsNoTracking::- 9
(::9 :
)::: ;
.::; <
ToList::< B
(::B C
)::C D
;::D E
};; 
catch<< 
{== 
throw>> 
;>> 
}?? 
}@@ 
publicBB 
intBB 
RegisterUserBB 
(BB  

UserMasterBB  *
userDataBB+ 3
)BB3 4
{CC 	
tryDD 
{EE 
userDataFF 
.FF 

UserTypeIdFF #
=FF$ %
$numFF& '
;FF' (

_dbContextGG 
.GG 

UserMasterGG %
.GG% &
AddGG& )
(GG) *
userDataGG* 2
)GG2 3
;GG3 4

_dbContextHH 
.HH 
SaveChangesHH &
(HH& '
)HH' (
;HH( )
returnII 
$numII 
;II 
}JJ 
catchKK 
{LL 
throwMM 
;MM 
}NN 
}OO 	
publicQQ 
boolQQ 
CheckUserAvailabityQQ '
(QQ' (
stringQQ( .
userNameQQ/ 7
)QQ7 8
{RR 	
stringSS 
userSS 
=SS 

_dbContextSS $
.SS$ %

UserMasterSS% /
.SS/ 0
FirstOrDefaultSS0 >
(SS> ?
xSS? @
=>SSA C
xSSD E
.SSE F
UsernameSSF N
==SSO Q
userNameSSR Z
)SSZ [
?SS[ \
.SS\ ]
ToStringSS] e
(SSe f
)SSf g
;SSg h
ifUU 
(UU 
userUU 
!=UU 
nullUU 
)UU 
{VV 
returnWW 
trueWW 
;WW 
}XX 
elseYY 
{ZZ 
return[[ 
false[[ 
;[[ 
}\\ 
}]] 	
public__ 
bool__ 
IsUserExists__  
(__  !
int__! $
userId__% +
)__+ ,
{`` 	
stringaa 
useraa 
=aa 

_dbContextaa $
.aa$ %

UserMasteraa% /
.aa/ 0
FirstOrDefaultaa0 >
(aa> ?
xaa? @
=>aaA C
xaaD E
.aaE F
UserIdaaF L
==aaM O
userIdaaP V
)aaV W
?aaW X
.aaX Y
ToStringaaY a
(aaa b
)aab c
;aac d
ifcc 
(cc 
usercc 
!=cc 
nullcc 
)cc 
{dd 
returnee 
trueee 
;ee 
}ff 
elsegg 
{hh 
returnii 
falseii 
;ii 
}jj 
}kk 	
}ll 
}mm Õ1
HD:\MajorProject\Final Project\ECommerce\Repository\WishlistRepository.cs
	namespace 	
	ECommerce
 
. 

Repository 
{ 
public		 

class		 
WishlistRepository		 #
:		$ %
IWishlistService		& 6
{

 
readonly 
EComDBContext 

_dbContext )
;) *
public 
WishlistRepository !
(! "
EComDBContext" /
	dbContext0 9
)9 :
{ 	

_dbContext 
= 
	dbContext "
;" #
} 	
public 
void 
ToggleWishlistItem &
(& '
int' *
userId+ 1
,1 2
int3 6
bookId7 =
)= >
{ 	
string 

wishlistId 
= 
GetWishlistId  -
(- .
userId. 4
)4 5
;5 6
WishlistItems  
existingWishlistItem .
=/ 0

_dbContext1 ;
.; <
WishlistItems< I
.I J
FirstOrDefaultJ X
(X Y
xY Z
=>[ ]
x^ _
._ `
	ProductId` i
==j l
bookIdm s
&&t v
xw x
.x y

WishlistId	y É
==
Ñ Ü

wishlistId
á ë
)
ë í
;
í ì
if 
(  
existingWishlistItem $
!=% '
null( ,
), -
{ 

_dbContext 
. 
WishlistItems (
.( )
Remove) /
(/ 0 
existingWishlistItem0 D
)D E
;E F

_dbContext 
. 
SaveChanges &
(& '
)' (
;( )
} 
else 
{ 
WishlistItems 
wishlistItem *
=+ ,
new- 0
WishlistItems1 >
{ 

WishlistId   
=    

wishlistId  ! +
,  + ,
	ProductId!! 
=!! 
bookId!!  &
,!!& '
}"" 
;"" 

_dbContext## 
.## 
WishlistItems## (
.##( )
Add##) ,
(##, -
wishlistItem##- 9
)##9 :
;##: ;

_dbContext$$ 
.$$ 
SaveChanges$$ &
($$& '
)$$' (
;$$( )
}%% 
}&& 	
public(( 
int(( 
ClearWishlist((  
(((  !
int((! $
userId((% +
)((+ ,
{)) 	
try** 
{++ 
string,, 

wishlistId,, !
=,," #
GetWishlistId,,$ 1
(,,1 2
userId,,2 8
),,8 9
;,,9 :
List-- 
<-- 
WishlistItems-- "
>--" #
wishlistItem--$ 0
=--1 2

_dbContext--3 =
.--= >
WishlistItems--> K
.--K L
Where--L Q
(--Q R
x--R S
=>--T V
x--W X
.--X Y

WishlistId--Y c
==--d f

wishlistId--g q
)--q r
.--r s
ToList--s y
(--y z
)--z {
;--{ |
if// 
(// 
!// 
string// 
.// 
IsNullOrEmpty// )
(//) *

wishlistId//* 4
)//4 5
)//5 6
{00 
foreach11 
(11 
WishlistItems11 *
item11+ /
in110 2
wishlistItem113 ?
)11? @
{22 

_dbContext33 "
.33" #
WishlistItems33# 0
.330 1
Remove331 7
(337 8
item338 <
)33< =
;33= >

_dbContext44 "
.44" #
SaveChanges44# .
(44. /
)44/ 0
;440 1
}55 
}66 
return77 
$num77 
;77 
}88 
catch99 
{:: 
throw;; 
;;; 
}<< 
}== 	
public?? 
string?? 
GetWishlistId?? #
(??# $
int??$ '
userId??( .
)??. /
{@@ 	
tryAA 
{BB 
WishlistCC 
wishlistCC !
=CC" #

_dbContextCC$ .
.CC. /
WishlistCC/ 7
.CC7 8
FirstOrDefaultCC8 F
(CCF G
xCCG H
=>CCI K
xCCL M
.CCM N
UserIdCCN T
==CCU W
userIdCCX ^
)CC^ _
;CC_ `
ifEE 
(EE 
wishlistEE 
!=EE 
nullEE  $
)EE$ %
{FF 
returnGG 
wishlistGG #
.GG# $

WishlistIdGG$ .
;GG. /
}HH 
elseII 
{JJ 
returnKK 
CreateWishlistKK )
(KK) *
userIdKK* 0
)KK0 1
;KK1 2
}LL 
}NN 
catchOO 
{PP 
throwQQ 
;QQ 
}RR 
}SS 	
stringUU 
CreateWishlistUU 
(UU 
intUU !
userIdUU" (
)UU( )
{VV 	
tryWW 
{XX 
WishlistYY 
wishListYY !
=YY" #
newYY$ '
WishlistYY( 0
{ZZ 

WishlistId[[ 
=[[  
Guid[[! %
.[[% &
NewGuid[[& -
([[- .
)[[. /
.[[/ 0
ToString[[0 8
([[8 9
)[[9 :
,[[: ;
UserId\\ 
=\\ 
userId\\ #
,\\# $
DateCreated]] 
=]]  !
DateTime]]" *
.]]* +
Now]]+ .
.]]. /
Date]]/ 3
}^^ 
;^^ 

_dbContext`` 
.`` 
Wishlist`` #
.``# $
Add``$ '
(``' (
wishList``( 0
)``0 1
;``1 2

_dbContextaa 
.aa 
SaveChangesaa &
(aa& '
)aa' (
;aa( )
returncc 
wishListcc 
.cc  

WishlistIdcc  *
;cc* +
}dd 
catchee 
{ff 
throwgg 
;gg 
}hh 
}ii 	
}jj 
}kk ‹4
2D:\MajorProject\Final Project\ECommerce\Startup.cs
	namespace 	
	ECommerce
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public!! 
void!! 
ConfigureServices!! %
(!!% &
IServiceCollection!!& 8
services!!9 A
)!!A B
{"" 	
services## 
.## 
AddDbContext## !
<##! "
EComDBContext##" /
>##/ 0
(##0 1
options##1 8
=>##9 ;
options##< C
.##C D
UseSqlServer##D P
(##P Q
Configuration##Q ^
[##^ _
$str	##_ Ñ
]
##Ñ Ö
)
##Ö Ü
)
##Ü á
;
##á à
services%% 
.%% 
AddTransient%% !
<%%! "
IBookService%%" .
,%%. /
BookRepository%%0 >
>%%> ?
(%%? @
)%%@ A
;%%A B
services&& 
.&& 
AddTransient&& !
<&&! "
ICartService&&" .
,&&. /
CartRepository&&0 >
>&&> ?
(&&? @
)&&@ A
;&&A B
services'' 
.'' 
AddTransient'' !
<''! "
IUserService''" .
,''. /
UserRepository''0 >
>''> ?
(''? @
)''@ A
;''A B
services(( 
.(( 
AddTransient(( !
<((! "
IOrderService((" /
,((/ 0
OrderRepository((1 @
>((@ A
(((A B
)((B C
;((C D
services)) 
.)) 
AddTransient)) !
<))! "
IWishlistService))" 2
,))2 3
WishlistRepository))4 F
>))F G
())G H
)))H I
;))I J
services++ 
.++ 
AddCors++ 
(++ 
)++ 
;++ 
services-- 
.-- 
AddAuthentication-- &
(--& '
JwtBearerDefaults--' 8
.--8 9 
AuthenticationScheme--9 M
)--M N
... 
AddJwtBearer.. 
(.. 
options.. !
=>.." $
{// 
options00 
.00  
RequireHttpsMetadata00 ,
=00- .
false00/ 4
;004 5
options11 
.11 
	SaveToken11 !
=11" #
true11$ (
;11( )
options22 
.22 %
TokenValidationParameters22 1
=222 3
new224 7%
TokenValidationParameters228 Q
{33 
ValidateIssuer44 "
=44# $
false44% *
,44* +
ValidateAudience55 $
=55% &
false55' ,
,55, -
ValidateLifetime66 $
=66% &
true66' +
,66+ ,$
ValidateIssuerSigningKey77 ,
=77- .
true77/ 3
,773 4
IssuerSigningKey:: $
=::% &
new::' * 
SymmetricSecurityKey::+ ?
(::? @
Encoding::@ H
.::H I
UTF8::I M
.::M N
GetBytes::N V
(::V W
Configuration::W d
[::d e
$str::e t
]::t u
)::u v
)::v w
,::w x
	ClockSkew;; 
=;; 
TimeSpan;;  (
.;;( )
Zero;;) -
}<< 
;<< 
services>> 
.>> 
AddCors>>  
(>>  !
)>>! "
;>>" #
}?? 
)?? 
;?? 
servicesAA 
.AA 
AddAuthorizationAA %
(AA% &
configAA& ,
=>AA- /
{BB 
configCC 
.CC 
	AddPolicyCC  
(CC  !
	UserRolesCC! *
.CC* +
AdminCC+ 0
,CC0 1
PoliciesCC2 :
.CC: ;
AdminPolicyCC; F
(CCF G
)CCG H
)CCH I
;CCI J
configDD 
.DD 
	AddPolicyDD  
(DD  !
	UserRolesDD! *
.DD* +
UserDD+ /
,DD/ 0
PoliciesDD1 9
.DD9 :

UserPolicyDD: D
(DDD E
)DDE F
)DDF G
;DDG H
}EE 
)EE 
;EE 
servicesGG 
.GG #
AddControllersWithViewsGG ,
(GG, -
)GG- .
;GG. /
servicesJJ 
.JJ 
AddSpaStaticFilesJJ &
(JJ& '
configurationJJ' 4
=>JJ5 7
{KK 
configurationLL 
.LL 
RootPathLL &
=LL' (
$strLL) 9
;LL9 :
}MM 
)MM 
;MM 
}NN 	
publicQQ 
voidQQ 
	ConfigureQQ 
(QQ 
IApplicationBuilderQQ 1
appQQ2 5
,QQ5 6
IWebHostEnvironmentQQ7 J
envQQK N
)QQN O
{RR 	
ifSS 
(SS 
envSS 
.SS 
IsDevelopmentSS !
(SS! "
)SS" #
)SS# $
{TT 
appUU 
.UU %
UseDeveloperExceptionPageUU -
(UU- .
)UU. /
;UU/ 0
}VV 
appXX 
.XX 
UseCorsXX 
(XX 
optionsXX 
=>XX  "
optionsYY 
.YY 
WithOriginsYY 
(YY 
$strYY 6
)YY6 7
.ZZ 
AllowAnyHeaderZZ 
(ZZ 
)ZZ 
.[[ 
AllowAnyMethod[[ 
([[ 
)[[ 
)[[ 
;[[ 
app]] 
.]] 
UseStaticFiles]] 
(]] 
)]]  
;]]  !
app__ 
.__ 
UseHttpsRedirection__ #
(__# $
)__$ %
;__% &
appaa 
.aa 

UseRoutingaa 
(aa 
)aa 
;aa 
appcc 
.cc 
UseAuthenticationcc !
(cc! "
)cc" #
;cc# $
appee 
.ee 
UseAuthorizationee  
(ee  !
)ee! "
;ee" #
appgg 
.gg 
UseEndpointsgg 
(gg 
	endpointsgg &
=>gg' )
{hh 
	endpointsii 
.ii 
MapControllersii (
(ii( )
)ii) *
;ii* +
}jj 
)jj 
;jj 
}kk 	
}ll 
}mm Ω
:D:\MajorProject\Final Project\ECommerce\WeatherForecast.cs
	namespace 	
	ECommerce
 
{ 
public 

class 
WeatherForecast  
{ 
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
int		 
TemperatureC		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public 
int 
TemperatureF 
=>  "
$num# %
+& '
(( )
int) ,
), -
(- .
TemperatureC. :
/; <
$num= C
)C D
;D E
public 
string 
Summary 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} 