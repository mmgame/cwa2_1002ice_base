#define SERVER_FOYER

#ifndef COMMON_EVENT
#include "common_event.ice" 
#endif

#ifndef WOW_ENTITY
#include "wow_entity.ice" 
#endif

//大厅服
module serverice{
module foyer{
	//服务器状态{0 New  新服; 1 Busy 繁忙; 2 Full 爆满}
	enum ServerStateEnum {New=1, Busy, Full};//
	
	//服务器使用状态{0 Unavailable不可使用; 1 Available 可以使用}
	enum ServerUseStateEnum {Unavailable=0,Available};//

	//大厅服务接口
	interface IFoyerService{
		
	};
	
	//-------------------------------------------------
	//开放新区事件
	class NewRegionEvent extends baseice::event::IEvent{
		wow::data::entity::RegionGeneralEntity re;
	};
};
};