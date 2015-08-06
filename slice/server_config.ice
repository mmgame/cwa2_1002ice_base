#define SERVER_CONFIG

#ifndef COMMON_SERVICE
#include "common_service.ice" 
#endif

#ifndef COMMON_BASETYPE
#include "common_basetype.ice" 
#endif

#ifndef BASEICE_CONFIG
#include "baseice_config.ice" 
#endif

#ifndef COMMON_EVENT
#include "common_event.ice" 
#endif

//配置监控服务器
module serverice{
module config{
	//-------------------------------------------------
	//配置类型{iec=1,Function,Database,Netty,Mina,Http,Protoclient,Member,DataTimeout}
	enum ServiceConfigTypeEnum { Iec=1,Function,Database,Netty,Mina,Http,Protoclient,Member,DataTimeout };
	
	class ServerInfo{
		int fid;		//功能服务的id
		string address;		//连接过来的ip
		long version;		//版本号，就是服务器的启动时间
		
		baseice::data::config::DatabaseInfoGeneralConfig dbInfo;	//配置信息库
	};
	
	//配置服务
	interface IConfigService{
		ServerInfo register(int gid, int functionType); 	//注册服务器
	};
	
	//-------------------------------------------
	//添加区事件
	class NewRegionDBEvent extends baseice::event::IEvent{
		int gid;							//组id
		int dbid;							//变更的数据库id	
		baseice::basetype::IntLList rids;	//新加的区
	};
	
	//新加区
	class NewRegionEvent extends baseice::event::IEvent{
		int gid;				//组id
		int rid;				//新加区信息	
	};
};
};
