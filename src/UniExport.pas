unit UniExport;

interface

Uses UniEngine, SysUtils, Classes, Zip, Forms, ContNrs;


Const
  openOfficeContentHeader = '<?xml version="1.0" encoding="UTF-8" ?> '#13#10+
'<office:document-content xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" '+#13#10+
'xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" '#13#10+
'xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" '#13#10+
'xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" '#13#10+
'xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" '#13#10+
'xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" '#13#10+
'xmlns:xlink="http://www.w3.org/1999/xlink" '#13#10+
'xmlns:dc="http://purl.org/dc/elements/1.1/" '#13#10+
'xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" '#13#10+
'xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0" '#13#10+
'xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" '#13#10+
'xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0" '#13#10+
'xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0" '#13#10+
'xmlns:math="http://www.w3.org/1998/Math/MathML" '#13#10+
'xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0" '#13#10+
'xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0" '#13#10+
'xmlns:ooo="http://openoffice.org/2004/office" '#13#10+
'xmlns:ooow="http://openoffice.org/2004/writer" '#13#10+
'xmlns:oooc="http://openoffice.org/2004/calc" '#13#10+
'xmlns:dom="http://www.w3.org/2001/xml-events" '#13#10+
'xmlns:xforms="http://www.w3.org/2002/xforms" '#13#10+
'xmlns:xsd="http://www.w3.org/2001/XMLSchema" '#13#10+
'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" office:version="1.0"> '#13#10+
'<office:scripts /> '#13#10+
'<office:font-face-decls> '#13#10+
'<style:font-face style:name="Tahoma1" svg:font-family="Tahoma" /> '#13#10+
'<style:font-face style:name="Lucida Sans Unicode" svg:font-family="''Lucida Sans Unicode''" style:font-pitch="variable" /> '#13#10+
'<style:font-face style:name="Tahoma" svg:font-family="Tahoma" style:font-pitch="variable" /> '#13#10+
'<style:font-face style:name="Times New Roman" svg:font-family="''Times New Roman''" style:font-family-generic="roman" style:font-pitch="variable" /> '#13#10+
'<style:font-face style:name="Arial" svg:font-family="Arial" style:font-family-generic="swiss" style:font-pitch="variable" /> '#13#10+
'</office:font-face-decls> '#13#10+
'<office:automatic-styles>'#13#10+
'<style:style style:name="BOLD1" style:family="text">'#13#10+
'<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold" style:font-weight-complex="bold" />'#13#10+
'</style:style>'#13#10+
'<style:style style:name="FIRSTPAGE" style:family="paragraph" style:parent-style-name="Standard" style:master-page-name="First_20_Page" />'#13#10+
'<style:style style:name="SUBTITLE" style:family="paragraph" style:parent-style-name="Standard">'#13#10+
'<style:paragraph-properties fo:text-align="center" style:justify-single-word="false" fo:break-after="page" />'#13#10+
'</style:style>'#13#10+
'<style:style style:name="P1" style:family="paragraph" style:parent-style-name="Standard" style:list-style-name="L1" />'#13#10+
'<text:list-style style:name="L1">'#13#10+
'<text:list-level-style-number text:level="1" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">'#13#10+
'<style:list-level-properties text:space-before="0.1cm" text:min-label-width="0.75cm" />'#13#10+
'</text:list-level-style-number>'#13#10+
'<text:list-level-style-number text:level="2" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">'#13#10+
'<style:list-level-properties text:space-before="1.27cm" text:min-label-width="0.635cm" />'#13#10+
'</text:list-level-style-number>'#13#10+
'<text:list-level-style-number text:level="3" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">'#13#10+
'<style:list-level-properties text:space-before="1.905cm" text:min-label-width="0.635cm" />'#13#10+
'</text:list-level-style-number>'#13#10+
'<text:list-level-style-number text:level="4" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">'#13#10+
'<style:list-level-properties text:space-before="2.54cm" text:min-label-width="0.635cm" />'#13#10+
'</text:list-level-style-number>'#13#10+
'<text:list-level-style-number text:level="5" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">'#13#10+
'<style:list-level-properties text:space-before="3.175cm" text:min-label-width="0.635cm" />'#13#10+
'</text:list-level-style-number>'#13#10+
'<text:list-level-style-number text:level="6" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">'#13#10+
'<style:list-level-properties text:space-before="3.81cm" text:min-label-width="0.635cm" />'#13#10+
'</text:list-level-style-number>'#13#10+
'<text:list-level-style-number text:level="7" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">'#13#10+
'<style:list-level-properties text:space-before="4.445cm" text:min-label-width="0.635cm" />'#13#10+
'</text:list-level-style-number>'#13#10+
'<text:list-level-style-number text:level="8" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">'#13#10+
'<style:list-level-properties text:space-before="5.08cm" text:min-label-width="0.635cm" />'#13#10+
'</text:list-level-style-number>'#13#10+
'<text:list-level-style-number text:level="9" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">'#13#10+
'<style:list-level-properties text:space-before="5.715cm" text:min-label-width="0.635cm" />'#13#10+
'</text:list-level-style-number>'#13#10+
'<text:list-level-style-number text:level="10" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">'#13#10+
'<style:list-level-properties text:space-before="6.35cm" text:min-label-width="0.635cm" />'#13#10+
'</text:list-level-style-number>'#13#10+
'</text:list-style>'#13#10+
'</office:automatic-styles>'#13#10+
'<office:body><office:text>';

  openOfficeContentFooter =
