//%attributes = {}

var linesCode : Collection


linesCode:=ds:C1482.INFO.all().query("PageNumber >= :1"; 10).orderBy("PageNumber").toCollection()
