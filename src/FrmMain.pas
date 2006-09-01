unit FrmMain;

interface

// TODO : Add events for evil- and good aligned characters
// TODO : Add lawful/chaotic
// TODO : Assign correct traits to evil- and good aligned characters
// TODO : Randomly spawn cities.
// TODO : City and kingdom wide events. (Plagues)
// TODO : Add 'cover identity', so a truthful character might be a monster
//        in disguise, like a cloaked dragon.
// TODO : ADd (Clearly marked) adventurers.

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UniEngine, StdCtrls, xmldom, XMLIntf, oxmldom, XMLDoc,
  NxColumns, NxColumnClasses, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, ExtCtrls, ImgList, Buttons, ComCtrls, Menus, RxGIF,
  XPMan, NxEdit;

type
  TMain = class(TForm)
    PageControl1: TPageControl;
    GenerationSheet: TTabSheet;
    CampaignPage: TTabSheet;
    Splitter5: TSplitter;
    Panel2: TPanel;
    Splitter2: TSplitter;
    Splitter4: TSplitter;
    Splitter6: TSplitter;
    Panel11: TPanel;
    RelatieGrid: TNextGrid;
    NxNumberColumn6: TNxNumberColumn;
    NxImageColumn2: TNxImageColumn;
    NxImageColumn5: TNxImageColumn;
    NxTextColumn4: TNxTextColumn;
    NxTextColumn15: TNxTextColumn;
    NxTextColumn5: TNxTextColumn;
    Panel10: TPanel;
    Panel8: TPanel;
    FamilyGrid: TNextGrid;
    NxNumberColumn7: TNxNumberColumn;
    NxImageColumn7: TNxImageColumn;
    NxImageColumn8: TNxImageColumn;
    NxTextColumn11: TNxTextColumn;
    NxTextColumn16: TNxTextColumn;
    NxTextColumn20: TNxTextColumn;
    Panel12: TPanel;
    Panel9: TPanel;
    EventGrid: TNextGrid;
    NxTextColumn12: TNxTextColumn;
    NxTextColumn9: TNxTextColumn;
    NxTextColumn8: TNxTextColumn;
    Panel13: TPanel;
    Panel14: TPanel;
    PersonalityGrid: TNextGrid;
    NxNumberColumn8: TNxNumberColumn;
    NxTextColumn23: TNxTextColumn;
    Panel15: TPanel;
    lblActivePerson: TPanel;
    lblActivePersonAlignment: TPanel;
    Panel7: TPanel;
    AgeProgress: TProgressBar;
    Panel16: TPanel;
    Panel3: TPanel;
    Panel17: TPanel;
    Bevel1: TBevel;
    PersonGrid: TNextGrid;
    NxNumberColumn1: TNxNumberColumn;
    NxNumberColumn2: TNxNumberColumn;
    NxTreeColumn1: TNxTreeColumn;
    NxImageColumn1: TNxImageColumn;
    NxImageColumn3: TNxImageColumn;
    NxImageColumn6: TNxImageColumn;
    NxImageColumn4: TNxImageColumn;
    NxTextColumn2: TNxTextColumn;
    NxTextColumn14: TNxTextColumn;
    NxTextColumn21: TNxTextColumn;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn7: TNxTextColumn;
    NxTextColumn10: TNxTextColumn;
    NxTextColumn6: TNxTextColumn;
    NxTextColumn3: TNxTextColumn;
    Panel18: TPanel;
    PanelNoCitizens: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    Label2: TLabel;
    BtnAddTenYears: TButton;
    BtnAddHundredYears: TButton;
    Button1: TButton;
    BtnAddTenthousandYears: TButton;
    Panel19: TPanel;
    lblTitle: TLabel;
    BtnAddHundredThousandYears: TButton;
    Panel20: TPanel;
    XMLDocument1: TXMLDocument;
    deathImages: TImageList;
    birthImageList: TImageList;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Reset1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    GenderImageList: TImageList;
    AlignmentList: TImageList;
    XPManifest1: TXPManifest;
    Panel6: TPanel;
    BtnShowDead: TSpeedButton;
    BtnGroupByCity: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    SimuCitySheet: TTabSheet;
    Panel4: TPanel;
    Splitter1: TSplitter;
    Label3: TLabel;
    CityGrid: TNextGrid;
    NxNumberColumn3: TNxNumberColumn;
    NxTextColumn13: TNxTextColumn;
    NxNumberColumn4: TNxNumberColumn;
    NxNumberColumn5: TNxNumberColumn;
    Panel5: TPanel;
    IndustryGrid: TNextGrid;
    NxTextColumn17: TNxTextColumn;
    NxTextColumn18: TNxTextColumn;
    NxTextColumn19: TNxTextColumn;
    Panel24: TPanel;
    NewCityGrid: TNextGrid;
    Panel26: TPanel;
    Panel27: TPanel;
    Button3: TButton;
    Panel22: TPanel;
    BtnAddCity: TSpeedButton;
    Label5: TLabel;
    NxTextColumn22: TNxTextColumn;
    NxCheckBoxColumn1: TNxCheckBoxColumn;
    NxTextColumn24: TNxTextColumn;
    NxTextColumn25: TNxTextColumn;
    NxRaceDropdownBox: TNxComboBox;
    NxEditName: TNxEdit;
    NxCityDropdownBox: TNxComboBox;
    BtnDelCity: TSpeedButton;
    BtnClearCities: TSpeedButton;
    BtnAutomaticKingdom: TSpeedButton;
    NxTextColumn26: TNxTextColumn;
    NxRateColumn1: TNxRateColumn;
    NxTextColumn27: TNxTextColumn;
    NxTextColumn28: TNxTextColumn;
    Panel23: TPanel;
    SpeedButton3: TSpeedButton;
    SaveDialog1: TSaveDialog;
    Panel25: TPanel;
    Panel28: TPanel;
    SamengesteldPanel: TPanel;
    Label1: TLabel;
    Image2: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Image3: TImage;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    procedure BtnAddHundredYearsClick(Sender: TObject);
    procedure BtnAddTenYearsClick(Sender: TObject);
    procedure BtnRestartEngineClick(Sender: TObject);
    procedure PersonGridSelectCell(Sender: TObject; ACol, ARow: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PersonGridCellColoring(Sender: TObject; ACol, ARow: Integer;
      var CellColor, GridColor: TColor; CellState: TCellState);
    procedure BtnShowDeadClick(Sender: TObject);
    procedure CityGridSelectCell(Sender: TObject; ACol, ARow: Integer);
    procedure BtnGroupByCityClick(Sender: TObject);
    procedure BtnAddThousandYearsClick(Sender: TObject);
    procedure BtnAddTenthousandYearsClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure PaddingTool1Click(Sender: TObject);
    procedure RelatieGridCellColoring(Sender: TObject; ACol, ARow: Integer;
      var CellColor, GridColor: TColor; CellState: TCellState);
    procedure PersonalityGridCellFormating(Sender: TObject; ACol,
      ARow: Integer; var TextColor: TColor; var FontStyle: TFontStyles;
      CellState: TCellState);
    procedure BtnAddHundredThousandYearsClick(Sender: TObject);
    procedure PersonGridCellFormating(Sender: TObject; ACol, ARow: Integer;
      var TextColor: TColor; var FontStyle: TFontStyles;
      CellState: TCellState);
    procedure Button2Click(Sender: TObject);
    procedure BtnAddCityClick(Sender: TObject);
    procedure BtnDelCityClick(Sender: TObject);
    procedure BtnClearCitiesClick(Sender: TObject);
    procedure BtnAutomaticKingdomClick(Sender: TObject);
    procedure PersonGridCustomDrawCell(Sender: TObject; ACol,
      ARow: Integer; CellRect: TRect; CellState: TCellState);
    procedure NewCityGridCellColoring(Sender: TObject; ACol, ARow: Integer;
      var CellColor, GridColor: TColor; CellState: TCellState);
    procedure NewCityGridCellFormating(Sender: TObject; ACol,
      ARow: Integer; var TextColor: TColor; var FontStyle: TFontStyles;
      CellState: TCellState);
    procedure NewCityGridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
      var Accept: Boolean);
    procedure NewCityGridCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Label16Click(Sender: TObject);
  private
    { Private declarations }
    Procedure RefreshLists;
    Procedure RefreshIndustryList;
    Procedure RefreshEventGrid;
    Function  ActiveCity    : TCity;
    Function  ActiveCitizen : TCitizen;
    Procedure RefreshCitys;
    Procedure RefreshByCity;
    Procedure RefreshByFamily;
    procedure AgeByYears(Years : Integer);
    Procedure FillCityDropdownBox;
    Procedure FillRaceDropdownBox;
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

