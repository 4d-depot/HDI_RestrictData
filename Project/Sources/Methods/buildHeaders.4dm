//%attributes = {}


ARRAY TEXT:C222($headerNames; 0)
ARRAY TEXT:C222($headerValues; 0)
C_OBJECT:C1216($0; $result)


If (btnTrace)
	TRACE:C157
End if 


If (Form:C1466.sessionCookie#Null:C1517)
	ARRAY TEXT:C222($headerNames; 1)
	$headerNames{1}:="Cookie"
	
	ARRAY TEXT:C222($headerValues; 1)
	$headerValues{1}:=Form:C1466.sessionCookie
End if 

$result:=New object:C1471()
OB SET ARRAY:C1227($result; "names"; $headerNames)
OB SET ARRAY:C1227($result; "values"; $headerValues)

$0:=$result