'</office:text></office:body>'#13#10+
'</office:document-content> ';


Type
TExporter = Class;


TExporterCell = Class
Private
  fText : String;
Public
  Property Text : String read fText write fText;
End;

TExporterColumn = Class
Private
  fText : String;
Public
  Property Text : String read fText write fText;
End;

TExporterRow = Class
Private
  fCellList : TObjectList;
  Function getItem(Index : Integer) : TExporterCell;
Public
  Property Cells[Index : Integer] : TExporterCell read getItem; default;
  Function CellCount : Integer;
  Constructor Create;
  Destructor Destroy; override;
  Function AddCell(Text : String) : TExporterCell;
End;

TExporterTable = Class
Private
  fRowList    : TObjectList;
  fColumnList : TObjectList;
  Function getItem(Index : Integer) : TExporterRow;
  Function getColumn(Index : Integer) : TExporterColumn;
Public
  Function AddRow : TExporterRow;
  Property Rows[Index : Integer] : TExporterRow read getItem; default;
  Property Columns[Index : Integer] : TExporterColumn read getColumn;
  Function RowCount : Integer;
  Function ColumnCount : Integer;
  Procedure addCells(Cells : Array of String);
  Function  addColumn : TExporterColumn;
  Constructor Create;
  Destructor Destroy; override;
End;

TStatBLockFlags = Set of ( SbLarge );

TCityExport = Class
Private
    fExporter           : TExporter;
    fLocationCitizens   : TObjectList;
    fImportantCitizens  : TObjectList;
    fSpareCitizens      : TObjectList;
    fCity               : TCity;
    Procedure processCitizens;
    Procedure InsertLocationCitizen(Citizen : TCitizen);
    Procedure InsertSpareCitizen(Citizen : TCitizen);
    Procedure ConsiderAsImportantCitizen(Citizen : TCitizen);
    Procedure exportImportantPeople;
    Procedure exportLocations;
    Procedure exportPeople;
    Procedure exportCityCore;
    Procedure OutStatblock(Citizen : TCitizen; Flags : TStatBLockFlags=[] );
Public
    Procedure Execute;
    Constructor Create(Exporter : TExporter; City : TCity);
    Destructor Destroy; Override;
End;

TExporter = Class
Private
  F             : TextFile;
  fChapterIndex : Integer;
{  Procedure RenderTable(Table : TExporterTable);}
  Procedure GenerateContentFile(Filename : TFilename);
  Procedure ExportCityDetail(City : TCity);
  Procedure ExportCities;
