#define WOW_ENTITY

#ifndef BASE_DAO
#include "common_basedao.ice" 
#endif

#ifndef COMMON_BASETYPE
#include "common_basetype.ice" 
#endif

//实体类
module wow{
module data{
module entity{
	 
	class AccountGeneralEntity extends baseice::basedao::IEntity {
			long accountId;            //账号id
			string account;            //账号
			int channel;            //渠道
			string password;            //密码
			long createTime;            //创建时间
			string rids;            //{区id：账号s}
	 };
	class AccountcountGeneralEntity extends baseice::basedao::IEntity {
			int aid;            //帐号服id
			string address;            //已使用地址
			long count;            //账号
			long version;            //版本
	 };
	class UsereconomyGeneralEntity extends baseice::basedao::IEntity {
			long userId;            //用户id
			int moneyType;            //货币类型
			int moneyCount;            //货币数量
	 };
	class EquipmentGeneralEntity extends baseice::basedao::IEntity {
			long userId;            //用户id
			int heroId;            //英雄id
			int positionId;            //装备位置id
			int equipmentLevel;            //装备等级
			int equipmentQuality;            //装备品质
			string plugs;            //插件
	 };
	class FormationGeneralEntity extends baseice::basedao::IEntity {
			long userId;            //用户id
			int type;            //阵容类型
			string heros;            //英雄阵容
			string retinues;            //侍从阵容
	 };
	class HeroGeneralEntity extends baseice::basedao::IEntity {
			long userId;            //用户id
			int heroId;            //英雄id
			int level;            //英雄等级
			int experience;            //经验
			int starLevel;            //星级
			int quality;            //品质
			string patienceTrain;            //耐性加成
			int trainState;            //是否保存培养
			string waitPatienceTrain;            //待选耐性加成
			int trainType;            //培养类型
	 };
	class ItemGeneralEntity extends baseice::basedao::IEntity {
			long userId;            //用户id
			int itemId;            //道具id
			int count;            //道具个数
	 };
	class MatchGeneralEntity extends baseice::basedao::IEntity {
			long userId;            //用户id
			int matchType;            //副本类型
			int matchKeyId;            //当前关卡
			string battleKeyIds;            //今天打过的副本
			string resetKeyIds;            //今天重置次数的副本
			long resetTime;            //副本次数cd
	 };
	class MatchStarGeneralEntity extends baseice::basedao::IEntity {
			long userId;            //用户id
			int matchType;            //副本类型
			int chapterId;            //章节id
			string chapterStars;            //章节星级
			string chapterScores;            //章节积分
	 };
	class MatchMopupGeneralEntity extends baseice::basedao::IEntity {
			long userId;            //用户id
			int mopupCount;            //扫荡次数
			long resetTime;            //扫荡cd
	 };
	class MatchShopGeneralEntity extends baseice::basedao::IEntity {
			long userId;            //用户id
			int shopType;            //商店类型
			int shopId;            //商店id
			long resetTime;            //刷新cd时间
			string goodsIndex;            //商品索引
			int refreshCount;            //刷新次数
			long creatTime;            //商店创建时间
	 };
	class MatchConcealGeneralEntity extends baseice::basedao::IEntity {
			long userId;            //用户id
			int concealId;            //隐藏关卡id
			long resetTime;            //上次出现时间
	 };
	class MatchAwardGeneralEntity extends baseice::basedao::IEntity {
			long userId;            //用户id
			int chapterId;            //章节id
			int awardStates;            //领奖状态
	 };
	class RegionGeneralEntity extends baseice::basedao::IEntity {
			int rid;            //账号id
			int useState;            //使用状态 
			int state;            //区服务状态
			string name;            //区名字
	 };
	class TestUserGeneralEntity extends baseice::basedao::IEntity {
			long userId;            //用户id
			int level;            //等级
			string name;            //名字
			int exp;            //经验
	 };
	class UserinfoGeneralEntity extends baseice::basedao::IEntity {
			long userId;            //用户id
			string name;            //昵称
			int level;            //角色等级
			int experience;            //经验
			int icon;            //头像
			int modifyNameCount;            //修改名字次数
			int power;            //体力
			int buyCount;            //购买体力次数
			long resetTime;            //体力cd
			string eventState;            //事件状态
			string functionState;            //功能开启状态
	 };
	class UserattrGeneralEntity extends baseice::basedao::IEntity {
			long userId;            //用户id
			int attrType;            //类型(userAttrKeyEnum)
			long attrValue;            //值
	 };
	class VipGeneralEntity extends baseice::basedao::IEntity {
			long userId;            //用户id
			int vipLevel;            //vip等级
			int vipExp;            //当前等级经验
			int rewardState;            //领奖状态
	 };
};
};
};