uses FrmPad, UniResources, UniExport;

{$R *.dfm}

Function TMain.ActiveCitizen : TCitizen;
Begin
  if PersonGrid.RowExist(PersonGrid.SelectedRow) and (PersonGrid.SelectedRow >= 0) and
     (PersonGrid.Cell[0,PersonGrid.SelectedRow].asInteger > -1) Then
    Result := Engine.Citizens[PersonGrid.Cell[0,PersonGrid.SelectedRow].asInteger]
  Else Result := nil;
End;

Function  TMain.ActiveCity    : TCity;
Begin
  if CityGrid.RowExist(CityGrid.SelectedRow) and (CityGrid.SelectedRow >= 0) and
     (CityGrid.Cell[0,CityGrid.SelectedRow].asInteger > -1) Then
    Result := Engine.Cities[CityGrid.Cell[0,CityGrid.SelectedRow].asInteger]
  Else Result := nil;
End;

Procedure TMain.RefreshIndustryList;
Var I    : Integer;
    City : TCity;
Begin
  IndustryGrid.ClearRows;
  City := ActiveCity;
  If City<>nil Then Begin
    For I := 0 To Engine.Industries.Count-1 Do Begin
      IndustryGrid.AddCells([
          Engine.Industries[I].Name,
          IntToStr(Engine.Industries[I].Practitioners(City)),
          IntToStr(Engine.Industries[I].MaxPractitioners(City))]);
    End;
  End;
