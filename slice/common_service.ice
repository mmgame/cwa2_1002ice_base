#define COMMON_SERVICE

#ifndef COMMON_EVENT
#include "common_event.ice" 
#endif

//整个系统按【功能模块】去划分
module baseice{
module service{
	class ServiceInfo;
	class FunctionMenu;
	
	dictionary<string, ServiceInfo> StringServiceInfoHMap;
	["java:type:java.util.LinkedList<FunctionMenu>"] sequence<FunctionMenu> FunctionMenuLList;
	
	//0游戏Config（配置）系统;
	//1游戏Logic（逻辑）系统;
	//2游戏Foyer（大厅）系统
	//3游戏Account（账号）系统
	//4游戏Gm系统;
	//5游戏Log（日志）系统;
	//6游戏Pay（付费）系统
	//7游戏Battle（战场）系统
	//8游戏Proto（原型）系统
	//9游戏Room（房间）系统
	//99游戏Test（测试）系统
	enum FunctionTypeEnum { Config=0 ,Logic, Foyer, Account, Gm, Log, Pay, Battle, Proto, Room, Test=99 };
	
	//网络协议{1udp,2tcp,3udt}
	enum NetProtocolEnum { udp=1 ,tcp ,udt };
	
	//功能事件类型
	enum FunctionEventEnum { ChangState=1,Add,Del };
	
	//功能状态{0不可用，1可以}
	enum FunctionStateEnum { Unavailable=0,Available };
	
	//功能id
	class FunctionId{
		int gid;					//组id
		int ftype;					//【功能模块】类型
		int fkey;					//【功能模块】区别同类的key
	};
	
	//服务信息
	class ServiceInfo{
		string packageName;			//包名
		string interfcName;			//接口类名
		Object* server;				//服务接口代理
	};
	
	//功能网络配置
	class FunctionAddress{
		string ip;					//ip地址
		int port;					//端口
		NetProtocolEnum protocol;	//网络协议
		string adapterName;			//适配器名字
	};
	
	//功能菜单
	class FunctionMenu {
		int version;						//功能版本
		FunctionId fid;						//功能id
		FunctionAddress fa;					//功能网络配置
		StringServiceInfoHMap serviceInfos;	//从接口列表
	};
	
	//--------------------------------------------------
	//主接口（功能模块的默认接口）
	interface IMasterService{
		//得到功能service菜单
		FunctionMenu getFunctionMenu();
	};
	
	//-------------------------------------------------
	exception ServiceError{ 
		int errorType;			//错误类型
		string reason; 			//错误原因
	}; 
};
};
