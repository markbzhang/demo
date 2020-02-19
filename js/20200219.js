//方法一：ES5 的 Object.defineProperty 实现

const obj = {
    value:''
};
//对 obj.value 进行拦截
Object.defineProperty(obj, "value", {
    get: function() {
      return value; //value 该属性对应的值。可以是任何有效的 JavaScript 值（数值，对象，函数等）。默认为 undefined。来自MDN
    },
    set: function(newValue) {
      value = newValue;//value 该属性对应的值。可以是任何有效的 JavaScript 值（数值，对象，函数等）。默认为 undefined。来自MDN
      document.querySelector("#xxxx").innerHTML = newValue; // 更新视图层
      document.querySelector("input").value = newValue; // 数据模型改变
    }
});



//方法二：ES6 的 Proxy 实现

const obj = {}
const newObj = new Proxy(obj, {
  get: function(target, key, receiver) {
    return Reflect.get(target, key, receiver)
  },
  set: function(target, key, value, receiver) {
    if(key === 'kkk') {
      document.querySelector('#xxxx').innerHTML = value;// 更新视图层
      document.querySelector('input').value = value;// 数据模型改变
    }
    return Reflect.set(target, key, value, receiver)
  }
})
//设置kkk值变化
newObj.kkk = 'hello,zhangbing';