End;



Procedure TMain.RefreshEventGrid;
Var
    I         : Integer;
    Citizen   : TCitizen;
    Gender : integer;
    DeathImageIndex : Integer;
    JobTxt : String;
    Color : TColor;
Begin
   EventGrid.ClearRows;
   FamilyGrid.ClearRows;
   PersonalityGrid.ClearRows;
   RelatieGrid.ClearRows;
   Citizen := ActiveCitizen;
   If Citizen<>nil Then Begin
     lblActivePerson.Caption := Citizen.nickName;
     Case Citizen.Alignment of
      AlGood    : lblActivePersonAlignment.Caption := 'Good';
      ALNeutral : lblActivePersonAlignment.Caption := 'Neutral';
      AlEvil    : lblActivePersonAlignment.Caption := 'Evil';
     End;
     
     lblActivePersonAlignment.Caption   := lblActivePersonAlignment.Caption+' '+Citizen.Race.Name;
     if Citizen.Special<>'' Then
       PersonalityGrid.AddCells(['1','Real race: '+Citizen.Special]);


     PersonalityGrid.AddCells(['1',Citizen.Personality]);
     If Citizen.ageYears >= 8 Then Begin // prevent toddlers from having too much of a personality.
       For I := 0 To Citizen.Quirks.Count-1 Do
          PersonalityGrid.AddCells(['0',Citizen.Quirks[I]]);
     End;

     For I := 0 To Citizen.Events.Count-1 Do
        EventGrid.AddCells([Citizen.Events[I].Date.YearsAgo,Citizen.Events[I].Title, Citizen.Events[I].Date.asString]);
     For I := 0 To Citizen.Relations.Count-1 Do Begin
        if Citizen.Relations[I].Target.isDead Then
          DeathImageIndex := 0
        Else
          DeathImageIndex := -1;

        JobTxt := Citizen.Relations[I].Target.JobName;

        If Citizen.Relations[I].Target.Gender = GeFemale Then
          Gender := 1
        Else
          Gender := 0;;

        Color := ClWhite;
        if Citizen.Relations[I].Kind = RelEnemy  Then Color := $EEEEFF;
        if Citizen.Relations[I].Kind = RelFriend Then Color := $EEFFEE;

        if  Citizen.Relations[I].Kind in [RelMarried,RelParent, relSibling, relHalfSibling,relChild] Then
          FamilyGrid.AddCells([
              IntToStr(Color),
              IntToStr(DeathImageIndex),
              IntToStR(Gender),
              Citizen.Relations[I].Target.fullName,
              JobTxt,
              Citizen.Relations[I].kindAsString,
              Citizen.Relations[I].Target.City.Name])
        Else
          RelatieGrid.AddCells([
              IntToStr(Color),
              IntToStr(DeathImageIndex),
              IntToStR(Gender),
              Citizen.Relations[I].Target.fullName,
              JobTxt,
              Citizen.Relations[I].kindAsString,
              Citizen.Relations[I].Target.City.Name]);
     End;
   End else begin
       lblActivePerson.Caption := '';
       lblActivePersonAlignment.Caption   := '';
   end;
End;

