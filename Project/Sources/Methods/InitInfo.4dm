//%attributes = {"invisible":true}
var Infos : Collection
var objTabs : Object

var otherInfos : Collection

Infos:=ds:C1482.INFO.all().query("PageNumber <= :1"; 3).orderBy("PageNumber").toCollection()
objTabs:=New object:C1471("values"; Infos.extract("TabTitle"); "index"; 0)

otherInfos:=ds:C1482.INFO.all().query("PageNumber >= :1"; 4).orderBy("PageNumber").toCollection()