Public
  Procedure AddChapter(Name : String);
  Procedure TextOut(StyleName : String; Text : String);
  Procedure OpenTag(Tag : String);
  Procedure CloseTag(Tag : String);
  Constructor Create;
  Procedure ExportToFile(FileName : TFIlename);
  Destructor Destroy; override;
End;


implementation

Uses UniREsources;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

Function TExporterRow.getItem(Index : Integer) : TExporterCell;
Begin
Result := fCellList[Index] as TExporterCell;
End;

Constructor TExporterRow.Create;
Begin
  Inherited;
  fCellList := TObjectList.Create;
  fCellList.OwnsObjects := True;
End;

Destructor TExporterRow.Destroy;
Begin
  FreeAndNil(fCellList);
  Inherited;
End;

Function TExporterRow.CellCount : Integer;
Begin
  Result := fCellList.Count;
End;

Function TExporterRow.AddCell(Text : String) : TExporterCell;
Begin
  Result := TExporterCell.Create;
  Result.Text := Text;
  fCellList.Add(Result);
End;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


Function TExporterTable.getItem(Index : Integer) : TExporterRow;
Begin
  Result := fRowList[Index] as TExporterRow;
End;

Function TExporterTable.getColumn(Index : Integer) : TExporterColumn;
Begin
  Result := fColumnList[Index] as TExporterColumn;
End;

Constructor TExporterTable.Create;
Begin
  Inherited;
  fRowList := TObjectList.Create;
  fRowList.ownsObjects := True;
  fColumnList := TObjectList.Create;
  fColumnList.OwnsObjects := True;
End;

Destructor TExporterTable.Destroy;
Begin
  FreeAndNil(fColumnList);
  FreeAndNil(fRowList);
  Inherited;
End;

Function TExporterTable.RowCount : Integer;
Begin
  Result := fRowList.Count;
End;

Function TExporterTable.ColumnCount : Integer;
Begin
  Result := fColumnList.Count;
End;

Function TExporterTable.AddColumn : TExporterColumn;
Begin
  Result := TExporterColumn.Create;
  fColumnList.Add(Result);
End;

Function TExporterTable.AddRow : TExporterRow;
Begin
  Result := TExporterRow.Create;
  fRowList.Add(Result);
End;

Procedure TExporterTable.addCells(Cells : Array of String);
Var I : Integer;
    Row : TExporterRow;
Begin
  Row := AddRow;
  While(ColumnCount<Length(Cells)) do AddColumn;
  For I := 0 To Length(Cells)-1 Do Begin
    Row.AddCell(Cells[I]);
  End;
End;


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


Procedure TExporter.TextOut(StyleName : String; Text : String);
Begin
  WriteLn(F,Format('<text:p text:style-name="%s">%s</text:p>',[StyleName,Text]));
End;

Procedure TExporter.OpenTag(Tag : String);
Begin
  WriteLn(F,Format('<%s>',[Tag]));
End;

Procedure TExporter.CloseTag(Tag : String);
Begin
  WriteLn(F,Format('</%s>',[Tag]));
End;

Procedure TExporter.ExportCityDetail(City : TCity);
Var CityExport   : TCityExport;
Begin
  CityExport := TCityExport.Create(self, City);
  Try
    CityExport.Execute;
  Finally
    CityExport.Free;
  End;
End;

{Procedure TExporter.RenderTable(Table : TExporterTable);
Var RowIndex, CellIndex : Integer;
Begin
  If Table.RowCount = 0 Then Exit;
  WriteLn(F,'<table:table>');
  WriteLn(F,Format('<table:table-column table:number-columns-repeated="%d" />',[Table.ColumnCount]));
  For RowIndex := 0 To Table.RowCount-1 Do Begin
    if RowIndex =0 Then WriteLn(F,'<table:table-header-rows>');
    WriteLn(F,'<table:table-row>');
    For CellIndex := 0 To Table.Rows[RowIndex].CellCount-1 Do Begin
      WriteLn(F,'<table:table-cell>');
      Writeln(f,Format('<text:p>%s</text:p>',[Table.Rows[RowIndex][CellIndex].Text]));
      WriteLn(F,'</table:table-cell>');
    End;
    WriteLn(F,'</table:table-row>');
    if RowIndex =0 Then WriteLn(F,'</table:table-header-rows>');
  End;
  WriteLn(F,'</table:table>');
End;      }