Procedure TMain.RefreshCitys;
Var CityIndex : Integer;
Begin
  CityGrid.ClearRows;
  For CityIndex := 0 To Engine.Cities.Count-1 Do Begin
      CityGrid.AddCells([IntToStr(CityIndex), Engine.Cities[CityIndex].Name, IntToStr(Engine.Cities[CityIndex].Citizens),IntToStr(Engine.Cities[CityIndex].DesiredCitizens)]);
  End;
End;

Procedure TMain.RefreshLists;
Begin
  if BtnGroupByCity.Down Then
    RefreshByCity
  Else
    RefreshByFamily;

  PanelNoCitizens.Align   := AlClient;
  PanelNoCitizens.Visible := PersonGrid.RowCount = 0;
  Panel6.Visible          := not PanelNoCitizens.Visible;

End;

Procedure TMain.RefreshByCity;
Var CitIndex  : Integer;
    Citizen   : TCitizen;
    DeathImageIndex : Integer;
    CityIndex : Integer;
    BirthImageIndex : Integer;
    firstFound : Boolean;
    FamilyRow : Integer;
    CitizenCount : Integer;
    I : Integer;
Begin
   RefreshCitys;
   FamilyRow := -1;
   lblTitle.Caption := Engine.Today.asString;
   PersonGrid.ClearRows;
    For CityIndex := 0 To Engine.Cities.Count-1 Do Begin


      firstFound   := false;
      CitizenCount := 0;
      For CitIndex := 0 To Engine.Citizens.Count-1 Do Begin
        Citizen := Engine.Citizens[CitIndex];
        if  (Citizen.City <> Engine.Cities[CityIndex]) Then Continue;
        if (not BtnShowDead.Down) and Citizen.isDead Then Continue;

        if not firstFound Then Begin
          PersonGrid.AddRow();
          FamilyRow := PersonGrid.LastAddedRow;
          PersonGrid.Cells[0,FamilyRow] := '-1';
          PersonGrid.Cells[1,FamilyRow] := IntToStr(Engine.Cities[CityIndex].Color);
          PersonGrid.Cells[2,FamilyRow] := '';
          PersonGrid.Cells[3,FamilyRow] := '-1';
          PersonGrid.Cells[4,FamilyRow] := '-1';
          PersonGrid.Cells[5,FamilyRow] := '-1';
          PersonGrid.Cells[6,FamilyRow] := '-1';
          firstFound := true;
        End;

        if Citizen.isDead Then
          DeathImageIndex := 0
        Else
          DeathImageIndex := -1;


        if Citizen.BirthChance > 0 Then
          BirthImageIndex := 0
        Else
          BirthImageIndex := -1;

        PersonGrid.AddChildRow(FamilyRow);
        PersonGrid.Cells[0,PersonGrid.LastAddedRow] := IntToStr(CitIndex);
        PersonGrid.Cells[1,PersonGrid.LastAddedRow] := IntToStr(Engine.Cities[CityIndex].Color);
        PersonGrid.Cells[3,PersonGrid.LastAddedRow] := IntToStr(DeathImageIndex);
        PersonGrid.Cells[4,PersonGrid.LastAddedRow] := IntToStr(BirthImageIndex);
        If Citizen.Alignment = AlGood Then
          PersonGrid.Cell[5,PersonGrid.LastAddedRow].asInteger := 1
        Else If Citizen.Alignment = AlEvil Then
          PersonGrid.Cell[5,PersonGrid.LastAddedRow].asInteger := 0
        Else
          PersonGrid.Cell[5,PersonGrid.LastAddedRow].asInteger := -1;

        If Citizen.Gender = GeFemale Then
          PersonGrid.Cell[6,PersonGrid.LastAddedRow].asInteger := 1
        Else
          PersonGrid.Cell[6,PersonGrid.LastAddedRow].asInteger := 0;;

        PersonGrid.Cells[7,PersonGrid.LastAddedRow] := '   ' + Citizen.nickName;

        PersonGrid.Cells[8,PersonGrid.LastAddedRow] := Citizen.JobName;

        PersonGrid.Cells[9,PersonGrid.LastAddedRow] := Citizen.FirstName;
        PersonGrid.Cells[10,PersonGrid.LastAddedRow] := Citizen.BirthFamily.Lastname;
        PersonGrid.Cells[11,PersonGrid.LastAddedRow] := Citizen.GenerationAsString;

        Case Citizen.AgeCategory of
           AcChild      : PersonGrid.Cells[12,PersonGrid.LastAddedRow] := 'Child ('+IntTostr(Citizen.AgeYears)+')';
           AcAdult      : PersonGrid.Cells[12,PersonGrid.LastAddedRow] := 'Adult ('+IntTostr(Citizen.AgeYears)+')';
           AcMiddleAged : PersonGrid.Cells[12,PersonGrid.LastAddedRow] := 'Middle aged ('+IntTostr(Citizen.AgeYears)+')';
           AcOld        : PersonGrid.Cells[12,PersonGrid.LastAddedRow] := 'Old ('+IntTostr(Citizen.AgeYears)+')';
           AcVenerable  : PersonGrid.Cells[12,PersonGrid.LastAddedRow] := 'Very old ('+IntTostr(Citizen.AgeYears)+')';
        End;


        PersonGrid.Cells[13,PersonGrid.LastAddedRow] := Citizen.City.Name;
        PersonGrid.Cells[14,PersonGrid.LastAddedRow] := Citizen.Race.name;
        PersonGrid.Cells[15,PersonGrid.LastAddedRow] := Citizen.Badge;
        PersonGrid.Cell[16,PersonGrid.LastAddedRow].asInteger := Citizen.Rating;
        Inc(CitizenCount);
     End;

     if firstFound Then Begin
       PersonGrid.Cells[7,FamilyRow] := Engine.Cities[CityIndex].Name+' ['+IntTostr(CitizenCount)+' Citizens]';
     End;
   End;

   For I := 0 To PersonGrid.RowCount-1 Do
     PersonGrid.Expanded[I] := False;

