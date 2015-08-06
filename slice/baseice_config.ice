#define BASEICE_CONFIG

#ifndef BASE_DAO
#include "common_basedao.ice" 
#endif

#ifndef COMMON_BASETYPE
#include "common_basetype.ice" 
#endif

//实体类
module baseice{
module data{
module config{
	 
	class IecServiceGeneralConfig extends baseice::basedao::IEntity {
			int gid;            //组id
			int ftype;            //功能类型
			string key;            //服务key
			int version;            //版本
			int available;            //应用是否可用
			int initPriority;            //初始化优先级
			string groupIds;            //ice注册到指定zk的 groupIds {-1是全部组;指定组0,1,2}
			int port;            //端口
			string protocol;            //协议
			string adapterName;            //适配名
			string packageNames;            //包名
			string interfcNames;            //接口名
	 };
	class FunctionServiceGeneralConfig extends baseice::basedao::IEntity {
			int gid;            //组id
			int ftype;            //功能类型
			string key;            //服务key
			int version;            //版本
			int available;            //应用是否可用
			int initPriority;            //初始化优先级
			string groupIds;            //创建不同组的function服务
			string groupFilters;            //组过滤
			string functionFilters;            //功能过滤
	 };
	class MemberServiceGeneralConfig extends baseice::basedao::IEntity {
			int gid;            //组id
			int ftype;            //功能类型
			string key;            //key
			int version;            //版本
			int available;            //应用是否可用
			int initPriority;            //初始化优先级
			string groupIds;            //groupIds
	 };
	class DatabaseServiceGeneralConfig extends baseice::basedao::IEntity {
			int gid;            //组id
			int ftype;            //功能类型
			string key;            //key
			int version;            //版本
			int available;            //应用是否可用
			int initPriority;            //初始化优先级
			string groupIds;            //groupIds
			string driverClass;            //驱动类
			int minPool;            //最小池大小
			int initialPool;            //初始化池大小
			int maxPool;            //最大池大小
			int acquireIncrement;            //
			int maxStatements;            //
			int maxStatementsPerConnection;            //
			int maxIdleTime;            //最大空闲时间
			int checkoutTimeout;            //超时检测
	 };
	class NettyServiceGeneralConfig extends baseice::basedao::IEntity {
			int gid;            //组id
			int ftype;            //功能类型
			string key;            //服务key
			int version;            //版本
			int available;            //应用是否可用
			int initPriority;            //初始化优先级
			int listening;            //监听端口
			int readerIdleTime;            //读空闲
			int writerIdleTime;            //写空闲
			int allIdleTime;            //全部空闲
			int subReactorThreadNum;            //子反应器线程数量
			int handlerThreadNum;            //处理器线程数
	 };
	class MinaServiceGeneralConfig extends baseice::basedao::IEntity {
			int gid;            //组id
			int ftype;            //功能类型
			string key;            //服务key
			int version;            //版本
			int available;            //应用是否可用
			int initPriority;            //初始化优先级
			int listening;            //监听端口
			int heartbeatId;            //心跳
			int forwardEvent;            //XXX
			int ideltimeout;            //XXX
			int heartbeatrate;            //XXX
			int messagemaxpackage;            //XXX
			int connectTimeout;            //XXX
			int minpool;            //XXX
			int maxpool;            //XXX
			int allowedInterval;            //XXX
	 };
	class HttpServiceGeneralConfig extends baseice::basedao::IEntity {
			int gid;            //组id
			int ftype;            //功能类型
			string key;            //key
			int version;            //版本
			int available;            //应用是否可用
			int initPriority;            //初始化优先级
			int listening;            //监听端口
			int minpool;            //最小池
			int maxpool;            //最大池
	 };
	class ProtoServiceGeneralConfig extends baseice::basedao::IEntity {
			int gid;            //组id
			int ftype;            //功能类型
			string key;            //key
			int version;            //版本
			int available;            //应用是否可用
			int initPriority;            //初始化优先级
			string groupIds;            //groupIds
			string protoNames;            //
			string rids;            //rids {-1是全部其他组;指定组0,1,2}
	 };
	class DataTimeoutServiceGeneralConfig extends baseice::basedao::IEntity {
			int gid;            //组id
			int ftype;            //功能类型
			string key;            //key
			int version;            //版本
			int available;            //应用是否可用
			int initPriority;            //初始化优先级
			int timeout;            //超时时间(ms)
			string expression;            //检查表达式
	 };
	class DatabaseInfoGeneralConfig extends baseice::basedao::IEntity {
			int gid;            //组id
			int dbid;            //库id(唯一的)
			string ip;            //数据库ips
			int port;            //数据库端口
			string dbName;            //数据库名
			string user;            //用户名
			string password;            //密码
			string regionMap;            //区映射(唯一的)
			string mybatis;            //mybatis配置路径
	 };
	class FunctionZKInfoGeneralConfig extends baseice::basedao::IEntity {
			int gid;            //组id
			string hosts;            //zk的hosts
			int sessionTimeout;            //zk的session超时
			string rootPath;            //zk的根路径
	 };
	class MemberZKInfoGeneralConfig extends baseice::basedao::IEntity {
			int gid;            //组id
			string hosts;            //zk的hosts
			int sessionTimeout;            //zk的session超时
			string rootPath;            //zk的根路径
	 };
};
};
};