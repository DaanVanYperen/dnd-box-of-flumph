unit UniEventTemplates;

interface

Uses UniEngine, SysUtils;

Type

// Triggered upon creation of a new character.
TEventBirth = Class(TEventTemplate)
Public
    function getTitle : String; override;
    Procedure Execute(Target : TCitizen); override;
End;

TEventEmigrate = Class(TEventTemplate)
Public
    toCity : TCity;
    Procedure Execute(Target : TCitizen); override;
End;


TEventRetire = Class(TEventTemplate)
Public
    Procedure Execute(Target : TCitizen); override;
End;


TEventStartedWorking = Class(TEventTemplate)
Public
    Job : TJob;
    Procedure Execute(Target : TCitizen); override;
End;

// Triggered upon creation of a new character.
TEventGiveBirth = Class(TEventTemplate)
Public
    Child : TCitizen;
    Procedure Execute(Target : TCitizen); override;
End;

TWitnessDeath = Class(TEventTEmplate)
Public
  DeathOf : TCitizen;
  Procedure Execute(Target : TCitizen); override;
End;

TWitnessBirth = Class(TEventTEmplate)
Public
  BirthOf : TCitizen;
  Father  : TCitizen;
  Mother  : TCitizen;
  Procedure Execute(Target : TCitizen); override;
  // makes sure parent is assigned to the right slot. father/mother.
  Procedure AddParent(Parent : TCitizen);
End;

// Triggered upon natural death of a new character
TEventDeath = Class(TEventTemplate)
Public
    Procedure Execute(Target : TCitizen); override;
End;
// Triggered upon natural death of a new character
TEventNaturalDeath = Class(TEventDeath)
Public
    function getTitle : String; override;
End;

// Triggered upon natural death of a new character
TEventSuddenDeath = Class(TEventDeath)
Public
    function getTitle : String; override;
End;

TEventReachedVenerableAge = Class(TEventTemplate)
Public
    function getTitle : String; override;
End;

TEventReachedOldAge = Class(TEventTemplate)
Public
    function getTitle : String; override;
End;

TEventReachedMiddleAge = Class(TEventTemplate)
Public
    function getTitle : String; override;
End;


TEventReachedAdultAge = Class(TEventTemplate)
Public
    function getTitle : String; override;
End;

TSocialEvent = Class(TEventTemplate)
Public
    Other : TCitizen;
End;

TEventMadeFriend = Class(TSocialEvent)
    Procedure Execute(Target : TCitizen); override;
End;

TEventMadeEnemy = Class(TSocialEvent)
    Procedure Execute(Target : TCitizen); override;
End;

TEventMarried = Class(TSocialEvent)
    Procedure Execute(Target : TCitizen); override;
End;

implementation

Procedure TEventStartedWorking.Execute(Target : TCitizen); 
Var Event : TEvent;
Begin
  Event := TEvent.Create(self);
  Event.Title := 'started working as a '+Job.Name;
  Target.Events.Add(Event);
End;

Procedure TEventEmigrate.Execute(Target : TCitizen);
Var Event : TEvent;
Begin
  Event := TEvent.Create(self);
  Event.Title := 'emigrated to '+ToCity.Name;
  Target.Events.Add(Event);
End;

function TEventBirth.getTitle : String;
Begin
  Result := 'birth ';
End;

Procedure TEventRetire.Execute(Target : TCitizen);
Var Event : TEvent;
Begin
  Assert(Assigned(Target));
  Event := TEvent.Create(self);
  Event.Title := 'retired as '+Target.Job.name;
  Target.Events.Add(Event);
End;

Procedure TEventBirth.Execute(Target : TCitizen);
Var Event : TEvent;
Begin
  Assert(Assigned(Target));
  Event := TEvent.Create(self);
  Event.Title := 'born in '+Target.City.Name;
  Target.Events.Add(Event);
End;

Procedure TEventGiveBirth.Execute(Target : TCitizen);
Var Event : TEvent;
Begin
  Assert(Assigned(Target));
  Event := TEvent.Create(self);
  Event.Title := 'gave birth to '+Child.fullName;
  Target.Events.Add(Event);
End;

Procedure TEventMadeFriend.Execute(Target : TCitizen);
Var Event : TEvent;
Begin
  Event := TEvent.Create(self);
  Event.Title := 'became friends with '+Other.fullName;
  Target.Events.Add(Event);
End;


Procedure TEventMarried.Execute(Target : TCitizen);
Var Event : TEvent;
Begin
  Event := TEvent.Create(self);
  Event.Title := 'married '+Other.fullName;
  Target.Events.Add(Event);
End;

Procedure TEventMadeEnemy.Execute(Target : TCitizen);
Var Event : TEvent;
Begin
  Event := TEvent.Create(self);
  Event.Title := 'became enemy of '+Other.fullName;
  Target.Events.Add(Event);
End;


Procedure TEventDeath.Execute(Target : TCitizen);
Var Event : TEvent;
Begin
  Assert(Assigned(Target));
  Event := TEvent.Create(self);
  Event.Title := Event.Title + ' at age ' + IntToStr(Target.ageYears);
  Target.Events.Add(Event);
  Target.isDead := True;
End;

function TEventNaturalDeath.getTitle : String;
Begin
  Result := 'death (natural)';
End;

function TEventSuddenDeath.getTitle : String;
Begin
  Result := 'death (sudden)';
End;

function TEventReachedVenerableAge.getTitle : String;
Begin
  Result := 'reached venerable age';
End;

function TEventReachedOldAge.getTitle : String;
Begin
  Result := 'reached old age';
End;

function TEventReachedMiddleAge.getTitle : String;
Begin
  Result := 'reached middle age';
End;

function TEventReachedAdultAge.getTitle : String;
Begin
  Result := 'reached adult age';
End;

{ = Class(TEventTEmplate)
Public
  fDeathOf : TCitizen;
Private}


Procedure TWitnessBirth.Execute(Target : TCitizen);
Var
  MatchingParents   : Integer;
  relationship : TRelationship;
Begin
  if Target.isDead or (Target=BirthOf) Then Exit;

  MatchingParents := 0;
  if Target.Relations.getMother=Mother Then Inc(MatchingParents);
  if Target.Relations.getFather=Father Then Inc(MatchingParents);

  if MatchingParents > 0 THen Begin
    relationship := Target.Relations.getRelationshipByCitizen(BirthOf,[RfCreateIfMissing]);
    If MatchingParents=2 Then relationship.kind := RelSibling; // full brother/sister
    If MAtchingParents=1 Then relationship.kind := RelHalfSibling;; // Half brother/sister
  End;
End;

Procedure TWitnessBirth.AddParent(Parent : TCitizen);
Begin
  if Assigned(Parent) THen Begin
    if Parent.Gender = GeMale Then Father := Parent Else Mother := Parent;
  End;
End;


Procedure TWitnessDeath.Execute(Target : TCitizen);
Var Event : TEvent;
    relationship : Trelationship;
Begin
  if Target.isDead Then Exit;

  relationship := Target.Relations.getRelationshipByCitizen(DeathOf);
  if Assigned(relationship) then
  Case relationship.Kind of
      relParent : Begin
                    Event := TEvent.Create(self);
                    Event.Title := 'mourned loss of parent ' + DeathOf.FullName;
                    Target.Events.Add(Event);
                  End;
      relChild  : Begin
                    Event := TEvent.Create(self);
                    Event.Title := 'mourned loss of child ' + DeathOf.FullName;
                    Target.Events.Add(Event);
                  End;
  End;
End;


end.