End;


Procedure TMain.RefreshByFamily;
Var CitIndex  : Integer;
    Citizen   : TCitizen;
    DeathImageIndex : Integer;
    FamilyIndex : Integer;
    BirthImageIndex : Integer;
    firstFound : Boolean;
    FamilyRow : Integer;
Begin
   RefreshCitys;
   FamilyRow := -1;
   lblTitle.Caption := Engine.Today.asString;
   PersonGrid.ClearRows;
    For FamilyIndex := 0 To Engine.Families.Count-1 Do Begin


      firstFound := false;
      For CitIndex := 0 To Engine.Citizens.Count-1 Do Begin
        Citizen := Engine.Citizens[CitIndex];
        if  (Citizen.mainFamily <> Engine.Families[FamilyIndex]) Then Continue;
        if (not BtnShowDead.Down) and Citizen.isDead Then Continue;

        if not firstFound Then Begin
          PersonGrid.AddRow();
          FamilyRow := PersonGrid.LastAddedRow;
          PersonGrid.Cells[0,FamilyRow] := '-1';
          PersonGrid.Cells[1,FamilyRow] := IntToStr(Engine.Families[FamilyIndex].Color);
          PersonGrid.Cells[2,FamilyRow] := Engine.Families[FamilyIndex].Lastname;
          PersonGrid.Cells[3,FamilyRow] := '-1';
          PersonGrid.Cells[4,FamilyRow] := '-1';
          PersonGrid.Cells[5,FamilyRow] := '-1';
          PersonGrid.Cells[6,FamilyRow] := '-1';
          firstFound := true;
        End;

        if Citizen.isDead Then
          DeathImageIndex := 0
        Else
          DeathImageIndex := -1;


        if Citizen.BirthChance > 0 Then
          BirthImageIndex := 0
        Else
          BirthImageIndex := -1;

        PersonGrid.AddChildRow(FamilyRow);
        PersonGrid.Cells[0,PersonGrid.LastAddedRow] := IntToStr(CitIndex);
        PersonGrid.Cells[1,PersonGrid.LastAddedRow] := IntToStr(Engine.Families[FamilyIndex].Color);
        PersonGrid.Cells[3,PersonGrid.LastAddedRow] := IntToStr(DeathImageIndex);
        PersonGrid.Cells[4,PersonGrid.LastAddedRow] := IntToStr(BirthImageIndex);
        If Citizen.Alignment = AlGood Then
          PersonGrid.Cell[5,PersonGrid.LastAddedRow].asInteger := 1
        Else If Citizen.Alignment = AlEvil Then
          PersonGrid.Cell[5,PersonGrid.LastAddedRow].asInteger := 0
        Else   
          PersonGrid.Cell[5,PersonGrid.LastAddedRow].asInteger := -1;

        If Citizen.Gender = GeFemale Then
          PersonGrid.Cell[6,PersonGrid.LastAddedRow].asInteger := 1
        Else
          PersonGrid.Cell[6,PersonGrid.LastAddedRow].asInteger := 0;
        PersonGrid.Cells[7,PersonGrid.LastAddedRow] := Citizen.nickName;

        PersonGrid.Cells[8,PersonGrid.LastAddedRow] := Citizen.JobName;

        PersonGrid.Cells[9,PersonGrid.LastAddedRow] := Citizen.FirstName;
        PersonGrid.Cells[10,PersonGrid.LastAddedRow] := Citizen.BirthFamily.Lastname;
        PersonGrid.Cells[11,PersonGrid.LastAddedRow] := Citizen.GenerationAsString;
        PersonGrid.Cells[12,PersonGrid.LastAddedRow] := IntTostr(Citizen.AgeYears);
        PersonGrid.Cells[13,PersonGrid.LastAddedRow] := Citizen.City.Name;
        PersonGrid.Cells[14,PersonGrid.LastAddedRow] := Citizen.Race.name;
        PersonGrid.Cells[15,PersonGrid.LastAddedRow] := Citizen.Badge;
        PersonGrid.Cell[16,PersonGrid.LastAddedRow].asInteger := Citizen.Rating;

  {         Citizen.Refresh;
           Memo1.Lines.Add('   '+'----');

           For I := 0 To Citizen.FinalBenefits.Count-1 Do
             Memo1.Lines.Add('   '+
              Citizen.FinalBenefits.BenefitIdentifier(I)+
              ': '+
                Citizen.FinalBenefits.Items[I].asString);}
     End;
   End;
