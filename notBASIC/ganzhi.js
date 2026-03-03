// 从命令行获取参数 (process.argv[2] 是你输入的第一个数字)
const inputRaw = process.argv[2];
const input = parseInt(inputRaw);

function getGanzhi(num) {
    if (isNaN(num) || num <= 0) {
        return "请输入有效的正整数，例如: node ganzhi.js 3515";
    }

    const nums = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
    const letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"];

    // 数字部分 (10进制循环)
    let numPart = nums[num % 10];

    // 字母部分 (12进制循环)
    let letterPart = letters[(num - 1) % 12];

    return numPart + letterPart;
}

console.log(`${input} 的结果: ${getGanzhi(input)}`);