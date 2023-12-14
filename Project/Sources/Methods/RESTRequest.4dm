//%attributes = {}




C_LONGINT:C283($result; $indexCookie; $start; $end)
C_OBJECT:C1216($response; $headers)
C_TEXT:C284($cookie)

var $request : 4D:C1709.HTTPRequest
var $options : Object


ARRAY TEXT:C222($headerNames; 0)
ARRAY TEXT:C222($headerValues; 0)


If (btnTrace)
	TRACE:C157
End if 

$headers:=buildHeaders

OB GET ARRAY:C1229($headers; "names"; $headerNames)
OB GET ARRAY:C1229($headers; "values"; $headerValues)

$result:=HTTP Request:C1158(HTTP POST method:K71:2; Form:C1466.request; Form:C1466.body; $response; $headerNames; $headerValues; *)

$indexCookie:=Find in array:C230($headerValues; "WASID4D@")
$cookie:=$headerValues{$indexCookie}
$start:=Position:C15("WASID4D"; $cookie)
$end:=Position:C15(";"; $cookie)

Form:C1466.sessionCookie:=Substring:C12($cookie; $start; $end-$start)
Form:C1466.response:=$response


//$options:={body: {identifier: Form.identifier; password: Form.password}; method: "POST"; headers: buildHeadersObject}
//$request:=4D.HTTPRequest.new(Form.request; $options)