//%attributes = {}


//ARRAY TEXT($headerNames; 0)
//ARRAY TEXT($headerValues; 0)
C_OBJECT:C1216($0; $result)


If (btnTrace)
	TRACE:C157
End if 

$result:=New object:C1471()

If (Form:C1466.sessionCookie#Null:C1517)
	$result.cookie:=Form:C1466.sessionCookie
End if 

$0:=$result
