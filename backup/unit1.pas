unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormApp }

  TFormApp = class(TForm)
    btnAdd: TButton;
    btnDelete: TButton;
    EditTask: TEdit;
    ListTask: TListBox;
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure EditTaskKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  FormApp: TFormApp;

implementation

{$R *.lfm}

{ TFormApp }

procedure TFormApp.btnAddClick(Sender: TObject);
var
  task : String;
begin
  task := EditTask.Text;
  if(not(task.IsEmpty)) then
     ListTask.Items.Add(task)
  else MessageDlg('Peringatan','Apa mau ditambah, belum adapi inputannya',mtWarning,[mbOK],0);

end;

procedure TFormApp.btnDeleteClick(Sender: TObject);
var
  item : byte;
begin
  item := ListTask.Count;
  if (ListTask.ItemIndex>-1) then
     ListTask.DeleteSelected
  else
    begin
     if(item>0) then MessageDlg('Peringatan','Anda belum memilih yang ingin dihapus',mtWarning,[mbOK],0)
     else
         MessageDlg('Peringatan','Tidak ada bisa dihapus, karena masih kosong',mtWarning,[mbOK],0)
    end;
end;

procedure TFormApp.EditTaskKeyPress(Sender: TObject; var Key: char);
begin
  if(Key=#13) then
  btnAdd.Click;
end;





end.

