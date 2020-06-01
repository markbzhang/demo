var urls = [
    "https://www.xxx1.com/bbb.png",
    "https://www.xxx2.com/bbb.png",
    "https://www.xxx3.com/bbb.png",
    "https://www.xxx4.com/bbb.png",
    "https://www.xxx5.com/bbb.png",
    "https://www.xxx6.com/bbb.png",
    "https://www.xxx7.com/bbb.png",
    "https://www.xxx8.com/bbb.png",   
  ];
  function loadImg(url) {
    return new Promise((resolve, reject) => {
      const img = new Image();
      img.onload = function() {
        console.log("一张图片加载完成");
        resolve(img);
      };
      img.onerror = function() {
          reject(new Error('Could not load image at' + url));
      };
      img.src = url;
    });
  }



  function limitLoad(urls, handler, limit) {
    let sequence = [].concat(urls); // 复制urls
    // 这一步是为了初始化 promises 这个"容器"
    let promises = sequence.splice(0, limit).map((url, index) => {
      return handler(url).then(() => {
        // 返回下标是为了知道数组中是哪一项最先完成
        return index;
      });
    });
    // 注意这里要将整个变量过程返回，这样得到的就是一个Promise，可以在外面链式调用
    return sequence
      .reduce((pCollect, url) => {
        return pCollect
          .then(() => {
            return Promise.race(promises); // 返回已经完成的下标
          })
          .then(fastestIndex => { // 获取到已经完成的下标
              // 将"容器"内已经完成的那一项替换
            promises[fastestIndex] = handler(url).then(
              () => {
                return fastestIndex; // 要继续将这个下标返回，以便下一次变量
              }
            );
          })
          .catch(err => {
            console.error(err);
          });
      }, Promise.resolve()) // 初始化传入
      .then(() => { // 最后三个用.all来调用
        return Promise.all(promises);
      });
  }
  limitLoad(urls, loadImg, 3)
    .then(res => {
      console.log("图片全部加载完毕");
      console.log(res);
    })
    .catch(err => {
      console.error(err);
    });
  


 //既然要求是保证每次并发请求的数量为3，那么我们可以先请求urls中的前面三个(下标为0,1,2)，并且请求的时候使用Promise.race()来同时请求，三个中有一个先完成了(例如下标为1的图片)，我们就把这个当前数组中已经完成的那一项(第1项)换成还没有请求的那一项(urls中下标为3)。
// 直到urls已经遍历完了，然后将最后三个没有完成的请求(也就是状态没有改变的Promise)用Promise.all()来加载它们。
