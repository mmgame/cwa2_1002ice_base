#define SERVER_ROOM

#ifndef COMMON_BASETYPE
#include "common_basetype.ice" 
#endif

#ifndef BASE_DAO
#include "common_basedao.ice" 
#endif

#ifndef COMMON_EVENT
#include "common_event.ice" 
#endif

module serverice{
module room{
	class FightList;
	class RoomInfo;
	
	//观看者，进攻者，防守者，待定
	enum TroopTypeEnum {Audit=0, Attack, Defend,Pending};
	//用户状态(未准备，准备）
	enum UserStateEnum{NotReady=1,Ready};
	//用户房间内行为(进入，退出，准备，取消准备，匹配，取消匹配）
	enum UserActionEnum{Enter=1,Exit,GoReady,CancelReady,Matchup,CancelMatchup};
	//房间状态（准备中，匹配中，战斗中）
	enum RoomStateEnum{NotPreparation=1,Preparation,Fighting};
	
	["java:type:java.util.ArrayList<baseice.basedao.IEntity>"] sequence<baseice::basedao::IEntity> EntityAList;
	["java:type:java.util.ArrayList<FightList>"] sequence<FightList> FightListAList;
	dictionary<long, FightList> UidFightListMap;
	dictionary<long, UserStateEnum> UidUserStateMap;
	dictionary<int,EntityAList> HidEquipmentEntityMap;
	["java:type:java.util.ArrayList<RoomInfo>"] sequence<RoomInfo> RoomInfoAList;
	
	
	//战斗列表
	class FightList{
		long uid;								//用户id
		EntityAList heroIds;					//英雄id
		EntityAList itemIds;					//道具id
		baseice::basedao::IEntity formationEntity;//阵容信息
		HidEquipmentEntityMap equipmentEntityMap;//装备
		string tid;								//队伍id
		TroopTypeEnum troopType;				//队伍类型
	};
	
   //用户状态改变
	class UserActionChangeInfo{
		long uid;								//用户id
		UserActionEnum userAction;              //用户行为
	};
	
	//战场信息
	class CurrentBattleInfo{
		string ip;								//战场服ip
		int port;								//战场服端口
		string battleId;				        //战场id
		int attRoom;//进攻方
		int defRoom;//防守方
		long creatTime;//创建时间
	};
	class RoomInfo{
		int rid;//房间id
		
		int battleKeyId;//战场keyid
		int fightCore;//队伍总战力值
		long masterId;//房主id
		UidFightListMap fightMap;//队伍列表
		baseice::basetype::LongAList lookers;//观看者列表
		UidUserStateMap stateMap;//用户状态
		RoomStateEnum roomState;//房间状态
		CurrentBattleInfo battleInfo;//战场信息
	};
	
	interface IRoomService{
		RoomInfo createRoom(long uid,int battleKeyId);//创建房间
		bool joinRoom(int roomId,long uid);//加入房间
		bool exitRoom(long uid);//退出房间
		bool ready(long uid);//准备
		bool cancelReady(long uid);//取消准备
		bool matchupRoom(long uid);//匹配房间
		bool cancelMatchupRoom(long uid);//取消匹配房间
		RoomInfo aKeyToJoin(long uid);//一键加入
		RoomInfo findRoom(int rid);//查找房间
		bool replaceHero(long uid,EntityAList hids,baseice::basedao::IEntity formationEntity,HidEquipmentEntityMap equipmentEntityMap);//设置出站英雄
		bool kickOut(long uid,long targetId);//踢人
		RoomInfo returnBack(long uid);//战场结束后回房间
		RoomInfoAList getRoomList();//房间列表
		bool matchupOutTime(long uid);//匹配超时
		int getRoomByUser(long uid);//获取当前用户所在房间信息
	};
	
	//房间匹配成功事件
	class MatchRoomSucceedEvent extends baseice::event::IEvent{
		baseice::basetype::LongAList uids;//推送的人
		string ip; //战场ip
		int port;//战场端口
		string battleId;//战场id
		int attRid;  //进攻方房间号
		int deRid;  //防守方房间号
	};
	//房间匹配超时事件
	class MatchRoomOutTimeEvent extends baseice::event::IEvent{
		baseice::basetype::LongAList uids;//推送的人
	};
	//用户状态改变事件（有人进入，退出，准备，取消准备。。。）
	class UserStateChangeEvent extends baseice::event::IEvent{
		baseice::basetype::LongAList uids;//推送的人
		UserActionChangeInfo uInfo;//
	};
	//
};
};