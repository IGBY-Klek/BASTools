'由Gemini与DeepSeek协力
VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Jugotrans"
   ClientHeight    =   4020
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4605
   Icon            =   "2.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4020
   ScaleWidth      =   4605
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Run!"
      Height          =   615
      Left            =   1440
      TabIndex        =   4
      Top             =   2760
      Width           =   1935
   End
   Begin VB.OptionButton Option2 
      Caption         =   "C2L"
      Height          =   255
      Left            =   2040
      TabIndex        =   3
      Top             =   1560
      Width           =   735
   End
   Begin VB.OptionButton Option1 
      Caption         =   "L2C"
      Height          =   255
      Left            =   2040
      TabIndex        =   2
      Top             =   960
      Width           =   855
   End
   Begin VB.TextBox Text2 
      Height          =   2055
      Left            =   3000
      Locked          =   -1  'True
      TabIndex        =   1
      Text            =   "Text2"
      Top             =   480
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      Height          =   2055
      Left            =   480
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   480
      Width           =   1335
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Function ConvertSerbian(ByVal txt As String, ToCyrillic As Boolean) As String
    Dim lat As Variant, cyr As Variant
    Dim i As Integer
    
 lat = Array("Dž", "dž", "DŽ", "Lj", "lj", "LJ", "Nj", "nj", "NJ", _
                "A", "a", "B", "b", "V", "v", "G", "g", "D", "d", "Đ", "đ", _
                "E", "e", "Ž", "ž", "Z", "z", "I", "i", "J", "j", "K", "k", _
                "L", "l", "M", "m", "N", "n", "O", "o", "P", "p", "R", "r", _
                "S", "s", "T", "t", "Ć", "ć", "U", "u", "F", "f", "H", "h", _
                "C", "c", "Č", "č", "Š", "š", "x")
                
    ' 对应的西里尔文列表
    cyr = Array("Џ", "џ", "Џ", "Љ", "љ", "Љ", "Њ", "њ", "Њ", _
                "А", "а", "Б", "б", "В", "в", "Г", "г", "Д", "д", "Ђ", "ђ", _
                "Е", "е", "Ж", "ж", "З", "з", "И", "и", "Ј", "ј", "К", "к", _
                "Л", "л", "М", "м", "Н", "н", "О", "о", "П", "п", "Р", "р", _
                "С", "с", "Т", "т", "Ћ", "ћ", "У", "у", "Ф", "ф", "Х", "х", _
                "Ц", "ц", "Ч", "ч", "Ш", "ш", "кс")



    If ToCyrillic Then
        For i = LBound(lat) To UBound(lat)
            txt = CustomReplace(txt, lat(i), cyr(i))
        Next i
    Else
        For i = LBound(cyr) To UBound(cyr)
            txt = CustomReplace(txt, cyr(i), lat(i))
        Next i
    End If
    
    ConvertSerbian = txt
End Function
Private Function CustomReplace(ByVal Source As String, ByVal Find As String, ByVal ReplaceWith As String) As String
    Dim i As Long
    Dim Result As String
    
    Result = Source
    i = InStr(1, Result, Find, vbTextCompare)
    
    Do While i > 0
        Result = Left(Result, i - 1) & ReplaceWith & Mid(Result, i + Len(Find))
        i = InStr(i + Len(ReplaceWith), Result, Find, vbTextCompare)
    Loop
    
    CustomReplace = Result
End Function

Private Sub Command1_Click()
Text2.Text = ConvertSerbian(Text1.Text, Option1.Value)
End Sub

