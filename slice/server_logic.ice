#define SERVER_LOGIC

#ifndef COMMON_EVENT
#include "common_event.ice" 
#endif

#ifndef COMMON_SERVICE
#include "common_service.ice" 
#endif

//逻辑服
module serverice{
module logic{

	//逻辑服务接口
	interface ILogicService{
		int getOnlineCount();							//获取连接数量
		baseice::service::FunctionAddress getAddress();	//获得地址
	};
	//-------------------------------------------------
};
};