End;

procedure TMain.AgeByYears(Years : Integer);
Var I : Integer;
begin
 screen.Cursor := CrHourglass;
 AgeProgress.Visible := true;
 Application.ProcessMessages;
 Try
   AgeProgress.Min := 0;
   AgeProgress.Max := Years-1;
   For I := 0 To Years-1 Do Begin
     Engine.Age;
     AgeProgress.Position := I;
     if (I mod 10)=9 Then Application.ProcessMessages;
   End;
   RefreshLists;
 Finally
  screen.Cursor := CrDefault;
  AgeProgress.Visible := false;
  Application.ProcessMessages;
 End;
end;

procedure TMain.BtnAddHundredYearsClick(Sender: TObject);
begin
 AgeByYears(100);
end;

procedure TMain.BtnAddTenYearsClick(Sender: TObject);
begin
 AgeByYears(10);
end;

procedure TMain.BtnRestartEngineClick(Sender: TObject);
begin
 CampaignPage.TabVisible := True;
 GenerationSheet.TabVisible := False;
 SimuCitySheet.TabVisible   := False;
 PageControl1.ActivePage := CampaignPage;
 Engine.Clear;
 
          {

 For I := 0 To 20 Do
   TFamily.Create(Engine.Races[0]);

 // make sure we have some married families.
 For I := 0 To 20 Do Begin
   if (I mod 5)=4 Then For J := 0 To 20 Do Engine.Age;
   If I >= 19 Then TargetCity := City3 Else
     If I >= 16 Then TargetCity := City2 Else TargetCity := City;

   TargetCity.spawnRandomFamily;
 End;         }
 BtnAutomaticKingdomClick(self);
 RefreshLists;
 RefreshEventGrid;
end;

procedure TMain.PersonGridSelectCell(Sender: TObject; ACol, ARow: Integer);
begin
  RefreshEventGrid;
end;


Procedure TMain.FillRaceDropdownBox;
Var I : Integer;
Begin
 NxRaceDropdownBox.Items.Clear;
 For I := 0 To Engine.Races.COunt-1 Do
  NxRaceDropdownBox.Items.Add(Engine.Races[I].NAme);
End;

Procedure TMain.FillCityDropdownBox;
Var I : Integer;
Begin
 NxCityDropdownBox.Items.Clear;
 For I := 0 To Engine.CitySizes.COunt-1 Do
  NxCityDropdownBox.Items.Add(Engine.CitySizes[I].NAme);
End;

procedure TMain.FormShow(Sender: TObject);
begin

  FillRaceDropdownBox;
  FillCityDropdownBox;

  BtnRestartEngineClick(self);
end;

procedure TMain.FormCreate(Sender: TObject);
begin
 WindowState := WsMaximized;
 Caption     := appTitle;
end;

procedure TMain.PersonGridCellColoring(Sender: TObject; ACol,
  ARow: Integer; var CellColor, GridColor: TColor; CellState: TCellState);
begin
 if PersonGrid.RowExist(ARow) and not ( CsSelected  in CellState )  Then
   CellColor := PersonGrid.Cell[1,ARow].asInteger;
