const fs = require('fs');
const path = require('path');

// 获取命令行传入的第一个参数 (即文件路径)
const filePath = process.argv[2];

if (!filePath) {
    console.error('错误：请提供 smc 文件路径。');
    console.log('用法示例：node smc2u2fi.js "D:\\500KFS-0001.smc"');
    process.exit(1);
}

// 检查文件是否存在
if (!fs.existsSync(filePath)) {
    console.error(`错误：找不到文件 "${filePath}"`);
    process.exit(1);
}

fs.readFile(filePath, (err, data) => {
    if (err) {
        console.error('读取文件失败:', err);
        return;
    }

    // 检查文件长度是否足够 (0x0C 是第13个字节)
    if (data.length > 0x0C) {
        // 修改第 0x0C 位置的字节为 0x03
        data[0x0C] = 0x03;

        // 生成新文件名 (例如: 原名_mod.smc)
        const parsedPath = path.parse(filePath);
        const newPath = path.join(parsedPath.dir, parsedPath.name + '_mod' + parsedPath.ext);

        fs.writeFile(newPath, data, (err) => {
            if (err) {
                console.error('保存文件失败:', err);
            } else {
                console.log('--- 处理成功 ---');
                console.log(`原始文件: ${filePath}`);
                console.log(`修改后文件: ${newPath}`);
                console.log('第 0x0C 字节已改为 03');
            }
        });
    } else {
        console.error('错误：文件太小，没有 0C 偏移量。');
    }
});
