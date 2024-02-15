//%attributes = {"invisible":true}

var objTabs : Object
var $infos : Collection


ARRAY TEXT:C222(Infos; 0)
ARRAY TEXT:C222(OtherInfos; 0)
ARRAY TEXT:C222(LinesCode; 0)


$infos:=ds:C1482.INFO.all().query("PageNumber <= :1"; 4).orderBy("PageNumber").toCollection()
objTabs:=New object:C1471("values"; $infos.extract("TabTitle"); "index"; 0)


READ ONLY:C145([INFO:1])


QUERY:C277([INFO:1]; [INFO:1]PageNumber:4<=4)
ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
SELECTION TO ARRAY:C260([INFO:1]Description:2; Infos)

READ ONLY:C145([INFO:1])
QUERY:C277([INFO:1]; [INFO:1]PageNumber:4>=5)
ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
SELECTION TO ARRAY:C260([INFO:1]Description:2; OtherInfos)

QUERY:C277([INFO:1]; [INFO:1]PageNumber:4>=10)
ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
SELECTION TO ARRAY:C260([INFO:1]Description:2; LinesCode)



QUERY:C277([INFO:1]; [INFO:1]PageNumber:4>=1)
READ WRITE:C146([INFO:1])