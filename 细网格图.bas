'gemini协力
' 设置屏幕模式为 640x480, 16色
SCREEN 12
CLS

' 定义网格间距 (每 50 像素一个格子)
gridSize = 50
gridColor = 8 ' 灰色

' 1. 绘制垂直线并标注坐标
FOR x = 0 TO 640 STEP gridSize
    LINE (x, 0)-(x, 480), gridColor
    LOCATE 1, (x / 8) + 1 ' 在顶部显示坐标数值
    IF x < 640 THEN PRINT LTRIM$(STR$(x))
NEXT x

' 2. 绘制水平线并标注坐标
FOR y = 0 TO 480 STEP gridSize
    LINE (0, y)-(640, y), gridColor
    LOCATE (y / 16) + 1, 1 ' 在左侧显示坐标数值
    IF y < 480 THEN PRINT LTRIM$(STR$(y))
NEXT y

' 3. 绘制中心十字参考线 (颜色稍亮)
LINE (320, 0)-(320, 480), 7
LINE (0, 240)-(640, 240), 7

' --- 关键部分：防止出现 "Press Any Key" ---
' 使用一个死循环，直到按下 Esc 键才退出
LOCATE 29, 1: PRINT "Press ESC to Exit..."
DO
    ' 循环等待，不执行 END 语句
LOOP UNTIL INKEY$ = CHR$(27) ' 27 是 ESC 键的 ASCII 码

' 如果跳出了循环，再执行程序结束
CLS
SCREEN 0
END