Constructor TExporter.Create;
Begin
  Inherited;
End;


Procedure  TExporter.AddChapter(Name : String);
Begin
 Inc(fChapterIndex);
 TextOut('chapterNumber', Format('chapter %d:',[fChapterIndex]));
 TextOut('chapterHeader', Name);
End;

Procedure TExporter.ExportCities;
Var
{    Table : TExporterTable;}
    CityIndex : Integer;
    SortedCities : TObjectList;

Procedure AddCitySorted(City : TCity);
Var
    SortIndex    : Integer;
Begin
  For SortIndex := 0 To SortedCities.Count-1 Do Begin
      If CompareText(City.Name,(SortedCities[SortIndex] as TCity).Name) < 0 Then Begin
          SortedCities.Insert(SortIndex,City);
          Exit;
      End;
  End;
  SortedCities.Add(City);
End;

Begin

{  Table        := TExporterTable.Create;}
  SortedCities := TObjectList.Create;
  SortedCities.OwnsObjects := False;
  Try
    For CityIndex := 0 To Engine.Cities.Count-1 Do Begin
{      Table.AddCells([Engine.Cities[CityIndex].Name,Engine.cities[CityIndex].MainRace.Name]);}
      AddCitySorted(Engine.Cities[CityIndex]);
    End;
{    RenderTable(Table);}

    For CityIndex := 0 To SortedCities.Count-1 Do Begin
       ExportCityDetail(SortedCities[CityIndex] as TCity);
    End;

  Finally
    SortedCities.Free;
{    Table.Free; }
  End;
End;

   {
<draw:frame draw:style-name="fr1" draw:name="Afbeeldingen1" text:anchor-type="as-char" svg:width="0.564cm" svg:height="0.564cm" draw:z-index="1">
  <draw:image xlink:href="Pictures/10000000000000100000001017E051A2.png" xlink:type="simple" xlink:show="embed" xlink:actuate="onLoad" /> 
  </draw:frame>  }

Procedure TExporter.GenerateContentFile(Filename : TFilename);
var I : Integer;
Begin
    AssignFile(F, Filename);
    Rewrite(F);
    Try
      Writeln(f,openOfficeContentHeader);

      TextOut('FIRSTPAGE','');
      For I := 0 To 10 Do
        TextOut('standaard','');
      TextOut('Title','Campaign');
      TextOut('SUBTITLE','A campaign generated with '+appTitle);
      AddChapter('Introduction');
      AddChapter('History and Timeline');
      AddChapter('Races');
      AddChapter('Classes and Feats');
      AddChapter('Magic');
      AddChapter('Deities');
      AddChapter('Geography');
      ExportCities;
      AddChapter('Maps');
      AddChapter('Creatures');
      AddChapter('Magic Items');
      AddChapter('Characters of Note');

      Writeln(f,openOfficeContentFooter);
    Finally
      CloseFile(F);
    End;
End;

Procedure TExporter.ExportToFile(FileName : TFilename);
Var CurrentDir : String;
    Files : TStrings;
    zip : TZip;
