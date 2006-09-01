program BoxOfFlumph;

uses
  Forms,
  FrmMain in 'FrmMain.pas' {Main},
  UniEngine in 'UniEngine.pas',
  UniEventTemplates in 'UniEventTemplates.pas',
  FrmPad in 'FrmPad.pas' {PadForm},
  UniResources in 'UniResources.pas',
  UniExport in 'UniExport.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
