'gemini生成
' 设置为标准文本模式 80x25
SCREEN 0
WIDTH 80, 25
COLOR 7, 0
CLS

' 1. 绘制横向标尺（列号 1-80）
' 第一行显示十位数字，第二行显示个位数字
FOR c = 1 TO 80
    ' 十位数
    IF c MOD 10 = 0 THEN
        LOCATE 1, c: COLOR 11: PRINT LTRIM$(STR$(c / 10));
    END IF
    ' 个位数
    LOCATE 2, c: COLOR 3: PRINT RIGHT$(STR$(c), 1);
NEXT c

' 2. 绘制纵向标尺（行号 1-25）
' 第 1-3 列留给行标
FOR r = 3 TO 25
    LOCATE r, 1: COLOR 14: PRINT USING "##"; r;
NEXT r

' 3. 填充网格参考点（从第3行、第4列开始）
COLOR 8 ' 使用暗灰色
FOR r = 3 TO 25
    FOR c = 4 TO 80
        ' 每隔 5 个点画一个加号，方便快速计数
        IF (c - 3) MOD 5 = 0 AND (r - 2) MOD 5 = 0 THEN
            LOCATE r, c: PRINT "+";
        ELSE
            LOCATE r, c: PRINT ".";
        END IF
    NEXT c
NEXT r

' --- 关键：保持画面不退出且不显示系统提示 ---
COLOR 15: LOCATE 25, 40: PRINT "< ESC to Exit >";
DO
    ' 这里是一个空循环，程序会永远停在这里
    ' 除非检测到按下 ESC 键 (ASCII 27)
    k$ = INKEY$
LOOP UNTIL k$ = CHR$(27)

' 清理并退出
CLS
END