Begin
  fChapterIndex := 0;
  GenerateContentFile(ExtractFilePath(Application.ExeName)+'data\export\content.xml');
  CurrentDir := GetCurrentDir;
  Assert(SetCurrentDir(ExtractFilePath(Application.ExeName)+'data\export\'));
  Files := TStringList.Create;
  Try
    Files.Add('\');
    zip := TZip.create(nil);
    Zip.AddOptions := [aoRecursive,aoFolderEntries];
    Zip.AddPath := '.';
    Zip.FileNAme     := FileNAme;
    zip.FileSpecList := Files;
    zip.add;
    Zip.Free;
  Finally
    Files.Free;
  End;
  SetCurrentDir(CurrentDir);
End;

Destructor TExporter.Destroy;
Begin
  Inherited;
End;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

Constructor TCityExport.Create(Exporter : TExporter; City : TCity);
Begin
  Inherited Create;
  fExporter                      := Exporter;
  fLocationCitizens              := TObjectList.Create;
  fLocationCitizens.OwnsObjects  := False;
  fSpareCitizens                 := TObjectList.Create;
  fSpareCitizens.OwnsObjects     := False;
  fImportantCitizens             := TObjectList.Create;
  fImportantCitizens.OwnsObjects := False;
  fCity                          := City;
End;

Procedure TCityExport.InsertLocationCitizen(Citizen : TCitizen);
Var I : Integer;
Begin
  // Insert sorted by job name
  For I := 0 To fLocationCitizens.Count-1 Do Begin
      if CompareText(Citizen.Job.Name,(fLocationCitizens[I] as TCitizen).Job.Name) < 0 Then Begin
          fLocationCitizens.Insert(I,Citizen);
          Exit;
      End;
  End;
  fLocationCitizens.Add(Citizen);
End;

Procedure TCityExport.InsertSpareCitizen(Citizen : TCitizen);
Var I : Integer;
Begin
  // Insert sorted by nickname
  For I := 0 To fSpareCitizens.Count-1 Do Begin
      if CompareText(Citizen.NickName,(fSpareCitizens[I] as TCitizen).NickName) < 0 Then Begin
          fSpareCitizens.Insert(I,Citizen);
          Exit;
      End;
  End;
  fSpareCitizens.Add(Citizen);
End;

Procedure TCityExport.ConsiderAsImportantCitizen(Citizen : TCitizen);
Var I : Integer;
Begin
  // Insert sorted by rating
  For I := 0 To fImportantCitizens.Count-1 Do Begin
      if Citizen.Rating > (fImportantCitizens[I] as TCitizen).Rating Then Begin
          fImportantCitizens.Insert(I,Citizen);
          Exit;
      End;
  End;
  fImportantCitizens.Add(Citizen);
End;

Procedure TCityExport.exportLocations;
Var CitizenIndex : Integer;
    Citizen      : TCitizen;
Begin
  if fLocationCitizens.Count=0 then exit;
  fExporter.TextOut('header','key sites');
  fExporter.OpenTag('text:list text:style-name="L1"');
  For CitizenIndex := 0 To fLocationCitizens.Count-1 Do Begin
    Citizen := fLocationCitizens[CitizenIndex] as TCitizen;
    fExporter.OpenTag('text:list-item text:style-name="P1"');
    fExporter.TextOut('location',Format('<text:span text:style-name="BOLD1">%s</text:span>: owned by %s',[Citizen.Job.Name,Citizen.Nickname]));
    fExporter.CloseTag('text:list-item');
  End;
  fExporter.CloseTag('text:list');
End;

Procedure TCityExport.OutStatblock(Citizen : TCitizen; Flags : TStatBLockFlags );
Var
    QuirkIndex   : Integer;
    GenderNAme : String;
    Quirks       : String;
    Alignment    : String;
    JobNAme      : String;
    SpecialText : String;
    Family, Friend,Enemy :String;
    RelationIndex  :Integer;
    RelationShip : TRelationship;
Begin
    Alignment := '';
    Case Citizen.Alignment Of
      AlEvil : Alignment := 'evil ';
      AlGood : Alignment := 'good ';
    End;

    Quirks   := ', ' + Citizen.Personality;
    For QuirkIndex := 0 To Citizen.Quirks.Count-1 Do Begin
       Quirks := Quirks + ', ' + Citizen.Quirks[QuirkIndex];
    End;

    if Citizen.Jobname<>'' Then
      JobName := ' '+Citizen.Jobname
    Else Jobname := '';

    If Citizen.Gender = GeFemale Then
      GenderNAme := 'female' else GenderName:='male';

    If Citizen.Special<>'' Then
      SpecialText := ', undercover '+Citizen.SPecial Else SpecialText := '';

    if SbLarge in Flags THen Begin

      Family  :='';
      Friend :='';
      Enemy  :='';
      For RelationIndex := 0 To Citizen.Relations.Count-1 Do Begin
          RelationShip := Citizen.Relations[RelationIndex];
          If RelationShip.Target.isDead Then Continue;
          Case Relationship.Kind of
             relNone, relParent, relChild,
             relMarried, relSibling, relHalfSibling :
                Begin
                  if Family <> '' Then Family := Family +', ';
                  Family := Family + Format('%s (%s)', [Relationship.Target.FullName(Citizen), Relationship.kindAsString]);
                End;
              relFriend, relInLove :
                Begin
                  if Friend <> '' Then Friend := Friend +', ';
                  Friend := Friend + Format('%s', [Relationship.Target.FullName(Citizen)]);
                End;
              relEnemy:
                Begin
                  if Enemy <> '' Then Enemy := Enemy +', ';
                  Enemy := Enemy + Format('%s', [Relationship.Target.FullName(Citizen)]);
                End;
          End;
      End;

    End;

    If Family <> '' Then Family := ' Relatives: '+Family+'.';
    If Friend <> '' Then Friend := ' Close Friends: '+Friend+'.';
    If Enemy <> ''  Then Enemy  := ' Enemies: '+Enemy+'.';

    fExporter.TextOut('statblock',
          Format('<text:span text:style-name="BOLD1">%s</text:span>: %s%s%s, %s,  age %d%s%s.%s%s%s',
              [Trim(Citizen.fullName),
               Alignment,
               Citizen.Race.Name,
               JobName,
               GenderNAme,
               Citizen.AgeYears,  SpecialText, Quirks,Friend,Enemy,Family]));
End;

Procedure TCityExport.exportImportantPeople;
Var CitizenIndex : Integer;
    Citizen      : TCitizen;
    Count        : Integer;
Begin
  if fImportantCitizens.Count=0 then exit;
  fExporter.TextOut('header','important people');
  Count := fImportantCitizens.Count;
  if count > 5 then count:=5;
  For CitizenIndex := 0 To Count-1 Do Begin
    Citizen := fImportantCitizens[CitizenIndex] as TCitizen;
    OutStatblock(Citizen,[SbLarge]);
  End;
End;

Procedure TCityExport.exportPeople;
Var CitizenIndex : Integer;
    Citizen      : TCitizen;
Begin
  if fSpareCitizens.Count=0 then exit;
  fExporter.TextOut('header','people');
  For CitizenIndex := 0 To fSpareCitizens.Count-1 Do Begin
    Citizen := fSpareCitizens[CitizenIndex] as TCitizen;
    OutStatblock(Citizen);
//    fExporter.TextOut('statblock',Citizen.nickName);
  End;
End;


Procedure TCityExport.processCitizens;
Var CitizenIndex : Integer;
    Citizen      : TCitizen;
Begin
  For CitizenIndex := 0 To Engine.Citizens.Count-1 Do Begin
      Citizen := Engine.Citizens[CitizenIndex];
      If (Citizen.City <> fCity) or Citizen.isDead Then Continue;

      if Citizen.Job<>nil Then
        InsertLocationCitizen(Citizen);
        
      InsertSpareCitizen(Citizen);
      ConsiderAsImportantCitizen(Citizen);
  End;
End;

Procedure TCityExport.exportCityCore;
Var CitySize : TCitySize;
    SizeReal : Real;
Begin
  fExporter.TextOut('cityname',fCity.Name);
  fExporter.TextOut('header','demographics');
  CitySize := Engine.CitySizes.getBySize(fCity.DesiredCitizens);
  SizeReal := CitySize.Citizens;
  fExporter.TExtOut('standaard',Format('Population: %.0n (%s)',[SizeReal,CitySize.Name]));
End;

Procedure TCityExport.Execute;
Begin
    processCitizens;
    exportCityCore;
    exportLocations;
    exportImportantPeople;
    exportPeople;
End;

Destructor TCityExport.Destroy;
Begin
  FreeAndNil(fImportantCitizens);
  FreeAndNil(fLocationCitizens);
  FreeAndNil(fSpareCitizens);
  Inherited;
End;


end.