end;

procedure TMain.BtnShowDeadClick(Sender: TObject);
begin
 if BtnShowDead.Down Then BtnShowDead.Caption := 'Show Dead' else BtnShowDead.Caption := 'Hide Dead';
 RefreshLists;
end;

procedure TMain.CityGridSelectCell(Sender: TObject; ACol, ARow: Integer);
begin
 RefreshIndustryList;
end;

procedure TMain.BtnGroupByCityClick(Sender: TObject);
begin
 RefreshLists;
end;

procedure TMain.BtnAddThousandYearsClick(Sender: TObject);
begin
 AgeByYears(1000);
End;

procedure TMain.BtnAddTenthousandYearsClick(Sender: TObject);
begin
  Case MessageDlg('Time intensive. continue?', mtConfirmation, [mbYes, mbNo,mbCancel],0) of
    MrYes    : AgeByYears(10000);
  End;
end;

procedure TMain.Exit1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TMain.PaddingTool1Click(Sender: TObject);
begin
  PadForm := TPadForm.Create(self);
  Try
    PadForm.ShowModal;
  Finally
    PadForm.Free;
  End;
end;

procedure TMain.RelatieGridCellColoring(Sender: TObject; ACol,
  ARow: Integer; var CellColor, GridColor: TColor; CellState: TCellState);
begin
 if RelatieGrid.RowExist(ARow) and not ( CsSelected  in CellState )  Then
   CellColor := RelatieGrid.Cell[0,ARow].asInteger;
end;

procedure TMain.PersonalityGridCellFormating(Sender: TObject; ACol,
  ARow: Integer; var TextColor: TColor; var FontStyle: TFontStyles;
  CellState: TCellState);
begin
 if PersonalityGrid.RowExist(ARow) and (PersonalityGrid.Cell[0,Arow].AsInteger=1) Then
    FontStyle := FontStyle + [FsBOld];
end;

procedure TMain.BtnAddHundredThousandYearsClick(Sender: TObject);
begin
  Case MessageDlg('Extremely time intensive. continue?', mtConfirmation, [mbYes, mbNo,mbCancel],0) of
    MrYes    : AgeByYears(100000);
  End;
end;

procedure TMain.PersonGridCellFormating(Sender: TObject; ACol,
  ARow: Integer; var TextColor: TColor; var FontStyle: TFontStyles;
  CellState: TCellState);
begin
 if PersonGrid.RowExist(ARow) and (PersonGrid.Cell[0,ARow].asInteger=-1) Then
   FontStyle := FontStyle + [FsUnderline];
end;

procedure TMain.Button2Click(Sender: TObject);
Var Row  : Integer;
    City : TCity;
    Found : BOolean;
begin
 Found := false;
 For Row := 0 To NewCityGrid.RowCount-1 Do Begin
   If NewCityGrid.Cell[0,Row].asBoolean Then Begin Found := True; Break; End;
 End;
 If not Found Then Begin
    ShowMessage('You need at least /one/ spawn city.');
    Exit;
 End;
 Engine.Clear;
 Engine.Cities.Clear;
 For Row := 0 To NewCityGrid.RowCOunt-1 Do Begin
   City      := TCity.Create;
   City.name              := NewCityGrid.Cell[1,Row].asString;
   City.MainRace          :=
      Engine.Races.GetByName(NewCityGrid.Cell[3,Row].asString);
   If NewCityGrid.Cell[0,Row].asBoolean Then Begin
     City.FamilySpawnChance := City.MainRace.BirthPercentage; // Race based chance to spawn a family each year.
     City.Jobless           := True; // no jobs here, people /have/ to migrate.
   End;
   City.DesiredCitizens   :=
      Engine.CitySizes.GetByName(NewCityGrid.Cell[2,Row].asString,[CsCreateIfMissing]).NotableCitizens;
   Engine.Cities.add(City);
 End;

 CampaignPage.TabVisible := False;
 GenerationSheet.TabVisible := True;
 SimuCitySheet.TabVisible := True;
 PageControl1.ActivePage := GenerationSheet;
end;

procedure TMain.BtnAddCityClick(Sender: TObject);
Var Race : TRace;
begin
 Race := Engine.Races[Random(Engine.Races.Count)];
 NewCityGrid.AddCells(['0',
        Race.randomName(NAME_TOWN),
        Engine.CitySizes[Random(Engine.CitySizes.Count)].Name,
        Race.Name]);
end;

