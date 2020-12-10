var array = ["上海", "北京", "杭州", "广东", "深圳", "西安"];
// localeCompare() 方法返回一个数字来指示一个参考字符串是否在排序顺序前面或之后或与给定字符串相同。
array = array.sort((item1, item2) => item1.localeCompare(item2));
// ["北京", "广东", "杭州", "上海", "深圳", "西安"]


//https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/localeCompare