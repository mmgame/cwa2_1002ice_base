#define SERVER_BATTLE

#ifndef COMMON_EVENT
#include "common_event.ice" 
#endif

#ifndef SERVER_ROOM
#include "server_room.ice" 
#endif

//战场
module serverice{
module battle{
	["java:type:java.util.ArrayList<serverice.room.FightList>"] sequence<serverice::room::FightList> FightListAList;

    //战斗列表
	class BattleInfo{
		string ip;								//战场服ip
		int port;								//战场服端口
		string battleId;				        //战场id
	};
    
	//战场服务接口
	interface IBattleService{
		//创建一个战场（战场原型id，参与者id列表）
		BattleInfo createBattle(int battleKeyId, FightListAList fightLists);
	};
	
    //战场结束事件
	class BattleOverEvent extends baseice::event::IEvent{
	    string battleId;//战场id
	};
};
};
