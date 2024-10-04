unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Tarefa: TEdit;
    Prazo: TDateTimePicker;
    AddTarefa: TButton;
    RemoverTarefa: TButton;
    Concluida: TButton;
    procedure AddTarefaClick(Sender: TObject);
    procedure RemoverTarefaClick(Sender: TObject);
    procedure ConcluidaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AddTarefaClick(Sender: TObject);
var
  task, deadline, lista: string;
begin
  task := Tarefa.Text;
  deadline := DateToStr(Prazo.Date);

  // Verifica se a tarefa está preenchida
  if task = '' then
  begin
  ShowMessage('Digite uma tarefa antes de adicionar.');
  Exit;
  end;

  lista := task + ' | ' + deadline;

  ListBox1.Items.Add(lista);
  Prazo.Date := now;
  Tarefa.Clear;
end;

procedure TForm1.RemoverTarefaCLick(Sender: TObject);
begin
  if ListBox1.ItemIndex <> -1 then
  begin
    ListBox1.Items.Delete(ListBox1.ItemIndex);
  end
  else
  begin
    ShowMessage('Selecione uma tarefa para remover.');
  end;
end;

procedure TForm1.ConcluidaClick(Sender: TObject);
var
  completedTask: string;
begin
  if ListBox1.ItemIndex <> -1 then
  begin
    completedTask := ListBox1.Items[ListBox1.ItemIndex];
    ListBox1.Items[ListBox1.ItemIndex] := completedTask + ' [Concluída]';
  end
  else
  begin
    ShowMessage('Selecione uma tarefa para marcar como concluída.');
  end;
end;


end.
