debugger;
new Vue({
	el:"#notebook",
	data(){
		return{
			contents:'**This is a note.**',
			notes:[]
		}
	},
	computed:{
		notePreView(){
           
			//marked() 是一款插件，使用特定的符号实现html标签才能够实现的功能（超链接，文本加粗，字体倾斜，表格等）
			return this.contents + '@@@';
		},
		addButtonTitle(){
           
			return this.notes.length + 'note(s) already';
		}
	},
	watch:{
		/*content:{
			handler(val,oldVal){
				console.log('new note:',val,'old note:',oldVal);
			},
			immediate:false  //立即执行观察者中的handler
		}*/
		
		/*
		 当观察者不需要其他参数时，如deep，immediate，content可忽略handler
		 
		 contents为data中的contents属性
		 watch实质上观察的就是contents的变换过程
		 * */
		contents:{
			handler:'saveNote'	//调用自定义函数的回掉
		}
	},
	/*自定义函数*/
	methods:{
		saveNote(){
           
			//this.content为data中的content，因为conten的值由v-model实时绑定到html标签的
			localStorage.setItem('content',this.contents);//将修改的值存放（覆盖）到content中
		},
		addNote(){
           
			const time = Date.now();
			//Default new note
			const note = {
				id:String(time),
				title:'New note' + (this.notes.length + 1),
				content:'**Hi!** This notebook is using [markdown](#) for formatting! ',
				created:time,
				favorite:false
			}
			this.notes.push(note);//将初始化的对象添加到对象数组中
		}
	},
	created(){
       
		//Vue创建完成后，修改contents的值，同时，观察者也会被触发
		this.contents = localStorage.getItem("content") || "you can write in **markdown**";
	}
});

/*
 	----Vue的生命周期钩子函数  (LifeCycle hooks)----
 	beforeCreate:完成Vue的实例，但是还没有做任何处理     new Vue({});
 	created:Vue实例准备就绪，并且填充了属性，但是此时的Vue并没有加载到DOM中
 	beforeMount:Vue实例挂载到页面前触发
 	mounted:Vue实例挂载到页面后触发
 	beforeUpdate:当Vue实例需要被更新时触发，通常是data或computed属性被修改时触发
 	updated：当Vue更新到模板中，但是DOM中可能还没有收到影响时触发
 	beforeDestory:在Vue实例被销毁前触发
 	destoryed:当Vue实例被销毁后触发
 
 * */