procedure TMain.BtnDelCityClick(Sender: TObject);
begin
 if (NewCityGrid.SelectedRow <> -1)
     and NewCityGrid.RowExist(NewCityGrid.SelectedRow) Then Begin
    NewCityGrid.DeleteRow(NewCityGrid.SelectedRow);
 End;
end;

procedure TMain.BtnClearCitiesClick(Sender: TObject);
begin
 NewCityGrid.ClearRows;
end;

procedure TMain.BtnAutomaticKingdomClick(Sender: TObject);
Var I : Integer;
    CityCount : Integer;
    Kind : Integer;
    Scale : Integer;
    Race : TRace;
begin
  NewCityGrid.ClearRows;
  For Kind := 0 To Engine.Races.Count-1 Do Begin
    NewCityGrid.AddCells(['true','Kingdom of '+Engine.Races[Kind].Name,
        Engine.CitySizes[0].Name,
        Engine.Races[Kind].Name]);
  End;
  For Kind := Engine.CitySizes.Count-1 DownTo 0 Do Begin
    Scale := Engine.CitySizes.Count-Kind;
    CityCount := Random((Scale*Scale)+2)+(Scale+1);
    For I := 0 To CityCount-1 Do Begin
       Race := Engine.Races[Random(Engine.Races.Count)];
       NewCityGrid.AddCells(['false',
            Race.randomName(NAME_TOWN),
            Engine.CitySizes[Kind].Name,
            Race.Name]);
    End;
  End;
end;

procedure TMain.PersonGridCustomDrawCell(Sender: TObject; ACol,
  ARow: Integer; CellRect: TRect; CellState: TCellState);
Var Text : String;
    TextOffsetY : Integer;
    Special : Boolean;
begin
 if (ACol = 7) and PersonGrid.RowExist(ARow) Then Begin
    Text := PersonGrid.Cell[15,AROw].asString;
    if Text <> '' Then Begin
      Special := Text[1]='!';
      if SPecial Then Text := Copy(Text,2,65535);
      Text := '['+ Text + ']';
      CellRect.Left := CellRect.Right-PersonGrid.Canvas.TextWidth(Text)-5;
      TextOffsetY   := CellRect.Top + ((CellRect.Bottom-CellRect.Top) Div 2) -(PersonGrid.Canvas.TextHeight(Text) div 2);
      PersonGrid.Canvas.Brush.Style := BsClear;
      if Special Then PersonGrid.Canvas.Font.Color := ClRed;
      PersonGrid.Canvas.TextOut(
        CellRect.Left,
        TextOffsetY,
        Text
        );
    End;
 End;
end;

procedure TMain.NewCityGridCellColoring(Sender: TObject; ACol,
  ARow: Integer; var CellColor, GridColor: TColor; CellState: TCellState);
begin
  If (ACol = 3) and not (CsSelected in CellState) Then Begin
   If NewCityGrid.RowExist(ARow) and NewCityGrid.Cell[0,ARow].asBoolean Then Begin
     CellColor := clWhite;
   End Else Begin
     CellColor := $EEEEEE;
   End;
 End;
end;

procedure TMain.NewCityGridCellFormating(Sender: TObject; ACol,
  ARow: Integer; var TextColor: TColor; var FontStyle: TFontStyles;
  CellState: TCellState);
begin
  If ACol = 3 Then Begin
   If not (NewCityGrid.RowExist(ARow) and NewCityGrid.Cell[0,ARow].asBoolean) Then Begin
     TextColor := $AAAAAA;
   End;
 End;
end;

procedure TMain.NewCityGridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
  var Accept: Boolean);
begin
 If ACol = 3 Then Begin
   Accept := NewCityGrid.RowExist(ARow) and NewCityGrid.Cell[0,ARow].asBoolean;
 End;
end;

procedure TMain.NewCityGridCellClick(Sender: TObject; ACol, ARow: Integer);
begin
 If ACol = 0 Then NewCityGrid.RefreshRow(ARow,False);
end;

procedure TMain.SpeedButton3Click(Sender: TObject);
Var Exporter : TExporter;
begin
  If SaveDialog1.Execute Then Begin
    Exporter := TExporter.Create;
    Try
      Exporter.ExportToFile(SaveDialog1.Filename);
      ExecuteFile(SaveDialog1.Filename,'','',0);
    Finally
      Exporter.Free;
    End;
  End;
end;

procedure TMain.Label16Click(Sender: TObject);
begin
 OpenWebsite('http://redblade.org/viewtopic.php?t=320');
end;

end.
