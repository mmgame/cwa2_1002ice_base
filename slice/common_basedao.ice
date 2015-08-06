#define BASE_DAO

#ifndef COMMON_BASETYPE
#include "common_basetype.ice" 
#endif

module baseice{
module basedao{
	class IEntity;
	["java:type:java.util.LinkedList<IEntity>"] sequence<IEntity> IEntityList;
	
	class IEntity{
		//int entityType;	//实体类型
		//int version;	//版本号（各个服持有的实体个一份，记录版本号，一切以数据服的为准）
		//long ctime;		//第一次取出来的时间
	};
	
	class IKey{
	};
	
		
	class DefaultKey extends basedao::IKey{
		string functionName;
		string param;//参数
	};
	
	interface IEntityDao{
		["amd","ami"] void insertEntity(IEntity entity);//插入实体
		["amd","ami"] void updateEntity(IEntity entity);//更新实体
		["amd","ami"] void removeEntity(IEntity entity);//删除实体
		["amd","ami"] void batchInsertEntity(IEntityList entitys);//批量添加
		["amd","ami"] void batchUpdateEntity(IEntityList entitys);//批量更新
		["amd","ami"] void batchRemoveEntity(IEntityList entitys);//批量删除
	};
	
	//-----------------------------------
	class SyncKey{
		string key;						//群组key
		int version;					//规则版本
	};
	
	//同步数据
	class SyncData{
		string key;								//群组key
		
		string dataType;						//数据类型
		baseice::basetype::ByteArray datas;		//实体数据
		
		int version;							//规则版本
	 	long updateVTime;						//版本更新时间
	};
	
	//数据同步接口
	interface ISyncDataOperation{
		//更新到其他服务器（可以异步或同步，同步数据）
		["amd","ami"] void syncToServer(SyncData sd);
		//获取从其他服务器
		["amd","ami"] SyncData syncFromServer(SyncKey sk);
	};
};
};