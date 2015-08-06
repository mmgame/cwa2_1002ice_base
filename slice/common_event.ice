#define COMMON_EVENT

//每个单独的服务器有要这个这个接口，用作服务器间的响应
module baseice{
module event{
	//事件接口
	class IEvent{
	};
	
	////每个单独的服务器有要这个这个接口，用作服务器间的响应
	//1接口-监听接口
	interface IEventListener {
		["amd","ami"]void answer(IEvent event);//响应接口
	};
	
	//1接口-主题接口
	interface ISubject {
		["amd","ami"]void answer(IEvent event);//响应事件
		
		void register(IEventListener listener);//注册监听
		
		void unregister(IEventListener listener);//解除注册
	};
};
};